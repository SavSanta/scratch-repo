; nasm compile instructions
    ; Step 1 - Compile to Object File (this is 64-bit elf
       ; nasm -felf64 <this-nasm-file.nasm> -o <your-objectfile.o>
    ; Step 2  - Initiate linker
       ; ld <your-objectfile.o> -o finalbinary

global _start

section .text

_start:
    ; 64-bit assembly for linux
    ; grep "write" /usr/include/x86_64-linux-gnu/asm/unistd_64.h says write syscall value is 1
    ; man 2 write syntax -> ssize_t write(int fd, const void *buf, size_t count);

    ; move write syscall into RAX
    mov rax, 1

    ; fd is normal input/ output / or stderr numbers (0, 1, 2).
    ; write to  std output of course so move value of 1 to first parameter of ri
    mov rdi, 1

    ; the second argument, has to be *a pointer* to the string we want to print out 
    ; in our case the string is defined in the initialized  .data section
    mov rsi, dark_knight

    ; make this the number of bytes to print out
    ; length is defined in data section (can also use integers or hex integers)
    mov rdx, length

   ; Execute a syscall with syscall opcode
   syscall

   ; Funny if you dont direct the program where to go next it will segfault so
   ; call the exit syscall
   ; grep "exit" /usr/include/x86_64-linux-gnu/asm/unistd_64.h says write syscall value is 60

   mov rax, 60
   syscall

section .data

   ; 0xa is the newline character in assembly
   dark_knight: db "I am The Dark Knight!", 0xa
   length: equ $-dark_knight



