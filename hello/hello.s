// hello.s
.section __TEXT,__text
.global _main

_main:
    // call write(1, msg, 12 instead of printf
    mov x0, #1 // fd = 1 (stdout)
    adr x1, msg //buf = msg addr
    mov x2, #12 // len = 12bytes
    mov x16, #4 // macOS syscall: write
    svc #0x80 // Supervisor Call. #0x80 means user space syscall in macos 

    mov x0, #0 // exit code 0
    mov x16, #1 // macOS syscall: exit
    svc #0x80

msg:
    .ascii "Hello, ARM!\n"