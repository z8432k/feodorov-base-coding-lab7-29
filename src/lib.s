  .globl _strlen, allocString

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
  repne scasb
  not %rcx
  dec %rcx
  mov %rcx, %rax
  ret

allocString:
  push %rdi
  mov $1, %rax
  mov $3, %rcx
  imul %rax, %rcx
  mov %rax, %rdi
  call malloc
  mov %rax, %rbx
  movq $0, (%rbx)
  mov %rax, %rdi
  ret
