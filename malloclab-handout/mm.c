/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
 *
 * In this naive approach, a block is allocated by simply incrementing
 * the brk pointer.  A block is pure payload. There are no headers or
 * footers.  Blocks are never coalesced or reused. Realloc is
 * implemented directly using mm_malloc and mm_free.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 */
#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "memlib.h"
#include "mm.h"

/*********************************************************
 * NOTE TO STUDENTS: Before you do anything else, please
 * provide your team information in the following struct.
 ********************************************************/
team_t team = {
    /* Team name */
    "NULL",
    /* First member's full name */
    "WBC",
    /* First member's email address */
    "3052752943@qq.com",
    /* Second member's full name (leave blank if none) */
    "",
    /* Second member's email address (leave blank if none) */
    ""};

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT - 1)) & ~0x7)

#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

// Custom macro
// 字大小和双字大小
#define WSIZE 4
#define DSIZE 8
// 当堆内存空间不够时，向内核申请的堆空间
#define CHUNKSIZE (1 << 12)
#define GET(p) (*(unsigned int *)(p))
// 将 val 放入 p 开始的4字节
#define PUT(p, val) (*(unsigned int *)(p) = (val))
// 获得头部和脚部的编码
#define PACK(size, alloc) ((size) | (alloc))
// 从头部或脚部获得块大小和已分配位
#define GET_SIZE(p) (*(unsigned int *)(p) & ~0x7)
#define GET_ALLOC(p) (*(unsigned int *)(p)&0x1)
// 获得块的头部和脚部
#define HDRP(bp) ((char *)bp - WSIZE)
#define FTRP(bp) ((char *)bp + GET_SIZE(HDRP(bp)) - DSIZE)
// 获得上一个块和下一个块
#define PREV_BLKP(bp) ((char *)bp - GET_SIZE((char *)(bp)-DSIZE))
#define NEXT_BLKP(bp) ((char *)bp + GET_SIZE(HDRP(bp)))

// 获得块中记录的前驱和后继
#define PRED(bp) ((char *)(bp) + WSIZE)
#define SUCC(bp) ((char *)(bp))
// 获取前驱和后继的地址
#define PRED_BLKP(bp) (GET(PRED(bp)))
#define SUCC_BLKP(bp) (GET(SUCC(bp)))

#define NONE_BLKP (unsigned int)-1 // 表示没有前驱或后继

#define MAX(x, y) ((x) > (y) ? (x) : (y))

static char *heap_listp;
static char *listp;

static void *expend_heap(size_t words);

// 立即合并
static void *imme_coalesce(void *bp);
// 延迟合并
static void delay_coalesce(void);

// 首次适配
static void *first_fit(size_t asize);
// 最佳适配
static void *best_fit(size_t asize);

// 添加和删除块
static void *add_block(void *bp);
static void delete_block(void *bp);

// 获取对应大小所在的块索引
static int get_index_by_size(size_t size);

// LIFO 策略
static void *LIFO(void *bp, void *root);
// 地址顺序策略
static void *address_order(void *bp, void *root);

static void place(void *bp, size_t asize);

void debug(char *msg) {
  printf("\n%s\n", msg);
  fflush(stdout);
}

// 注: 大小类设计为
// {16-31},{32-63},{64-127},{128-255},{256-511},{512-1023},{1024-2047},{2048-4095},{4096-inf}
/*
 * mm_init - initialize the malloc package.
 */
int mm_init(void) {
  mem_init();
  if ((heap_listp = mem_sbrk(12 * WSIZE)) == (void *)-1) { // 申请12字空间
    return -1;
  }

  // 因为最小块包含了头部、脚部、前驱和后继，所以最小块大小为16字节（4字）
  // 赋值为 -1，即 unsigned int 的最大值
  PUT(heap_listp + 0 * WSIZE, NONE_BLKP); // {16-31}
  PUT(heap_listp + 1 * WSIZE, NONE_BLKP); // {32-63}
  PUT(heap_listp + 2 * WSIZE, NONE_BLKP); // {64-127}
  PUT(heap_listp + 3 * WSIZE, NONE_BLKP); // {128-255}
  PUT(heap_listp + 4 * WSIZE, NONE_BLKP); // {256-511}
  PUT(heap_listp + 5 * WSIZE, NONE_BLKP); // {512-1023}
  PUT(heap_listp + 6 * WSIZE, NONE_BLKP); // {1024-2047}
  PUT(heap_listp + 7 * WSIZE, NONE_BLKP); // {2048-4095}
  PUT(heap_listp + 8 * WSIZE, NONE_BLKP); // {4096-inf}

  // 序言块和结尾块
  PUT(heap_listp + 9 * WSIZE, PACK(DSIZE, 1));
  PUT(heap_listp + 10 * WSIZE, PACK(DSIZE, 1));
  PUT(heap_listp + 11 * WSIZE, PACK(0, 1));

  listp = heap_listp;
  heap_listp += 10 * WSIZE; // 指向序言块有效载荷的指针
  if (expend_heap(CHUNKSIZE / WSIZE) == NULL) {
    return -1;
  }
  return 0;
}

/*
 * mm_malloc - Allocate a block by incrementing the brk pointer.
 *     Always allocate a block whose size is a multiple of the alignment.
 */
void *mm_malloc(size_t size) {
  if (size == 0) {
    return NULL;
  }
  // 满足最小块要求和对齐要求，size是有效负荷大小
  size_t asize = size <= DSIZE
                     ? (2 * DSIZE)
                     : DSIZE * ((size + (DSIZE) + (DSIZE - 1)) / DSIZE);
  void *bp;
  // 首次匹配
  // if ((bp = first_fit(asize)) != NULL) {
  //   place(bp, asize);
  //   return bp;
  // }

  // 最佳适配
  if ((bp = first_fit(asize)) != NULL) {
    place(bp, asize);
    return bp;
  }

  // 否则扩堆
  if ((bp = expend_heap(MAX(CHUNKSIZE, asize) / WSIZE)) == NULL) {
    return NULL;
  }
  place(bp, asize);
  return bp;
}

/*
 * mm_free - Freeing a block does nothing.
 */
void mm_free(void *ptr) {
  size_t size = GET_SIZE(HDRP(ptr));
  PUT(HDRP(ptr), PACK(size, 0));
  PUT(FTRP(ptr), PACK(size, 0));

  // 立即合并
  ptr = imme_coalesce(ptr);
  add_block(ptr);
}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size) {
  size_t asize, new_bp_size;
  void *new_bp;

  /* 根据题目要求对特殊情况进行了判定 */
  if (ptr == NULL) {
    return mm_malloc(size);
  }
  if (size == 0) {
    mm_free(ptr);
    return NULL;
  }

  asize = size <= DSIZE ? 2 * DSIZE
                        : DSIZE * ((size + DSIZE + (DSIZE - 1)) / DSIZE);
  new_bp = imme_coalesce(ptr); // 先尝试一下在 ptr 旁边是否有足够的空闲
  new_bp_size = GET_SIZE(HDRP(new_bp)); // 指向能够合并得到的最大空闲块

  PUT(HDRP(new_bp), PACK(new_bp_size, 1));
  PUT(FTRP(new_bp), PACK(new_bp_size, 1));

  if (new_bp != ptr) { // 如果合并了之前的空闲块，那么直接将原本的内容前移
    memmove(new_bp, ptr, GET_SIZE(HDRP(ptr)) - DSIZE);
  }

  if (new_bp_size == asize) {
    return new_bp;
  } else if (new_bp_size > asize) {
    size_t remain_size = new_bp_size - asize;
    if (remain_size >= 2 * DSIZE) {
      PUT(HDRP(new_bp), PACK(asize, 1));
      PUT(FTRP(new_bp), PACK(asize, 1));
      PUT(HDRP(NEXT_BLKP(new_bp)), PACK(remain_size, 0));
      PUT(FTRP(NEXT_BLKP(new_bp)), PACK(remain_size, 0));
      add_block(NEXT_BLKP(new_bp));
    }
    return new_bp;
  } else { // 只能重新进行分配
    ptr = mm_malloc(asize);
    if (ptr == NULL) {
      return NULL;
    }
    memmove(ptr, new_bp, new_bp_size - DSIZE); // 迁移
    mm_free(new_bp);
    return ptr;
  }
}

static void *expend_heap(size_t words) {
  size_t size;
  void *bp;
  size = (words % 2 ? (words + 1) : words) * WSIZE;
  if ((bp = mem_sbrk(size)) == (void *)-1) {
    return NULL;
  }

  PUT(HDRP(bp), PACK(size, 0));         // 设置头部
  PUT(FTRP(bp), PACK(size, 0));         // 设置脚部
  PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1)); // 设置新的结尾块

  PUT(PRED(bp), -1);
  PUT(SUCC(bp), -1);
  // 立即合并
  bp = imme_coalesce(bp); // 合并出一个新的空闲块
  bp = add_block(bp); // 再将这个新的空闲块加入到新的空闲链表中
  return bp;
}

static void *imme_coalesce(void *bp) {

  size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(bp))); // 获得上一个块的已分配位
  size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp))); // 获得下一个块的已分配位
  size_t size = GET_SIZE(HDRP(bp));
  if (prev_alloc && next_alloc) { // 如果前后两个块都已经分配了
    return bp;
  } else if (prev_alloc && !next_alloc) { // 如果后一个块还未分配
    size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
    delete_block(NEXT_BLKP(bp));
    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
  } else if (!prev_alloc && next_alloc) {
    size += GET_SIZE(FTRP(PREV_BLKP(bp)));
    delete_block(PREV_BLKP(bp));
    PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    bp = PREV_BLKP(bp);
  } else {
    size += GET_SIZE(HDRP(NEXT_BLKP(bp))) + GET_SIZE(FTRP(PREV_BLKP(bp)));
    delete_block(PREV_BLKP(bp));
    delete_block(NEXT_BLKP(bp));
    PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
    PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
    bp = PREV_BLKP(bp);
  }
  return bp;
}

static void delay_coalesce(void) {
  // 遍历链表中所有的空闲块，如果是空闲块，则尝试将其与周围的块进行合并
  for (void *bp = heap_listp; GET_SIZE(HDRP(bp)) != 0; bp = NEXT_BLKP(bp)) {
    if (!GET_ALLOC(HDRP(bp))) {
      bp = imme_coalesce(bp);
    }
  }
}

static void *first_fit(size_t asize) {
  // size_t size;

  // for (void *bp = heap_listp; (size = GET_SIZE(HDRP(bp))) != 0;
  //      bp = NEXT_BLKP(bp)) {
  //   if (size > asize && !GET_ALLOC(HDRP(bp))) {
  //     return bp;
  //   }
  // }

  // return NULL;
  int index = get_index_by_size(asize);
  void *succ;
  while (index <= 8) {
    succ = listp + index * WSIZE;
    while ((succ = SUCC_BLKP(succ)) != NONE_BLKP) {
      if (GET_SIZE(HDRP(succ)) >= asize && !GET_ALLOC(HDRP(succ))) {
        return succ;
      }
    }
    ++index;
  }
  return NULL;
}

static void *best_fit(size_t asize) {
  // size_t size;
  // void *best = NULL; // 最佳的块

  // size_t min_size = 0;

  // for (void *bp = heap_listp; (size = GET_SIZE(bp)) != 0; bp = NEXT_BLKP(bp))
  // {
  //   if (size >= asize && !GET_ALLOC(HDRP(bp)) &&
  //       (min_size == 0 || min_size > size)) {
  //     min_size = size;
  //     best = bp;
  //   }
  // }
  // return best;
  int index = get_index_by_size(asize);
  void *best = NULL; // 最佳的块
  size_t min_size = 0, size;
  void *succ;
  while (index <= 8) {
    succ = listp + index * WSIZE;
    while ((succ = SUCC_BLKP(succ)) != NONE_BLKP) {
      size = GET_SIZE(HDRP(succ));
      if (size >= asize && !GET_ALLOC(HDRP(succ)) &&
          (min_size == 0 || min_size > size)) {
        best = succ;
        min_size = size;
      }
      if (best != NULL) {
        return best;
      }
      ++index;
    }
  }
  return NULL;
}

static void place(void *bp, size_t asize) {
  size_t remain_size;
  remain_size = GET_SIZE(HDRP(bp)) - asize;
  delete_block(bp);
  if (remain_size >=
      DSIZE * 2) { // 如果剩余空间满足最小块的大小，就将其分割出一个新的空闲块
    PUT(HDRP(bp), PACK(asize, 1));
    PUT(FTRP(bp), PACK(asize, 1));
    PUT(HDRP(NEXT_BLKP(bp)), PACK(remain_size, 0));
    PUT(FTRP(NEXT_BLKP(bp)), PACK(remain_size, 0));
    add_block(NEXT_BLKP(bp));
  } else {
    PUT(HDRP(bp), PACK(GET_SIZE(HDRP(bp)), 1));
    PUT(FTRP(bp), PACK(GET_SIZE(HDRP(bp)), 1));
  }
}

static void *add_block(void *bp) {
  size_t size = GET_SIZE(HDRP(bp));
  int index = get_index_by_size(size);
  void *root = listp + index * WSIZE; // 得到对应空闲链表的 root 指针

  // LIFO
  return LIFO(bp, root);
}

static void delete_block(void *bp) {
  PUT(SUCC(PRED_BLKP(bp)), SUCC_BLKP(bp)); // 将上一个块的后继改为当前块的后继
  if (SUCC_BLKP(bp) != NONE_BLKP) {
    PUT(PRED(SUCC_BLKP(bp)), PRED_BLKP(bp));
  }
}

static int get_index_by_size(size_t size) {
  int index = 0;
  if (size > 4096) {
    return 8;
  }
  size >>= 5;
  while (size) {
    size >>= 1;
    ++index;
  }
  return index;
}

static void *LIFO(void *bp, void *root) {
  // 使用头插法进行插入
  if (SUCC_BLKP(root) != NONE_BLKP) { // 如果后继不为空
    PUT(PRED(SUCC_BLKP(bp)), bp);
    PUT(SUCC(bp), SUCC_BLKP(bp));
  } else {
    PUT(SUCC(bp), NONE_BLKP);
  }
  PUT(SUCC(root), bp);
  PUT(PRED(bp), root);

  return bp;
}

static void *address_order(void *bp, void *root) {
  void *succ = root;
  while (SUCC_BLKP(succ) != NONE_BLKP) {
    succ = SUCC_BLKP(succ);
    if (succ >= bp) {
      break;
    }
  }
  if (succ == root) {
    return LIFO(bp, root);
  } else if (SUCC_BLKP(succ) == NONE_BLKP) {
    PUT(SUCC(succ), bp);
    PUT(PRED(bp), succ);
    PUT(SUCC(bp), NONE_BLKP);
  } else {
    PUT(SUCC(PRED_BLKP(succ)), bp);
    PUT(PRED(bp), PRED_BLKP(bp));
    PUT(SUCC(bp), succ);
    PUT(PRED(succ), bp);
  }
  return bp;
}