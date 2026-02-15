# asm
A personal repository for learning AArch64 assembly language on macOS (M2).

## AArch64
General Purpose Registers

┌─────┬──────────────────────────────────────────────────────┐
│ x0  │ Function argument 1 / Return value                   │
│ x1  │ Function argument 2                                  │
│ x2  │ Function argument 3                                  │
│ ... │ ...                                                  │
│ x7  │ Function argument 8                                  │
├─────┼──────────────────────────────────────────────────────┤
│ x8  │ General purpose (also used for syscall number)       │
│ ... │                                                      │
│ x18 │ General purpose (platform reserved on macOS)         │
├─────┼──────────────────────────────────────────────────────┤
│x19  │ Callee-saved registers                               │
│ ... │ (must be preserved across function calls)            │
│x28  │                                                      │
├─────┼──────────────────────────────────────────────────────┤
│ x29 │ Frame Pointer (fp) — tracks the current stack frame  │
│ x30 │ Link Register (lr) — holds the return address        │
├─────┼──────────────────────────────────────────────────────┤
│ sp  │ Stack Pointer — points to the top of the stack       │
│ pc  │ Program Counter — address of the current instruction │
│ xzr │ Zero Register — always reads as 0, writes discarded  │
└─────┴──────────────────────────────────────────────────────┘

Notes

- Each register is 64-bit. The lower 32 bits are accessible via w0~w30.
- On macOS, the syscall number goes in x16 (not x8 as on Linux).
- x9~x15: caller-saved temporaries — may be clobbered by function calls.
- x19~x28: callee-saved — the called function must restore these before returning.