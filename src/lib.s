  .globl _strlen, allocString, reallocString, _inputString

  .data

START_BUF_LEN: .quad 3
NEWLINE: .ascii "\n"

  .text

_strlen:
  mov %rdi, %rsi
  mov $-1, %rcx
  xor %rax, %rax
  repne scasb
  not %rcx
  dec %rcx
  mov %rcx, %rax
  ret

allocString:
  mov %rdi, %rbx
  mov $4, %rdi
  call malloc
  movb $0, (%rax)
  mov %rax, (%rbx)
  movq $3, 8(%rbx)
  mov %rbx, %rdx
  nop
  ret

reallocString:
  mov %rdi, %rbx
  mov 8(%rbx), %rax
  mov $2, %rcx
  imul %rcx, %rax
  inc %rax
  mov (%rbx), %rdi
  mov %rax, %rsi
  push %rsi
  call realloc
  mov %rax, (%rbx)
  pop %rsi
  movq %rsi, 8(%rbx)
  ret

_inputString:
  mov %rdi, %rbp
  xor %r12, %r12
  mov (NEWLINE), %bh

  gc:
  call getchar
  movb %al, %bl
  cmp %bl, %bh
  jz done

  cmp 8(%rbp), %r12
  jbe writeByte
  call reallocString
  mov %rdi, %rbp

  writeByte:
  mov %bl, (%rbp, %r12)
  inc %r12
  jmp gc

  done:
  movb $0, (%rbp, %r12)
  ret
