# ARM64 Assembly (macOS Apple Silicon) — Personal Notes

This document explains basic ARM64 assembly concepts based on simple syscall examples on macOS.

---

# 1. What is `sub` and why is `sp` repeated?

Example:

```asm
sub sp, sp, #16
```

`sub` means **subtract**.

General form:

```asm
sub destination, source, value
```

Meaning:

```
destination = source - value
```

So this line means:

```
sp = sp - 16
```

This allocates 16 bytes on the stack.

The stack grows downward in memory, so subtracting moves the stack pointer down and creates space.

Equivalent C concept:

```c
sp = sp - 16;
```

---

# 2. What is `w0` and why not write directly to `sp`?

`w0` is a CPU register.

Registers are fast storage inside the CPU.

ARM64 registers:

- `x0`–`x30` → 64-bit
- `w0`–`w30` → lower 32 bits of x registers

Example:

```asm
mov w0, #'A'
```

Meaning:

```
w0 = 'A'
```

Why not store directly to memory?

Because ARM64 does NOT allow memory-to-memory moves.

You must use:

```
register → memory
```

So the correct flow is:

```asm
mov w0, #'A'
strb w0, [sp]
```

---

# 3. What is `strb`?

`strb` is short for:

```
Store Register Byte
```

Meaning:

Store 1 byte from a register into memory.

Example:

```asm
strb w0, [sp]
```

Meaning:

```
memory[sp] = w0 (1 byte)
```

Related instructions:

- `strb` → store byte (1 byte)
- `strh` → store halfword (2 bytes)
- `str` → store register (8 bytes)

---

# 4. Why is `add sp, sp, #16` restoring the stack?

Example:

```asm
add sp, sp, #16
```

`add` means:

```
destination = source + value
```

So:

```
sp = sp + 16
```

Earlier we did:

```asm
sub sp, sp, #16
```

So this restores the original stack position.

Equivalent concept:

Allocate:

```c
sp = sp - 16;
```

Restore:

```c
sp = sp + 16;
```

This keeps the stack balanced.

---

# Summary

sub sp, sp, #16

→ allocate stack space

mov w0, #'A'

→ store value in register

strb w0, [sp]

→ store register value into memory

add sp, sp, #16

→ restore stack