# move the address of the top of stack to %rdi
movq %rsp, %rax
movq %rax, %rdi

# move the bias to %esi
popq %rax
movl %eax, %esi

# calculate the address of cookie
leaq (%rdi, %rsi), %rax
movq %rax, %rdi