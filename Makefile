PROGRAM = strcpy
CFLAGS = -Wall -Wextra -Wpedantic -ggdb -std=gnu11 -O0
LDLIBS =

default: bin/$(PROGRAM)

bin/lib.o: src/lib.s
	$(CC) $(CFLAGS) -o $@ -c $<

bin/$(PROGRAM): bin/$(PROGRAM).o bin/lib.o
	$(CC) $^ $(LDLIBS) -o $@

bin/$(PROGRAM).o: src/$(PROGRAM).c
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -fv bin/*.o bin/$(PROGRAM)
