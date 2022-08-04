#include <stdio.h>
#include <string.h>

const int cookie = 0x59b997f;

int main() {
    asm (
        "pop %rax \n mov %rax, %rdi \n "
    );
}