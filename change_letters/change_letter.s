.global _main

_main:
    // create 16 byte stack space
    sub sp, sp, #16  // sub(sbutract): sub destination, source, value -> dest = src - val; equivalent to sp = sp - 16

    // add 'A'
    mov w0, #'A'  // w0: register, 32bit
    strb w0, [sp]

    // write
    mov x0, #1 // stdout
    mov x1, sp // addr
    mov x2, #1 // length

    mov x16, #4
    svc #0x80

    // change to 'B'
    mov w0, #'B'
    strb w0, [sp]  // str: store register, b: byte (store register byte); strb: 1byte, strh: 2byte, str: 8byte.

    // write again
    mov x0, #1 // stdout
    mov x1, sp // addr
    mov x2, #1 // length

    mov x16, #4
    svc #0x80

    // recover stack
    add sp, sp, #16  // sp = sp + 16

    // exit
    mov x0, #0
    mov x16, #1
    svc #0x80 // 128