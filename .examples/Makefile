CC=gcc
CFLAGS=-pipe

all: mycat.o
	$(CC) $(CFLAGS) mycat.o -lm -o mycat

myarr.o: mycat.c
	$(CC) $(CFLAGS) -c mycat.c

clean:
	rm mycat *.o *.*~ *~
