  .globl _strlen, _allocString, _reallocString

  .data

START_BUF_LEN: .quad 3

  .text

# size_t _strlen(String s) {
#   size_t i = 0;
#   for (; s[i]; i++);
#
#   return i++;
# }
_strlen:
  mov %rdi, %rsi
  mov $-1, %rcx
  xor %rax, %rax
  repne scasb
  not %rcx
  dec %rcx
  mov %rcx, %rax
  ret

_allocString:
  mov %rdi, %rbx
  mov $4, %rdi
  call malloc
  movb $0, (%rax)
  mov %rax, (%rbx)
  movq $3, 8(%rbx)
  mov %rbx, %rdx
  nop
  ret

_reallocString:
  mov %rdi, %rbx
  mov 8(%rbx), %rax
  mov $2, %rcx
  imul %rcx, %rax
  inc %rax
  mov (%rbx), %rdi
  mov %rax, %rsi
  call realloc
  mov %rax, (%rbx)
  movq %rsi, 8(%rbx)
  ret
