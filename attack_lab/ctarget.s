  401ede:       48 83 e7 f0             and    $0xfffffffffffffff0,%rdi
  401ee2:       be f4 00 00 00          mov    $0xf4,%esi
  401ee7:       e8 14 ee ff ff          call   400d00 <memset@plt>
  401eec:       48 8b 05 ad 25 20 00    mov    0x2025ad(%rip),%rax        # 6044a0 <stdin@GLIBC_2.2.5>
  401ef3:       48 39 05 d6 25 20 00    cmp    %rax,0x2025d6(%rip)        # 6044d0 <infile>
  401efa:       75 14                   jne    401f10 <launch+0x5c>
  401efc:       be b4 32 40 00          mov    $0x4032b4,%esi
  401f01:       bf 01 00 00 00          mov    $0x1,%edi
  401f06:       b8 00 00 00 00          mov    $0x0,%eax
  401f0b:       e8 e0 ee ff ff          call   400df0 <__printf_chk@plt>
  401f10:       c7 05 c2 25 20 00 00    movl   $0x0,0x2025c2(%rip)        # 6044dc <vlevel>
  401f17:       00 00 00 
  401f1a:       b8 00 00 00 00          mov    $0x0,%eax
  401f1f:       e8 44 fa ff ff          call   401968 <test>
  401f24:       83 3d bd 25 20 00 00    cmpl   $0x0,0x2025bd(%rip)        # 6044e8 <is_checker>
  401f2b:       74 14                   je     401f41 <launch+0x8d>
  401f2d:       bf c1 32 40 00          mov    $0x4032c1,%edi
  401f32:       e8 89 ed ff ff          call   400cc0 <puts@plt>
  401f37:       b8 00 00 00 00          mov    $0x0,%eax
  401f3c:       e8 ca fa ff ff          call   401a0b <check_fail>
  401f41:       bf cc 32 40 00          mov    $0x4032cc,%edi
  401f46:       e8 75 ed ff ff          call   400cc0 <puts@plt>
  401f4b:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401f4f:       64 48 33 04 25 28 00    xor    %fs:0x28,%rax
  401f56:       00 00 
  401f58:       74 05                   je     401f5f <launch+0xab>
  401f5a:       e8 81 ed ff ff          call   400ce0 <__stack_chk_fail@plt>
  401f5f:       c9                      leave  
  401f60:       c3                      ret    

0000000000401f61 <stable_launch>:
  401f61:       53                      push   %rbx
  401f62:       48 89 3d 5f 25 20 00    mov    %rdi,0x20255f(%rip)        # 6044c8 <global_offset>
  401f69:       41 b9 00 00 00 00       mov    $0x0,%r9d
  401f6f:       41 b8 00 00 00 00       mov    $0x0,%r8d
  401f75:       b9 32 01 00 00          mov    $0x132,%ecx
  401f7a:       ba 07 00 00 00          mov    $0x7,%edx
  401f7f:       be 00 00 10 00          mov    $0x100000,%esi
  401f84:       bf 00 60 58 55          mov    $0x55586000,%edi
  401f89:       e8 62 ed ff ff          call   400cf0 <mmap@plt>
  401f8e:       48 89 c3                mov    %rax,%rbx
  401f91:       48 3d 00 60 58 55       cmp    $0x55586000,%rax
  401f97:       74 37                   je     401fd0 <stable_launch+0x6f>
  401f99:       be 00 00 10 00          mov    $0x100000,%esi
  401f9e:       48 89 c7                mov    %rax,%rdi
  401fa1:       e8 3a ee ff ff          call   400de0 <munmap@plt>
  401fa6:       b9 00 60 58 55          mov    $0x55586000,%ecx
  401fab:       ba 80 34 40 00          mov    $0x403480,%edx
  401fb0:       be 01 00 00 00          mov    $0x1,%esi
  401fb5:       48 8b 3d f4 24 20 00    mov    0x2024f4(%rip),%rdi        # 6044b0 <stderr@GLIBC_2.2.5>
  401fbc:       b8 00 00 00 00          mov    $0x0,%eax
  401fc1:       e8 9a ee ff ff          call   400e60 <__fprintf_chk@plt>
  401fc6:       bf 01 00 00 00          mov    $0x1,%edi
  401fcb:       e8 70 ee ff ff          call   400e40 <exit@plt>
  401fd0:       48 8d 90 f8 ff 0f 00    lea    0xffff8(%rax),%rdx
  401fd7:       48 89 15 32 31 20 00    mov    %rdx,0x203132(%rip)        # 605110 <stack_top>
  401fde:       48 89 e0                mov    %rsp,%rax
  401fe1:       48 89 d4                mov    %rdx,%rsp
  401fe4:       48 89 c2                mov    %rax,%rdx
  401fe7:       48 89 15 d2 24 20 00    mov    %rdx,0x2024d2(%rip)        # 6044c0 <global_save_stack>
  401fee:       48 8b 3d d3 24 20 00    mov    0x2024d3(%rip),%rdi        # 6044c8 <global_offset>
  401ff5:       e8 ba fe ff ff          call   401eb4 <launch>
  401ffa:       48 8b 05 bf 24 20 00    mov    0x2024bf(%rip),%rax        # 6044c0 <global_save_stack>
  402001:       48 89 c4                mov    %rax,%rsp
  402004:       be 00 00 10 00          mov    $0x100000,%esi
  402009:       48 89 df                mov    %rbx,%rdi
  40200c:       e8 cf ed ff ff          call   400de0 <munmap@plt>
  402011:       5b                      pop    %rbx
  402012:       c3                      ret    
  402013:       90                      nop
  402014:       90                      nop
  402015:       90                      nop
  402016:       90                      nop
  402017:       90                      nop
  402018:       90                      nop
  402019:       90                      nop
  40201a:       90                      nop
  40201b:       90                      nop
  40201c:       90                      nop
  40201d:       90                      nop
  40201e:       90                      nop
  40201f:       90                      nop

0000000000402020 <rio_readinitb>:
  402020:       89 37                   mov    %esi,(%rdi)
  402022:       c7 47 04 00 00 00 00    movl   $0x0,0x4(%rdi)
  402029:       48 8d 47 10             lea    0x10(%rdi),%rax
  40202d:       48 89 47 08             mov    %rax,0x8(%rdi)
  402031:       c3                      ret    

0000000000402032 <sigalrm_handler>:
  402032:       48 83 ec 08             sub    $0x8,%rsp
  402036:       b9 00 00 00 00          mov    $0x0,%ecx
  40203b:       ba c0 34 40 00          mov    $0x4034c0,%edx
  402040:       be 01 00 00 00          mov    $0x1,%esi
  402045:       48 8b 3d 64 24 20 00    mov    0x202464(%rip),%rdi        # 6044b0 <stderr@GLIBC_2.2.5>
  40204c:       b8 00 00 00 00          mov    $0x0,%eax
  402051:       e8 0a ee ff ff          call   400e60 <__fprintf_chk@plt>
  402056:       bf 01 00 00 00          mov    $0x1,%edi
  40205b:       e8 e0 ed ff ff          call   400e40 <exit@plt>

0000000000402060 <rio_writen>:
  402060:       41 55                   push   %r13
  402062:       41 54                   push   %r12
  402064:       55                      push   %rbp
  402065:       53                      push   %rbx
  402066:       48 83 ec 08             sub    $0x8,%rsp
  40206a:       41 89 fc                mov    %edi,%r12d
  40206d:       48 89 f5                mov    %rsi,%rbp
  402070:       49 89 d5                mov    %rdx,%r13
  402073:       48 89 d3                mov    %rdx,%rbx
  402076:       eb 28                   jmp    4020a0 <rio_writen+0x40>
  402078:       48 89 da                mov    %rbx,%rdx
  40207b:       48 89 ee                mov    %rbp,%rsi
  40207e:       44 89 e7                mov    %r12d,%edi
  402081:       e8 4a ec ff ff          call   400cd0 <write@plt>
  402086:       48 85 c0                test   %rax,%rax
  402089:       7f 0f                   jg     40209a <rio_writen+0x3a>
  40208b:       e8 f0 eb ff ff          call   400c80 <__errno_location@plt>
  402090:       83 38 04                cmpl   $0x4,(%rax)
  402093:       75 15                   jne    4020aa <rio_writen+0x4a>
  402095:       b8 00 00 00 00          mov    $0x0,%eax
  40209a:       48 29 c3                sub    %rax,%rbx
  40209d:       48 01 c5                add    %rax,%rbp
  4020a0:       48 85 db                test   %rbx,%rbx
  4020a3:       75 d3                   jne    402078 <rio_writen+0x18>
  4020a5:       4c 89 e8                mov    %r13,%rax
  4020a8:       eb 07                   jmp    4020b1 <rio_writen+0x51>
  4020aa:       48 c7 c0 ff ff ff ff    mov    $0xffffffffffffffff,%rax
  4020b1:       48 83 c4 08             add    $0x8,%rsp
  4020b5:       5b                      pop    %rbx
  4020b6:       5d                      pop    %rbp
  4020b7:       41 5c                   pop    %r12
  4020b9:       41 5d                   pop    %r13
  4020bb:       c3                      ret    

00000000004020bc <rio_read>:
  4020bc:       41 55                   push   %r13
  4020be:       41 54                   push   %r12
  4020c0:       55                      push   %rbp
  4020c1:       53                      push   %rbx
  4020c2:       48 83 ec 08             sub    $0x8,%rsp
  4020c6:       48 89 fb                mov    %rdi,%rbx
  4020c9:       49 89 f5                mov    %rsi,%r13
  4020cc:       49 89 d4                mov    %rdx,%r12
  4020cf:       48 8d 6f 10             lea    0x10(%rdi),%rbp
  4020d3:       eb 2a                   jmp    4020ff <rio_read+0x43>
  4020d5:       8b 3b                   mov    (%rbx),%edi
  4020d7:       ba 00 20 00 00          mov    $0x2000,%edx
  4020dc:       48 89 ee                mov    %rbp,%rsi
  4020df:       e8 4c ec ff ff          call   400d30 <read@plt>
  4020e4:       89 43 04                mov    %eax,0x4(%rbx)
  4020e7:       85 c0                   test   %eax,%eax
  4020e9:       79 0c                   jns    4020f7 <rio_read+0x3b>
  4020eb:       e8 90 eb ff ff          call   400c80 <__errno_location@plt>
  4020f0:       83 38 04                cmpl   $0x4,(%rax)
  4020f3:       74 0a                   je     4020ff <rio_read+0x43>
  4020f5:       eb 37                   jmp    40212e <rio_read+0x72>
  4020f7:       85 c0                   test   %eax,%eax
  4020f9:       74 3c                   je     402137 <rio_read+0x7b>
  4020fb:       48 89 6b 08             mov    %rbp,0x8(%rbx)
  4020ff:       8b 43 04                mov    0x4(%rbx),%eax
  402102:       85 c0                   test   %eax,%eax
  402104:       7e cf                   jle    4020d5 <rio_read+0x19>
  402106:       89 c2                   mov    %eax,%edx
  402108:       4c 39 e2                cmp    %r12,%rdx
  40210b:       44 0f 42 e0             cmovb  %eax,%r12d
  40210f:       49 63 ec                movslq %r12d,%rbp
  402112:       48 8b 73 08             mov    0x8(%rbx),%rsi
  402116:       48 89 ea                mov    %rbp,%rdx
  402119:       4c 89 ef                mov    %r13,%rdi
  40211c:       e8 6f ec ff ff          call   400d90 <memcpy@plt>
  402121:       48 01 6b 08             add    %rbp,0x8(%rbx)
  402125:       44 29 63 04             sub    %r12d,0x4(%rbx)
  402129:       48 89 e8                mov    %rbp,%rax
  40212c:       eb 0e                   jmp    40213c <rio_read+0x80>
  40212e:       48 c7 c0 ff ff ff ff    mov    $0xffffffffffffffff,%rax
  402135:       eb 05                   jmp    40213c <rio_read+0x80>
  402137:       b8 00 00 00 00          mov    $0x0,%eax
  40213c:       48 83 c4 08             add    $0x8,%rsp
  402140:       5b                      pop    %rbx
  402141:       5d                      pop    %rbp
  402142:       41 5c                   pop    %r12
  402144:       41 5d                   pop    %r13
  402146:       c3                      ret    

0000000000402147 <rio_readlineb>:
  402147:       41 55                   push   %r13
  402149:       41 54                   push   %r12
  40214b:       55                      push   %rbp
  40214c:       53                      push   %rbx
  40214d:       48 83 ec 18             sub    $0x18,%rsp
  402151:       49 89 fd                mov    %rdi,%r13
  402154:       48 89 f5                mov    %rsi,%rbp
  402157:       49 89 d4                mov    %rdx,%r12
  40215a:       bb 01 00 00 00          mov    $0x1,%ebx
  40215f:       eb 3c                   jmp    40219d <rio_readlineb+0x56>
  402161:       ba 01 00 00 00          mov    $0x1,%edx
  402166:       48 8d 74 24 0f          lea    0xf(%rsp),%rsi
  40216b:       4c 89 ef                mov    %r13,%rdi
  40216e:       e8 49 ff ff ff          call   4020bc <rio_read>
  402173:       83 f8 01                cmp    $0x1,%eax
  402176:       75 12                   jne    40218a <rio_readlineb+0x43>
  402178:       48 8d 55 01             lea    0x1(%rbp),%rdx
  40217c:       0f b6 44 24 0f          movzbl 0xf(%rsp),%eax
  402181:       88 45 00                mov    %al,0x0(%rbp)
  402184:       3c 0a                   cmp    $0xa,%al
  402186:       75 0e                   jne    402196 <rio_readlineb+0x4f>
  402188:       eb 1a                   jmp    4021a4 <rio_readlineb+0x5d>
  40218a:       85 c0                   test   %eax,%eax
  40218c:       75 22                   jne    4021b0 <rio_readlineb+0x69>
  40218e:       48 83 fb 01             cmp    $0x1,%rbx
  402192:       75 13                   jne    4021a7 <rio_readlineb+0x60>
  402194:       eb 23                   jmp    4021b9 <rio_readlineb+0x72>
  402196:       48 83 c3 01             add    $0x1,%rbx
  40219a:       48 89 d5                mov    %rdx,%rbp
  40219d:       4c 39 e3                cmp    %r12,%rbx
  4021a0:       72 bf                   jb     402161 <rio_readlineb+0x1a>
  4021a2:       eb 03                   jmp    4021a7 <rio_readlineb+0x60>
  4021a4:       48 89 d5                mov    %rdx,%rbp
  4021a7:       c6 45 00 00             movb   $0x0,0x0(%rbp)
  4021ab:       48 89 d8                mov    %rbx,%rax
  4021ae:       eb 0e                   jmp    4021be <rio_readlineb+0x77>
  4021b0:       48 c7 c0 ff ff ff ff    mov    $0xffffffffffffffff,%rax
  4021b7:       eb 05                   jmp    4021be <rio_readlineb+0x77>
  4021b9:       b8 00 00 00 00          mov    $0x0,%eax
  4021be:       48 83 c4 18             add    $0x18,%rsp
  4021c2:       5b                      pop    %rbx
  4021c3:       5d                      pop    %rbp
  4021c4:       41 5c                   pop    %r12
  4021c6:       41 5d                   pop    %r13
  4021c8:       c3                      ret    

00000000004021c9 <urlencode>:
  4021c9:       41 54                   push   %r12
  4021cb:       55                      push   %rbp
  4021cc:       53                      push   %rbx
  4021cd:       48 83 ec 10             sub    $0x10,%rsp
  4021d1:       48 89 fb                mov    %rdi,%rbx
  4021d4:       48 89 f5                mov    %rsi,%rbp
  4021d7:       64 48 8b 04 25 28 00    mov    %fs:0x28,%rax
  4021de:       00 00 
  4021e0:       48 89 44 24 08          mov    %rax,0x8(%rsp)
  4021e5:       31 c0                   xor    %eax,%eax
  4021e7:       48 c7 c1 ff ff ff ff    mov    $0xffffffffffffffff,%rcx
  4021ee:       f2 ae                   repnz scas %es:(%rdi),%al
  4021f0:       48 f7 d1                not    %rcx
  4021f3:       8d 41 ff                lea    -0x1(%rcx),%eax
  4021f6:       e9 aa 00 00 00          jmp    4022a5 <urlencode+0xdc>
  4021fb:       44 0f b6 03             movzbl (%rbx),%r8d
  4021ff:       41 80 f8 2a             cmp    $0x2a,%r8b
  402203:       0f 94 c2                sete   %dl
  402206:       41 80 f8 2d             cmp    $0x2d,%r8b
  40220a:       0f 94 c0                sete   %al
  40220d:       08 c2                   or     %al,%dl
  40220f:       75 24                   jne    402235 <urlencode+0x6c>
  402211:       41 80 f8 2e             cmp    $0x2e,%r8b
  402215:       74 1e                   je     402235 <urlencode+0x6c>
  402217:       41 80 f8 5f             cmp    $0x5f,%r8b
  40221b:       74 18                   je     402235 <urlencode+0x6c>
  40221d:       41 8d 40 d0             lea    -0x30(%r8),%eax
  402221:       3c 09                   cmp    $0x9,%al
  402223:       76 10                   jbe    402235 <urlencode+0x6c>
  402225:       41 8d 40 bf             lea    -0x41(%r8),%eax
  402229:       3c 19                   cmp    $0x19,%al
  40222b:       76 08                   jbe    402235 <urlencode+0x6c>
  40222d:       41 8d 40 9f             lea    -0x61(%r8),%eax
  402231:       3c 19                   cmp    $0x19,%al
  402233:       77 0a                   ja     40223f <urlencode+0x76>
  402235:       44 88 45 00             mov    %r8b,0x0(%rbp)
  402239:       48 8d 6d 01             lea    0x1(%rbp),%rbp
  40223d:       eb 5f                   jmp    40229e <urlencode+0xd5>
  40223f:       41 80 f8 20             cmp    $0x20,%r8b
  402243:       75 0a                   jne    40224f <urlencode+0x86>
  402245:       c6 45 00 2b             movb   $0x2b,0x0(%rbp)
  402249:       48 8d 6d 01             lea    0x1(%rbp),%rbp
  40224d:       eb 4f                   jmp    40229e <urlencode+0xd5>
  40224f:       41 8d 40 e0             lea    -0x20(%r8),%eax
  402253:       3c 5f                   cmp    $0x5f,%al
  402255:       0f 96 c2                setbe  %dl
  402258:       41 80 f8 09             cmp    $0x9,%r8b
  40225c:       0f 94 c0                sete   %al
  40225f:       08 c2                   or     %al,%dl
  402261:       74 50                   je     4022b3 <urlencode+0xea>
  402263:       45 0f b6 c0             movzbl %r8b,%r8d
  402267:       b9 58 35 40 00          mov    $0x403558,%ecx
  40226c:       ba 08 00 00 00          mov    $0x8,%edx
  402271:       be 01 00 00 00          mov    $0x1,%esi
  402276:       48 89 e7                mov    %rsp,%rdi
  402279:       b8 00 00 00 00          mov    $0x0,%eax
  40227e:       e8 ed eb ff ff          call   400e70 <__sprintf_chk@plt>
  402283:       0f b6 04 24             movzbl (%rsp),%eax
  402287:       88 45 00                mov    %al,0x0(%rbp)
  40228a:       0f b6 44 24 01          movzbl 0x1(%rsp),%eax
  40228f:       88 45 01                mov    %al,0x1(%rbp)
  402292:       0f b6 44 24 02          movzbl 0x2(%rsp),%eax
  402297:       88 45 02                mov    %al,0x2(%rbp)
  40229a:       48 8d 6d 03             lea    0x3(%rbp),%rbp
  40229e:       48 83 c3 01             add    $0x1,%rbx
  4022a2:       44 89 e0                mov    %r12d,%eax
  4022a5:       44 8d 60 ff             lea    -0x1(%rax),%r12d
  4022a9:       85 c0                   test   %eax,%eax
  4022ab:       0f 85 4a ff ff ff       jne    4021fb <urlencode+0x32>
  4022b1:       eb 05                   jmp    4022b8 <urlencode+0xef>
  4022b3:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  4022b8:       48 8b 74 24 08          mov    0x8(%rsp),%rsi
  4022bd:       64 48 33 34 25 28 00    xor    %fs:0x28,%rsi
  4022c4:       00 00 
  4022c6:       74 05                   je     4022cd <urlencode+0x104>
  4022c8:       e8 13 ea ff ff          call   400ce0 <__stack_chk_fail@plt>
  4022cd:       48 83 c4 10             add    $0x10,%rsp
  4022d1:       5b                      pop    %rbx
  4022d2:       5d                      pop    %rbp
  4022d3:       41 5c                   pop    %r12
  4022d5:       c3                      ret    

00000000004022d6 <submitr>:
  4022d6:       41 57                   push   %r15
  4022d8:       41 56                   push   %r14
  4022da:       41 55                   push   %r13
  4022dc:       41 54                   push   %r12
  4022de:       55                      push   %rbp
  4022df:       53                      push   %rbx
  4022e0:       48 81 ec 68 a0 00 00    sub    $0xa068,%rsp
  4022e7:       49 89 fc                mov    %rdi,%r12
  4022ea:       89 74 24 14             mov    %esi,0x14(%rsp)
  4022ee:       49 89 d7                mov    %rdx,%r15
  4022f1:       49 89 ce                mov    %rcx,%r14
  4022f4:       4c 89 44 24 18          mov    %r8,0x18(%rsp)
  4022f9:       4d 89 cd                mov    %r9,%r13
  4022fc:       48 8b 9c 24 a0 a0 00    mov    0xa0a0(%rsp),%rbx
  402303:       00 
  402304:       64 48 8b 04 25 28 00    mov    %fs:0x28,%rax
  40230b:       00 00 
  40230d:       48 89 84 24 58 a0 00    mov    %rax,0xa058(%rsp)
  402314:       00 
  402315:       31 c0                   xor    %eax,%eax
  402317:       c7 44 24 2c 00 00 00    movl   $0x0,0x2c(%rsp)
  40231e:       00 
  40231f:       ba 00 00 00 00          mov    $0x0,%edx
  402324:       be 01 00 00 00          mov    $0x1,%esi
  402329:       bf 02 00 00 00          mov    $0x2,%edi
  40232e:       e8 4d eb ff ff          call   400e80 <socket@plt>
  402333:       89 c5                   mov    %eax,%ebp
  402335:       85 c0                   test   %eax,%eax
  402337:       79 4e                   jns    402387 <submitr+0xb1>
  402339:       48 b8 45 72 72 6f 72    movabs $0x43203a726f727245,%rax
  402340:       3a 20 43 
  402343:       48 89 03                mov    %rax,(%rbx)
  402346:       48 b8 6c 69 65 6e 74    movabs $0x6e7520746e65696c,%rax
  40234d:       20 75 6e 
  402350:       48 89 43 08             mov    %rax,0x8(%rbx)
  402354:       48 b8 61 62 6c 65 20    movabs $0x206f7420656c6261,%rax
  40235b:       74 6f 20 
  40235e:       48 89 43 10             mov    %rax,0x10(%rbx)
  402362:       48 b8 63 72 65 61 74    movabs $0x7320657461657263,%rax
  402369:       65 20 73 
  40236c:       48 89 43 18             mov    %rax,0x18(%rbx)
  402370:       c7 43 20 6f 63 6b 65    movl   $0x656b636f,0x20(%rbx)
  402377:       66 c7 43 24 74 00       movw   $0x74,0x24(%rbx)
  40237d:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  402382:       e9 4a 06 00 00          jmp    4029d1 <submitr+0x6fb>
  402387:       4c 89 e7                mov    %r12,%rdi
  40238a:       e8 d1 e9 ff ff          call   400d60 <gethostbyname@plt>
  40238f:       48 85 c0                test   %rax,%rax
  402392:       75 67                   jne    4023fb <submitr+0x125>
  402394:       48 b8 45 72 72 6f 72    movabs $0x44203a726f727245,%rax
  40239b:       3a 20 44 
  40239e:       48 89 03                mov    %rax,(%rbx)
  4023a1:       48 b8 4e 53 20 69 73    movabs $0x6e7520736920534e,%rax
  4023a8:       20 75 6e 
  4023ab:       48 89 43 08             mov    %rax,0x8(%rbx)
  4023af:       48 b8 61 62 6c 65 20    movabs $0x206f7420656c6261,%rax
  4023b6:       74 6f 20 
  4023b9:       48 89 43 10             mov    %rax,0x10(%rbx)
  4023bd:       48 b8 72 65 73 6f 6c    movabs $0x2065766c6f736572,%rax
  4023c4:       76 65 20 
  4023c7:       48 89 43 18             mov    %rax,0x18(%rbx)
  4023cb:       48 b8 73 65 72 76 65    movabs $0x6120726576726573,%rax
  4023d2:       72 20 61 
  4023d5:       48 89 43 20             mov    %rax,0x20(%rbx)
  4023d9:       c7 43 28 64 64 72 65    movl   $0x65726464,0x28(%rbx)
  4023e0:       66 c7 43 2c 73 73       movw   $0x7373,0x2c(%rbx)
  4023e6:       c6 43 2e 00             movb   $0x0,0x2e(%rbx)
  4023ea:       89 ef                   mov    %ebp,%edi
  4023ec:       e8 2f e9 ff ff          call   400d20 <close@plt>
  4023f1:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  4023f6:       e9 d6 05 00 00          jmp    4029d1 <submitr+0x6fb>
  4023fb:       48 c7 44 24 30 00 00    movq   $0x0,0x30(%rsp)
  402402:       00 00 
  402404:       48 c7 44 24 38 00 00    movq   $0x0,0x38(%rsp)
  40240b:       00 00 
  40240d:       66 c7 44 24 30 02 00    movw   $0x2,0x30(%rsp)
  402414:       48 63 50 14             movslq 0x14(%rax),%rdx
  402418:       48 8b 40 18             mov    0x18(%rax),%rax
  40241c:       48 8b 30                mov    (%rax),%rsi
  40241f:       b9 0c 00 00 00          mov    $0xc,%ecx
  402424:       48 8d 7c 24 34          lea    0x34(%rsp),%rdi
  402429:       e8 42 e9 ff ff          call   400d70 <__memmove_chk@plt>
  40242e:       0f b7 44 24 14          movzwl 0x14(%rsp),%eax
  402433:       66 c1 c8 08             ror    $0x8,%ax
  402437:       66 89 44 24 32          mov    %ax,0x32(%rsp)
  40243c:       ba 10 00 00 00          mov    $0x10,%edx
  402441:       48 8d 74 24 30          lea    0x30(%rsp),%rsi
  402446:       89 ef                   mov    %ebp,%edi
  402448:       e8 03 ea ff ff          call   400e50 <connect@plt>
  40244d:       85 c0                   test   %eax,%eax
  40244f:       79 59                   jns    4024aa <submitr+0x1d4>
  402451:       48 b8 45 72 72 6f 72    movabs $0x55203a726f727245,%rax
  402458:       3a 20 55 
  40245b:       48 89 03                mov    %rax,(%rbx)
  40245e:       48 b8 6e 61 62 6c 65    movabs $0x6f7420656c62616e,%rax
  402465:       20 74 6f 
  402468:       48 89 43 08             mov    %rax,0x8(%rbx)
  40246c:       48 b8 20 63 6f 6e 6e    movabs $0x7463656e6e6f6320,%rax
  402473:       65 63 74 
  402476:       48 89 43 10             mov    %rax,0x10(%rbx)
  40247a:       48 b8 20 74 6f 20 74    movabs $0x20656874206f7420,%rax
  402481:       68 65 20 
  402484:       48 89 43 18             mov    %rax,0x18(%rbx)
  402488:       c7 43 20 73 65 72 76    movl   $0x76726573,0x20(%rbx)
  40248f:       66 c7 43 24 65 72       movw   $0x7265,0x24(%rbx)
  402495:       c6 43 26 00             movb   $0x0,0x26(%rbx)
  402499:       89 ef                   mov    %ebp,%edi
  40249b:       e8 80 e8 ff ff          call   400d20 <close@plt>
  4024a0:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  4024a5:       e9 27 05 00 00          jmp    4029d1 <submitr+0x6fb>
  4024aa:       48 c7 c2 ff ff ff ff    mov    $0xffffffffffffffff,%rdx
  4024b1:       4c 89 ef                mov    %r13,%rdi
  4024b4:       b8 00 00 00 00          mov    $0x0,%eax
  4024b9:       48 89 d1                mov    %rdx,%rcx
  4024bc:       f2 ae                   repnz scas %es:(%rdi),%al
  4024be:       48 f7 d1                not    %rcx
  4024c1:       48 89 ce                mov    %rcx,%rsi
  4024c4:       4c 89 ff                mov    %r15,%rdi
  4024c7:       48 89 d1                mov    %rdx,%rcx
  4024ca:       f2 ae                   repnz scas %es:(%rdi),%al
  4024cc:       48 f7 d1                not    %rcx
  4024cf:       49 89 c8                mov    %rcx,%r8
  4024d2:       4c 89 f7                mov    %r14,%rdi
  4024d5:       48 89 d1                mov    %rdx,%rcx
  4024d8:       f2 ae                   repnz scas %es:(%rdi),%al
  4024da:       49 29 c8                sub    %rcx,%r8
  4024dd:       48 8b 7c 24 18          mov    0x18(%rsp),%rdi
  4024e2:       48 89 d1                mov    %rdx,%rcx
  4024e5:       f2 ae                   repnz scas %es:(%rdi),%al
  4024e7:       49 29 c8                sub    %rcx,%r8
  4024ea:       48 8d 44 76 fd          lea    -0x3(%rsi,%rsi,2),%rax
  4024ef:       49 8d 44 00 7b          lea    0x7b(%r8,%rax,1),%rax
  4024f4:       48 3d 00 20 00 00       cmp    $0x2000,%rax
  4024fa:       76 72                   jbe    40256e <submitr+0x298>
  4024fc:       48 b8 45 72 72 6f 72    movabs $0x52203a726f727245,%rax
  402503:       3a 20 52 
  402506:       48 89 03                mov    %rax,(%rbx)
  402509:       48 b8 65 73 75 6c 74    movabs $0x747320746c757365,%rax
  402510:       20 73 74 
  402513:       48 89 43 08             mov    %rax,0x8(%rbx)
  402517:       48 b8 72 69 6e 67 20    movabs $0x6f6f7420676e6972,%rax
  40251e:       74 6f 6f 
  402521:       48 89 43 10             mov    %rax,0x10(%rbx)
  402525:       48 b8 20 6c 61 72 67    movabs $0x202e656772616c20,%rax
  40252c:       65 2e 20 
  40252f:       48 89 43 18             mov    %rax,0x18(%rbx)
  402533:       48 b8 49 6e 63 72 65    movabs $0x6573616572636e49,%rax
  40253a:       61 73 65 
  40253d:       48 89 43 20             mov    %rax,0x20(%rbx)
  402541:       48 b8 20 53 55 42 4d    movabs $0x5254494d42555320,%rax
  402548:       49 54 52 
  40254b:       48 89 43 28             mov    %rax,0x28(%rbx)
  40254f:       48 b8 5f 4d 41 58 42    movabs $0x46554258414d5f,%rax
  402556:       55 46 00 
  402559:       48 89 43 30             mov    %rax,0x30(%rbx)
  40255d:       89 ef                   mov    %ebp,%edi
  40255f:       e8 bc e7 ff ff          call   400d20 <close@plt>
  402564:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  402569:       e9 63 04 00 00          jmp    4029d1 <submitr+0x6fb>
  40256e:       48 8d b4 24 40 20 00    lea    0x2040(%rsp),%rsi
  402575:       00 
  402576:       b9 00 04 00 00          mov    $0x400,%ecx
  40257b:       b8 00 00 00 00          mov    $0x0,%eax
  402580:       48 89 f7                mov    %rsi,%rdi
  402583:       f3 48 ab                rep stos %rax,%es:(%rdi)
  402586:       4c 89 ef                mov    %r13,%rdi
  402589:       e8 3b fc ff ff          call   4021c9 <urlencode>
  40258e:       85 c0                   test   %eax,%eax
  402590:       0f 89 8a 00 00 00       jns    402620 <submitr+0x34a>
  402596:       48 b8 45 72 72 6f 72    movabs $0x52203a726f727245,%rax
  40259d:       3a 20 52 
  4025a0:       48 89 03                mov    %rax,(%rbx)
  4025a3:       48 b8 65 73 75 6c 74    movabs $0x747320746c757365,%rax
  4025aa:       20 73 74 
  4025ad:       48 89 43 08             mov    %rax,0x8(%rbx)
  4025b1:       48 b8 72 69 6e 67 20    movabs $0x6e6f6320676e6972,%rax
  4025b8:       63 6f 6e 
  4025bb:       48 89 43 10             mov    %rax,0x10(%rbx)
  4025bf:       48 b8 74 61 69 6e 73    movabs $0x6e6120736e696174,%rax
  4025c6:       20 61 6e 
  4025c9:       48 89 43 18             mov    %rax,0x18(%rbx)
  4025cd:       48 b8 20 69 6c 6c 65    movabs $0x6c6167656c6c6920,%rax
  4025d4:       67 61 6c 
  4025d7:       48 89 43 20             mov    %rax,0x20(%rbx)
  4025db:       48 b8 20 6f 72 20 75    movabs $0x72706e7520726f20,%rax
  4025e2:       6e 70 72 
  4025e5:       48 89 43 28             mov    %rax,0x28(%rbx)
  4025e9:       48 b8 69 6e 74 61 62    movabs $0x20656c6261746e69,%rax
  4025f0:       6c 65 20 
  4025f3:       48 89 43 30             mov    %rax,0x30(%rbx)
  4025f7:       48 b8 63 68 61 72 61    movabs $0x6574636172616863,%rax
  4025fe:       63 74 65 
  402601:       48 89 43 38             mov    %rax,0x38(%rbx)
  402605:       66 c7 43 40 72 2e       movw   $0x2e72,0x40(%rbx)
  40260b:       c6 43 42 00             movb   $0x0,0x42(%rbx)
  40260f:       89 ef                   mov    %ebp,%edi
  402611:       e8 0a e7 ff ff          call   400d20 <close@plt>
  402616:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  40261b:       e9 b1 03 00 00          jmp    4029d1 <submitr+0x6fb>
  402620:       4c 89 64 24 08          mov    %r12,0x8(%rsp)
  402625:       48 8d 84 24 40 20 00    lea    0x2040(%rsp),%rax
  40262c:       00 
  40262d:       48 89 04 24             mov    %rax,(%rsp)
  402631:       4d 89 f9                mov    %r15,%r9
  402634:       4d 89 f0                mov    %r14,%r8
  402637:       b9 e8 34 40 00          mov    $0x4034e8,%ecx
  40263c:       ba 00 20 00 00          mov    $0x2000,%edx
  402641:       be 01 00 00 00          mov    $0x1,%esi
  402646:       48 8d 7c 24 40          lea    0x40(%rsp),%rdi
  40264b:       b8 00 00 00 00          mov    $0x0,%eax
  402650:       e8 1b e8 ff ff          call   400e70 <__sprintf_chk@plt>
  402655:       48 8d 7c 24 40          lea    0x40(%rsp),%rdi
  40265a:       b8 00 00 00 00          mov    $0x0,%eax
  40265f:       48 c7 c1 ff ff ff ff    mov    $0xffffffffffffffff,%rcx
  402666:       f2 ae                   repnz scas %es:(%rdi),%al
  402668:       48 f7 d1                not    %rcx
  40266b:       48 8d 51 ff             lea    -0x1(%rcx),%rdx
  40266f:       48 8d 74 24 40          lea    0x40(%rsp),%rsi
  402674:       89 ef                   mov    %ebp,%edi
  402676:       e8 e5 f9 ff ff          call   402060 <rio_writen>
  40267b:       48 85 c0                test   %rax,%rax
  40267e:       79 6e                   jns    4026ee <submitr+0x418>
  402680:       48 b8 45 72 72 6f 72    movabs $0x43203a726f727245,%rax
  402687:       3a 20 43 
  40268a:       48 89 03                mov    %rax,(%rbx)
  40268d:       48 b8 6c 69 65 6e 74    movabs $0x6e7520746e65696c,%rax
  402694:       20 75 6e 
  402697:       48 89 43 08             mov    %rax,0x8(%rbx)
  40269b:       48 b8 61 62 6c 65 20    movabs $0x206f7420656c6261,%rax
  4026a2:       74 6f 20 
  4026a5:       48 89 43 10             mov    %rax,0x10(%rbx)
  4026a9:       48 b8 77 72 69 74 65    movabs $0x6f74206574697277,%rax
  4026b0:       20 74 6f 
  4026b3:       48 89 43 18             mov    %rax,0x18(%rbx)
  4026b7:       48 b8 20 74 68 65 20    movabs $0x7365722065687420,%rax
  4026be:       72 65 73 
  4026c1:       48 89 43 20             mov    %rax,0x20(%rbx)
  4026c5:       48 b8 75 6c 74 20 73    movabs $0x7672657320746c75,%rax
  4026cc:       65 72 76 
  4026cf:       48 89 43 28             mov    %rax,0x28(%rbx)
  4026d3:       66 c7 43 30 65 72       movw   $0x7265,0x30(%rbx)
  4026d9:       c6 43 32 00             movb   $0x0,0x32(%rbx)
  4026dd:       89 ef                   mov    %ebp,%edi
  4026df:       e8 3c e6 ff ff          call   400d20 <close@plt>
  4026e4:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  4026e9:       e9 e3 02 00 00          jmp    4029d1 <submitr+0x6fb>
  4026ee:       89 ee                   mov    %ebp,%esi
  4026f0:       48 8d bc 24 40 80 00    lea    0x8040(%rsp),%rdi
  4026f7:       00 
  4026f8:       e8 23 f9 ff ff          call   402020 <rio_readinitb>
  4026fd:       ba 00 20 00 00          mov    $0x2000,%edx
  402702:       48 8d 74 24 40          lea    0x40(%rsp),%rsi
  402707:       48 8d bc 24 40 80 00    lea    0x8040(%rsp),%rdi
  40270e:       00 
  40270f:       e8 33 fa ff ff          call   402147 <rio_readlineb>
  402714:       48 85 c0                test   %rax,%rax
  402717:       7f 7d                   jg     402796 <submitr+0x4c0>
  402719:       48 b8 45 72 72 6f 72    movabs $0x43203a726f727245,%rax
  402720:       3a 20 43 
  402723:       48 89 03                mov    %rax,(%rbx)
  402726:       48 b8 6c 69 65 6e 74    movabs $0x6e7520746e65696c,%rax
  40272d:       20 75 6e 
  402730:       48 89 43 08             mov    %rax,0x8(%rbx)
  402734:       48 b8 61 62 6c 65 20    movabs $0x206f7420656c6261,%rax
  40273b:       74 6f 20 
  40273e:       48 89 43 10             mov    %rax,0x10(%rbx)
  402742:       48 b8 72 65 61 64 20    movabs $0x7269662064616572,%rax
  402749:       66 69 72 
  40274c:       48 89 43 18             mov    %rax,0x18(%rbx)
  402750:       48 b8 73 74 20 68 65    movabs $0x6564616568207473,%rax
  402757:       61 64 65 
  40275a:       48 89 43 20             mov    %rax,0x20(%rbx)
  40275e:       48 b8 72 20 66 72 6f    movabs $0x72206d6f72662072,%rax
  402765:       6d 20 72 
  402768:       48 89 43 28             mov    %rax,0x28(%rbx)
  40276c:       48 b8 65 73 75 6c 74    movabs $0x657320746c757365,%rax
  402773:       20 73 65 
  402776:       48 89 43 30             mov    %rax,0x30(%rbx)
  40277a:       c7 43 38 72 76 65 72    movl   $0x72657672,0x38(%rbx)
  402781:       c6 43 3c 00             movb   $0x0,0x3c(%rbx)
  402785:       89 ef                   mov    %ebp,%edi
  402787:       e8 94 e5 ff ff          call   400d20 <close@plt>
  40278c:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  402791:       e9 3b 02 00 00          jmp    4029d1 <submitr+0x6fb>
  402796:       4c 8d 84 24 40 60 00    lea    0x6040(%rsp),%r8
  40279d:       00 
  40279e:       48 8d 4c 24 2c          lea    0x2c(%rsp),%rcx
  4027a3:       48 8d 94 24 40 40 00    lea    0x4040(%rsp),%rdx
  4027aa:       00 
  4027ab:       be 5f 35 40 00          mov    $0x40355f,%esi
  4027b0:       48 8d 7c 24 40          lea    0x40(%rsp),%rdi
  4027b5:       b8 00 00 00 00          mov    $0x0,%eax
  4027ba:       e8 11 e6 ff ff          call   400dd0 <__isoc99_sscanf@plt>
  4027bf:       e9 95 00 00 00          jmp    402859 <submitr+0x583>
  4027c4:       ba 00 20 00 00          mov    $0x2000,%edx
  4027c9:       48 8d 74 24 40          lea    0x40(%rsp),%rsi
  4027ce:       48 8d bc 24 40 80 00    lea    0x8040(%rsp),%rdi
  4027d5:       00 
  4027d6:       e8 6c f9 ff ff          call   402147 <rio_readlineb>
  4027db:       48 85 c0                test   %rax,%rax
  4027de:       7f 79                   jg     402859 <submitr+0x583>
  4027e0:       48 b8 45 72 72 6f 72    movabs $0x43203a726f727245,%rax
  4027e7:       3a 20 43 
  4027ea:       48 89 03                mov    %rax,(%rbx)
  4027ed:       48 b8 6c 69 65 6e 74    movabs $0x6e7520746e65696c,%rax
  4027f4:       20 75 6e 
  4027f7:       48 89 43 08             mov    %rax,0x8(%rbx)
  4027fb:       48 b8 61 62 6c 65 20    movabs $0x206f7420656c6261,%rax
  402802:       74 6f 20 
  402805:       48 89 43 10             mov    %rax,0x10(%rbx)
  402809:       48 b8 72 65 61 64 20    movabs $0x6165682064616572,%rax
  402810:       68 65 61 
  402813:       48 89 43 18             mov    %rax,0x18(%rbx)
  402817:       48 b8 64 65 72 73 20    movabs $0x6f72662073726564,%rax
  40281e:       66 72 6f 
  402821:       48 89 43 20             mov    %rax,0x20(%rbx)
  402825:       48 b8 6d 20 74 68 65    movabs $0x657220656874206d,%rax
  40282c:       20 72 65 
  40282f:       48 89 43 28             mov    %rax,0x28(%rbx)
  402833:       48 b8 73 75 6c 74 20    movabs $0x72657320746c7573,%rax
  40283a:       73 65 72 
  40283d:       48 89 43 30             mov    %rax,0x30(%rbx)
  402841:       c7 43 38 76 65 72 00    movl   $0x726576,0x38(%rbx)
  402848:       89 ef                   mov    %ebp,%edi
  40284a:       e8 d1 e4 ff ff          call   400d20 <close@plt>
  40284f:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  402854:       e9 78 01 00 00          jmp    4029d1 <submitr+0x6fb>
  402859:       0f b6 44 24 40          movzbl 0x40(%rsp),%eax
  40285e:       83 e8 0d                sub    $0xd,%eax
  402861:       75 0f                   jne    402872 <submitr+0x59c>
  402863:       0f b6 44 24 41          movzbl 0x41(%rsp),%eax
  402868:       83 e8 0a                sub    $0xa,%eax
  40286b:       75 05                   jne    402872 <submitr+0x59c>
  40286d:       0f b6 44 24 42          movzbl 0x42(%rsp),%eax
  402872:       85 c0                   test   %eax,%eax
  402874:       0f 85 4a ff ff ff       jne    4027c4 <submitr+0x4ee>
  40287a:       ba 00 20 00 00          mov    $0x2000,%edx
  40287f:       48 8d 74 24 40          lea    0x40(%rsp),%rsi
  402884:       48 8d bc 24 40 80 00    lea    0x8040(%rsp),%rdi
  40288b:       00 
  40288c:       e8 b6 f8 ff ff          call   402147 <rio_readlineb>
  402891:       48 85 c0                test   %rax,%rax
  402894:       0f 8f 83 00 00 00       jg     40291d <submitr+0x647>
  40289a:       48 b8 45 72 72 6f 72    movabs $0x43203a726f727245,%rax
  4028a1:       3a 20 43 
  4028a4:       48 89 03                mov    %rax,(%rbx)
  4028a7:       48 b8 6c 69 65 6e 74    movabs $0x6e7520746e65696c,%rax
  4028ae:       20 75 6e 
  4028b1:       48 89 43 08             mov    %rax,0x8(%rbx)
  4028b5:       48 b8 61 62 6c 65 20    movabs $0x206f7420656c6261,%rax
  4028bc:       74 6f 20 
  4028bf:       48 89 43 10             mov    %rax,0x10(%rbx)
  4028c3:       48 b8 72 65 61 64 20    movabs $0x6174732064616572,%rax
  4028ca:       73 74 61 
  4028cd:       48 89 43 18             mov    %rax,0x18(%rbx)
  4028d1:       48 b8 74 75 73 20 6d    movabs $0x7373656d20737574,%rax
  4028d8:       65 73 73 
  4028db:       48 89 43 20             mov    %rax,0x20(%rbx)
  4028df:       48 b8 61 67 65 20 66    movabs $0x6d6f726620656761,%rax
  4028e6:       72 6f 6d 
  4028e9:       48 89 43 28             mov    %rax,0x28(%rbx)
  4028ed:       48 b8 20 72 65 73 75    movabs $0x20746c7573657220,%rax
  4028f4:       6c 74 20 
  4028f7:       48 89 43 30             mov    %rax,0x30(%rbx)
  4028fb:       c7 43 38 73 65 72 76    movl   $0x76726573,0x38(%rbx)
  402902:       66 c7 43 3c 65 72       movw   $0x7265,0x3c(%rbx)
  402908:       c6 43 3e 00             movb   $0x0,0x3e(%rbx)
  40290c:       89 ef                   mov    %ebp,%edi
  40290e:       e8 0d e4 ff ff          call   400d20 <close@plt>
  402913:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  402918:       e9 b4 00 00 00          jmp    4029d1 <submitr+0x6fb>
  40291d:       44 8b 44 24 2c          mov    0x2c(%rsp),%r8d
  402922:       41 81 f8 c8 00 00 00    cmp    $0xc8,%r8d
  402929:       74 34                   je     40295f <submitr+0x689>
  40292b:       4c 8d 8c 24 40 60 00    lea    0x6040(%rsp),%r9
  402932:       00 
  402933:       b9 28 35 40 00          mov    $0x403528,%ecx
  402938:       48 c7 c2 ff ff ff ff    mov    $0xffffffffffffffff,%rdx
  40293f:       be 01 00 00 00          mov    $0x1,%esi
  402944:       48 89 df                mov    %rbx,%rdi
  402947:       b8 00 00 00 00          mov    $0x0,%eax
  40294c:       e8 1f e5 ff ff          call   400e70 <__sprintf_chk@plt>
  402951:       89 ef                   mov    %ebp,%edi
  402953:       e8 c8 e3 ff ff          call   400d20 <close@plt>
  402958:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  40295d:       eb 72                   jmp    4029d1 <submitr+0x6fb>
  40295f:       48 8d 74 24 40          lea    0x40(%rsp),%rsi
  402964:       48 89 df                mov    %rbx,%rdi
  402967:       e8 44 e3 ff ff          call   400cb0 <strcpy@plt>
  40296c:       89 ef                   mov    %ebp,%edi
  40296e:       e8 ad e3 ff ff          call   400d20 <close@plt>
  402973:       0f b6 13                movzbl (%rbx),%edx
  402976:       83 ea 4f                sub    $0x4f,%edx
  402979:       89 d1                   mov    %edx,%ecx
  40297b:       85 d2                   test   %edx,%edx
  40297d:       75 16                   jne    402995 <submitr+0x6bf>
  40297f:       0f b6 4b 01             movzbl 0x1(%rbx),%ecx
  402983:       83 e9 4b                sub    $0x4b,%ecx
  402986:       75 0d                   jne    402995 <submitr+0x6bf>
  402988:       0f b6 4b 02             movzbl 0x2(%rbx),%ecx
  40298c:       83 e9 0a                sub    $0xa,%ecx
  40298f:       75 04                   jne    402995 <submitr+0x6bf>
  402991:       0f b6 4b 03             movzbl 0x3(%rbx),%ecx
  402995:       b8 00 00 00 00          mov    $0x0,%eax
  40299a:       85 c9                   test   %ecx,%ecx
  40299c:       74 33                   je     4029d1 <submitr+0x6fb>
  40299e:       bf 70 35 40 00          mov    $0x403570,%edi
  4029a3:       b9 05 00 00 00          mov    $0x5,%ecx
  4029a8:       48 89 de                mov    %rbx,%rsi
  4029ab:       f3 a6                   repz cmpsb %es:(%rdi),%ds:(%rsi)
  4029ad:       40 0f 97 c6             seta   %sil
  4029b1:       0f 92 c1                setb   %cl
  4029b4:       40 38 ce                cmp    %cl,%sil
  4029b7:       74 18                   je     4029d1 <submitr+0x6fb>
  4029b9:       85 d2                   test   %edx,%edx
  4029bb:       75 0d                   jne    4029ca <submitr+0x6f4>
  4029bd:       0f b6 53 01             movzbl 0x1(%rbx),%edx
  4029c1:       83 ea 4b                sub    $0x4b,%edx
  4029c4:       75 04                   jne    4029ca <submitr+0x6f4>
  4029c6:       0f b6 53 02             movzbl 0x2(%rbx),%edx
  4029ca:       83 fa 01                cmp    $0x1,%edx
  4029cd:       19 c0                   sbb    %eax,%eax
  4029cf:       f7 d0                   not    %eax
  4029d1:       48 8b 9c 24 58 a0 00    mov    0xa058(%rsp),%rbx
  4029d8:       00 
  4029d9:       64 48 33 1c 25 28 00    xor    %fs:0x28,%rbx
  4029e0:       00 00 
  4029e2:       74 05                   je     4029e9 <submitr+0x713>
  4029e4:       e8 f7 e2 ff ff          call   400ce0 <__stack_chk_fail@plt>
  4029e9:       48 81 c4 68 a0 00 00    add    $0xa068,%rsp
  4029f0:       5b                      pop    %rbx
  4029f1:       5d                      pop    %rbp
  4029f2:       41 5c                   pop    %r12
  4029f4:       41 5d                   pop    %r13
  4029f6:       41 5e                   pop    %r14
  4029f8:       41 5f                   pop    %r15
  4029fa:       c3                      ret    

00000000004029fb <init_timeout>:
  4029fb:       53                      push   %rbx
  4029fc:       89 fb                   mov    %edi,%ebx
  4029fe:       85 ff                   test   %edi,%edi
  402a00:       74 20                   je     402a22 <init_timeout+0x27>
  402a02:       85 ff                   test   %edi,%edi
  402a04:       b8 00 00 00 00          mov    $0x0,%eax
  402a09:       0f 48 d8                cmovs  %eax,%ebx
  402a0c:       be 32 20 40 00          mov    $0x402032,%esi
  402a11:       bf 0e 00 00 00          mov    $0xe,%edi
  402a16:       e8 35 e3 ff ff          call   400d50 <signal@plt>
  402a1b:       89 df                   mov    %ebx,%edi
  402a1d:       e8 ee e2 ff ff          call   400d10 <alarm@plt>
  402a22:       5b                      pop    %rbx
  402a23:       c3                      ret    

0000000000402a24 <init_driver>:
  402a24:       55                      push   %rbp
  402a25:       53                      push   %rbx
  402a26:       48 83 ec 28             sub    $0x28,%rsp
  402a2a:       48 89 fd                mov    %rdi,%rbp
  402a2d:       64 48 8b 04 25 28 00    mov    %fs:0x28,%rax
  402a34:       00 00 
  402a36:       48 89 44 24 18          mov    %rax,0x18(%rsp)
  402a3b:       31 c0                   xor    %eax,%eax
  402a3d:       be 01 00 00 00          mov    $0x1,%esi
  402a42:       bf 0d 00 00 00          mov    $0xd,%edi
  402a47:       e8 04 e3 ff ff          call   400d50 <signal@plt>
  402a4c:       be 01 00 00 00          mov    $0x1,%esi
  402a51:       bf 1d 00 00 00          mov    $0x1d,%edi
  402a56:       e8 f5 e2 ff ff          call   400d50 <signal@plt>
  402a5b:       be 01 00 00 00          mov    $0x1,%esi
  402a60:       bf 1d 00 00 00          mov    $0x1d,%edi
  402a65:       e8 e6 e2 ff ff          call   400d50 <signal@plt>
  402a6a:       ba 00 00 00 00          mov    $0x0,%edx
  402a6f:       be 01 00 00 00          mov    $0x1,%esi
  402a74:       bf 02 00 00 00          mov    $0x2,%edi
  402a79:       e8 02 e4 ff ff          call   400e80 <socket@plt>
  402a7e:       89 c3                   mov    %eax,%ebx
  402a80:       85 c0                   test   %eax,%eax
  402a82:       79 4f                   jns    402ad3 <init_driver+0xaf>
  402a84:       48 b8 45 72 72 6f 72    movabs $0x43203a726f727245,%rax
  402a8b:       3a 20 43 
  402a8e:       48 89 45 00             mov    %rax,0x0(%rbp)
  402a92:       48 b8 6c 69 65 6e 74    movabs $0x6e7520746e65696c,%rax
  402a99:       20 75 6e 
  402a9c:       48 89 45 08             mov    %rax,0x8(%rbp)
  402aa0:       48 b8 61 62 6c 65 20    movabs $0x206f7420656c6261,%rax
  402aa7:       74 6f 20 
  402aaa:       48 89 45 10             mov    %rax,0x10(%rbp)
  402aae:       48 b8 63 72 65 61 74    movabs $0x7320657461657263,%rax
  402ab5:       65 20 73 
  402ab8:       48 89 45 18             mov    %rax,0x18(%rbp)
  402abc:       c7 45 20 6f 63 6b 65    movl   $0x656b636f,0x20(%rbp)
  402ac3:       66 c7 45 24 74 00       movw   $0x74,0x24(%rbp)
  402ac9:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  402ace:       e9 28 01 00 00          jmp    402bfb <init_driver+0x1d7>
  402ad3:       bf 75 35 40 00          mov    $0x403575,%edi
  402ad8:       e8 83 e2 ff ff          call   400d60 <gethostbyname@plt>
  402add:       48 85 c0                test   %rax,%rax
  402ae0:       75 68                   jne    402b4a <init_driver+0x126>
  402ae2:       48 b8 45 72 72 6f 72    movabs $0x44203a726f727245,%rax
  402ae9:       3a 20 44 
  402aec:       48 89 45 00             mov    %rax,0x0(%rbp)
  402af0:       48 b8 4e 53 20 69 73    movabs $0x6e7520736920534e,%rax
  402af7:       20 75 6e 
  402afa:       48 89 45 08             mov    %rax,0x8(%rbp)
  402afe:       48 b8 61 62 6c 65 20    movabs $0x206f7420656c6261,%rax
  402b05:       74 6f 20 
  402b08:       48 89 45 10             mov    %rax,0x10(%rbp)
  402b0c:       48 b8 72 65 73 6f 6c    movabs $0x2065766c6f736572,%rax
  402b13:       76 65 20 
  402b16:       48 89 45 18             mov    %rax,0x18(%rbp)
  402b1a:       48 b8 73 65 72 76 65    movabs $0x6120726576726573,%rax
  402b21:       72 20 61 
  402b24:       48 89 45 20             mov    %rax,0x20(%rbp)
  402b28:       c7 45 28 64 64 72 65    movl   $0x65726464,0x28(%rbp)
  402b2f:       66 c7 45 2c 73 73       movw   $0x7373,0x2c(%rbp)
  402b35:       c6 45 2e 00             movb   $0x0,0x2e(%rbp)
  402b39:       89 df                   mov    %ebx,%edi
  402b3b:       e8 e0 e1 ff ff          call   400d20 <close@plt>
  402b40:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  402b45:       e9 b1 00 00 00          jmp    402bfb <init_driver+0x1d7>
  402b4a:       48 c7 04 24 00 00 00    movq   $0x0,(%rsp)
  402b51:       00 
  402b52:       48 c7 44 24 08 00 00    movq   $0x0,0x8(%rsp)
  402b59:       00 00 
  402b5b:       66 c7 04 24 02 00       movw   $0x2,(%rsp)
  402b61:       48 63 50 14             movslq 0x14(%rax),%rdx
  402b65:       48 8b 40 18             mov    0x18(%rax),%rax
  402b69:       48 8b 30                mov    (%rax),%rsi
  402b6c:       48 8d 7c 24 04          lea    0x4(%rsp),%rdi
  402b71:       b9 0c 00 00 00          mov    $0xc,%ecx
  402b76:       e8 f5 e1 ff ff          call   400d70 <__memmove_chk@plt>
  402b7b:       66 c7 44 24 02 3c 9a    movw   $0x9a3c,0x2(%rsp)
  402b82:       ba 10 00 00 00          mov    $0x10,%edx
  402b87:       48 89 e6                mov    %rsp,%rsi
  402b8a:       89 df                   mov    %ebx,%edi
  402b8c:       e8 bf e2 ff ff          call   400e50 <connect@plt>
  402b91:       85 c0                   test   %eax,%eax
  402b93:       79 50                   jns    402be5 <init_driver+0x1c1>
  402b95:       48 b8 45 72 72 6f 72    movabs $0x55203a726f727245,%rax
  402b9c:       3a 20 55 
  402b9f:       48 89 45 00             mov    %rax,0x0(%rbp)
  402ba3:       48 b8 6e 61 62 6c 65    movabs $0x6f7420656c62616e,%rax
  402baa:       20 74 6f 
  402bad:       48 89 45 08             mov    %rax,0x8(%rbp)
  402bb1:       48 b8 20 63 6f 6e 6e    movabs $0x7463656e6e6f6320,%rax
  402bb8:       65 63 74 
  402bbb:       48 89 45 10             mov    %rax,0x10(%rbp)
  402bbf:       48 b8 20 74 6f 20 73    movabs $0x76726573206f7420,%rax
  402bc6:       65 72 76 
  402bc9:       48 89 45 18             mov    %rax,0x18(%rbp)
  402bcd:       66 c7 45 20 65 72       movw   $0x7265,0x20(%rbp)
  402bd3:       c6 45 22 00             movb   $0x0,0x22(%rbp)
  402bd7:       89 df                   mov    %ebx,%edi
  402bd9:       e8 42 e1 ff ff          call   400d20 <close@plt>
  402bde:       b8 ff ff ff ff          mov    $0xffffffff,%eax
  402be3:       eb 16                   jmp    402bfb <init_driver+0x1d7>
  402be5:       89 df                   mov    %ebx,%edi
  402be7:       e8 34 e1 ff ff          call   400d20 <close@plt>
  402bec:       66 c7 45 00 4f 4b       movw   $0x4b4f,0x0(%rbp)
  402bf2:       c6 45 02 00             movb   $0x0,0x2(%rbp)
  402bf6:       b8 00 00 00 00          mov    $0x0,%eax
  402bfb:       48 8b 4c 24 18          mov    0x18(%rsp),%rcx
  402c00:       64 48 33 0c 25 28 00    xor    %fs:0x28,%rcx
  402c07:       00 00 
  402c09:       74 05                   je     402c10 <init_driver+0x1ec>
  402c0b:       e8 d0 e0 ff ff          call   400ce0 <__stack_chk_fail@plt>
  402c10:       48 83 c4 28             add    $0x28,%rsp
  402c14:       5b                      pop    %rbx
  402c15:       5d                      pop    %rbp
  402c16:       c3                      ret    

0000000000402c17 <driver_post>:
  402c17:       53                      push   %rbx
  402c18:       48 83 ec 10             sub    $0x10,%rsp
  402c1c:       4c 89 cb                mov    %r9,%rbx
  402c1f:       45 85 c0                test   %r8d,%r8d
  402c22:       74 27                   je     402c4b <driver_post+0x34>
  402c24:       48 89 ca                mov    %rcx,%rdx
  402c27:       be 8d 35 40 00          mov    $0x40358d,%esi
  402c2c:       bf 01 00 00 00          mov    $0x1,%edi
  402c31:       b8 00 00 00 00          mov    $0x0,%eax
  402c36:       e8 b5 e1 ff ff          call   400df0 <__printf_chk@plt>
  402c3b:       66 c7 03 4f 4b          movw   $0x4b4f,(%rbx)
  402c40:       c6 43 02 00             movb   $0x0,0x2(%rbx)
  402c44:       b8 00 00 00 00          mov    $0x0,%eax
  402c49:       eb 39                   jmp    402c84 <driver_post+0x6d>
  402c4b:       48 85 ff                test   %rdi,%rdi
  402c4e:       74 26                   je     402c76 <driver_post+0x5f>
  402c50:       80 3f 00                cmpb   $0x0,(%rdi)
  402c53:       74 21                   je     402c76 <driver_post+0x5f>
  402c55:       4c 89 0c 24             mov    %r9,(%rsp)
  402c59:       49 89 c9                mov    %rcx,%r9
  402c5c:       49 89 d0                mov    %rdx,%r8
  402c5f:       48 89 f9                mov    %rdi,%rcx
  402c62:       48 89 f2                mov    %rsi,%rdx
  402c65:       be 9a 3c 00 00          mov    $0x3c9a,%esi
  402c6a:       bf 75 35 40 00          mov    $0x403575,%edi
  402c6f:       e8 62 f6 ff ff          call   4022d6 <submitr>
  402c74:       eb 0e                   jmp    402c84 <driver_post+0x6d>
  402c76:       66 c7 03 4f 4b          movw   $0x4b4f,(%rbx)
  402c7b:       c6 43 02 00             movb   $0x0,0x2(%rbx)
  402c7f:       b8 00 00 00 00          mov    $0x0,%eax
  402c84:       48 83 c4 10             add    $0x10,%rsp
  402c88:       5b                      pop    %rbx
  402c89:       c3                      ret    
  402c8a:       90                      nop
  402c8b:       90                      nop

0000000000402c8c <check>:
  402c8c:       89 fa                   mov    %edi,%edx
  402c8e:       c1 ea 1c                shr    $0x1c,%edx
  402c91:       b8 00 00 00 00          mov    $0x0,%eax
  402c96:       b9 00 00 00 00          mov    $0x0,%ecx
  402c9b:       85 d2                   test   %edx,%edx
  402c9d:       75 0d                   jne    402cac <check+0x20>
  402c9f:       eb 1b                   jmp    402cbc <check+0x30>
  402ca1:       89 f8                   mov    %edi,%eax
  402ca3:       d3 e8                   shr    %cl,%eax
  402ca5:       3c 0a                   cmp    $0xa,%al
  402ca7:       74 0e                   je     402cb7 <check+0x2b>
  402ca9:       83 c1 08                add    $0x8,%ecx
  402cac:       83 f9 1f                cmp    $0x1f,%ecx
  402caf:       7e f0                   jle    402ca1 <check+0x15>
  402cb1:       b8 01 00 00 00          mov    $0x1,%eax
  402cb6:       c3                      ret    
  402cb7:       b8 00 00 00 00          mov    $0x0,%eax
  402cbc:       f3 c3                   repz ret 

0000000000402cbe <gencookie>:
  402cbe:       53                      push   %rbx
  402cbf:       83 c7 01                add    $0x1,%edi
  402cc2:       e8 c9 df ff ff          call   400c90 <srandom@plt>
  402cc7:       e8 e4 e0 ff ff          call   400db0 <random@plt>
  402ccc:       89 c3                   mov    %eax,%ebx
  402cce:       89 c7                   mov    %eax,%edi
  402cd0:       e8 b7 ff ff ff          call   402c8c <check>
  402cd5:       85 c0                   test   %eax,%eax
  402cd7:       74 ee                   je     402cc7 <gencookie+0x9>
  402cd9:       89 d8                   mov    %ebx,%eax
  402cdb:       5b                      pop    %rbx
  402cdc:       c3                      ret    
  402cdd:       90                      nop
  402cde:       90                      nop
  402cdf:       90                      nop

0000000000402ce0 <__libc_csu_init>:
  402ce0:       48 89 6c 24 d8          mov    %rbp,-0x28(%rsp)
  402ce5:       4c 89 64 24 e0          mov    %r12,-0x20(%rsp)
  402cea:       48 8d 2d 0f 11 20 00    lea    0x20110f(%rip),%rbp        # 603e00 <__do_global_dtors_aux_fini_array_entry>
  402cf1:       4c 8d 25 00 11 20 00    lea    0x201100(%rip),%r12        # 603df8 <__frame_dummy_init_array_entry>
  402cf8:       4c 89 6c 24 e8          mov    %r13,-0x18(%rsp)
  402cfd:       4c 89 74 24 f0          mov    %r14,-0x10(%rsp)
  402d02:       4c 89 7c 24 f8          mov    %r15,-0x8(%rsp)
  402d07:       48 89 5c 24 d0          mov    %rbx,-0x30(%rsp)
  402d0c:       48 83 ec 38             sub    $0x38,%rsp
  402d10:       4c 29 e5                sub    %r12,%rbp
  402d13:       41 89 fd                mov    %edi,%r13d
  402d16:       49 89 f6                mov    %rsi,%r14
  402d19:       48 c1 fd 03             sar    $0x3,%rbp
  402d1d:       49 89 d7                mov    %rdx,%r15
  402d20:       e8 23 df ff ff          call   400c48 <_init>
  402d25:       48 85 ed                test   %rbp,%rbp
  402d28:       74 1c                   je     402d46 <__libc_csu_init+0x66>
  402d2a:       31 db                   xor    %ebx,%ebx
  402d2c:       0f 1f 40 00             nopl   0x0(%rax)
  402d30:       4c 89 fa                mov    %r15,%rdx
  402d33:       4c 89 f6                mov    %r14,%rsi
  402d36:       44 89 ef                mov    %r13d,%edi
  402d39:       41 ff 14 dc             call   *(%r12,%rbx,8)
  402d3d:       48 83 c3 01             add    $0x1,%rbx
  402d41:       48 39 eb                cmp    %rbp,%rbx
  402d44:       75 ea                   jne    402d30 <__libc_csu_init+0x50>
  402d46:       48 8b 5c 24 08          mov    0x8(%rsp),%rbx
  402d4b:       48 8b 6c 24 10          mov    0x10(%rsp),%rbp
  402d50:       4c 8b 64 24 18          mov    0x18(%rsp),%r12
  402d55:       4c 8b 6c 24 20          mov    0x20(%rsp),%r13
  402d5a:       4c 8b 74 24 28          mov    0x28(%rsp),%r14
  402d5f:       4c 8b 7c 24 30          mov    0x30(%rsp),%r15
  402d64:       48 83 c4 38             add    $0x38,%rsp
  402d68:       c3                      ret    
  402d69:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000402d70 <__libc_csu_fini>:
  402d70:       f3 c3                   repz ret 
  402d72:       90                      nop
  402d73:       90                      nop

Disassembly of section .fini:

0000000000402d74 <_fini>:
  402d74:       48 83 ec 08             sub    $0x8,%rsp
  402d78:       48 83 c4 08             add    $0x8,%rsp
  402d7c:       c3                      ret    
