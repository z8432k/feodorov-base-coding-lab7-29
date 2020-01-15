  .globl _strlen

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

