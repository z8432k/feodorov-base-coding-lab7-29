#include <stdlib.h>
#include <stddef.h>

typedef char *String;

typedef struct {
  String buf;
  size_t size;
} String_t;


size_t _strlen(String s);
void allocString(String_t *s);
void reallocString(String_t *s);
void program(void);
