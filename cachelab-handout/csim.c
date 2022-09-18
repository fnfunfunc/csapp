#include "cachelab.h"
#include <getopt.h>
#include <stdlib.h>
#include <stdio.h>

// Some global values
int hits_num, misses_num, evictions_num;
int s, E, b, S;

typedef struct {
    int valid_bits; // Valid bits
    unsigned tag; // Tag bits
    int stamp; // Timestamp
} cache_line;
cache_line ** cache;

/*
Something about the trace:
format: operation address, size
'I' indicates instruction loading (Can be neglected here) 
'L' indicates data loading
'M' indicates data modification
*/


void init() {
    cache = (cache_line **) malloc(sizeof(cache_line*) * S); // Group
    for (int i = 0; i < S; ++i) {
        *(cache + i) = (cache_line *) malloc(sizeof(cache_line) * E);
    }
    for (int i = 0; i < S; ++i) {
        for (int j = 0; j < E; ++j) {
            cache[i][j].valid_bits = 0; // Set all valid bits as 0
            cache[i][j].tag = 0xffffffff; // No address
            cache[i][j].stamp = 0; // Timestamp is 0
        }
    }
}

void update(unsigned address) {
    unsigned s_address = (address >> b) & (0xffffffff >> (32 - s));
    unsigned t_address = (address) >> (b + s);
    for (int i = 0; i < E; ++i) {
        if (cache[s_address][i].tag == t_address) {
            cache[s_address][i].stamp = 0; // Now it is using, update the stamp
            ++hits_num;
            return;
        }
    }

    for (int i =0; i < E; ++i) {
        if (cache[s_address][i].valid_bits == 0) {
            cache[s_address][i].tag = t_address;
            cache[s_address][i].valid_bits = 1;
            cache[s_address][i].stamp = 0; // Now it is using, update the stamp
            ++misses_num;
            return;
        }
    }

    int max_stamp = 0;
    int max_i = 0;
    for (int i = 0; i < E; ++i) {
        if (cache[s_address][i].stamp > max_stamp) {
            max_stamp = cache[s_address][i].stamp;
            max_i = i;
        }
    }
    ++evictions_num;
    ++misses_num;
    cache[s_address][max_i].tag = t_address;
    cache[s_address][max_i].stamp = 0;
}

void time_pass() {
    for (int i = 0; i < S; ++i) {
        for (int j = 0; j < E ; ++j) {
            if (cache[i][j].valid_bits == 1) {
                ++cache[i][j].stamp;
            }
        }
    }
}

int main(int argc, char **argv) {
    int opt;
    char* filepath;
    const char* opt_string = "s:E:b:t:";
    while ((opt = getopt(argc, argv, opt_string)) != -1) {
        switch (opt) {
            case 's':
                s = atoi(optarg);
                break;
            case 'E':
                E = atoi(optarg);
                break;
            case 'b':
                b = atoi(optarg);
                break;
            case 't':
                filepath = optarg;
                break;  
            case '?':
                printf("Invalid options\n");
                exit(-1);
                break;              
        }
    }
    S = 1 << s;
    init();
    FILE* file = fopen(filepath, "r");
    if (file == NULL) {
        printf("Open file error\n");
        exit(-1);
    }
    
    char operation;
    unsigned address;
    int size;

    while (fscanf(file, " %c %x,%d", &operation, &address, &size) > 0) {
        switch (operation) {
            case 'L':
                update(address);
                break;
            case 'M':
                update(address);   
            case 'S':
                update(address);
                break;
        }
        time_pass();
    }

    for (int i = 0; i < S; ++i) {
        free(*(cache + i));
    }
    free(cache);
    fclose(file);
    printSummary(hits_num, misses_num, evictions_num);
    return 0;
}
