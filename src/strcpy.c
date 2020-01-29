#include <stdio.h>
#include "lib.h"

#define START_BUF_LEN 3

void _strdup(String_t *dst, String_t *src, size_t n);
void inputString(String_t *s);
void allocString(String_t *s);
void reallocString(String_t *s);

int main(void) {
  printf("= Copy FIRST string to SECOND string N times. =\n");

  // printf("%zu\n", _strlen("123"));

  size_t count;
  String_t src;
  String_t dst;
  allocString(&src);
  allocString(&dst);

  printf("Input FIRST string: ");
  inputString(&src);

  printf("Input SECOND string: ");
  inputString(&dst);

  printf("Input the count of copies: ");
  scanf("%zu", &count);

  _strdup(&dst, &src, count);

  printf("Result: %s\n", dst.buf);

  free(src.buf);
  free(dst.buf);

  exit(EXIT_SUCCESS);
}

void inputString(String_t *s) {
  char c;
  size_t inputSize = 0;

  while ((c = getchar()) != '\n') {

    if (inputSize > s->size) {
      reallocString(s);
    }

    s->buf[inputSize] = c;

    inputSize++;
  }

  s->buf[inputSize] = '\0';
}

void _strdup(String_t *dst, String_t *src, size_t n) {
  size_t srcLen = _strlen(src->buf);
  size_t dstLen = _strlen(dst->buf);

  for (size_t i = 0; i < n; i++) {
    for (size_t j = 0; j < srcLen; j++) {
      char c = src->buf[j];
      size_t pos = i * srcLen + j;

      if (pos == dst->size) {
        reallocString(dst);
      }

      dst->buf[pos] = c;
    }
  }

  if (srcLen * n > dstLen) {
    dst->buf[srcLen * n + 1] = '\0';
  }
}
