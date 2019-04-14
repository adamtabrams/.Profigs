CC = gcc
CFLAGS = -pipe
PRNAME = simulator

all: $(PRNAME).o
	$(CC) $(CFLAGS) $(PRNAME).o -o $(PRNAME)
	ctags -R -f ./.tags
	cscope -bcqR -f ./.cscope.out

simulator.o: $(PRNAME).c
	$(CC) $(CFLAGS) -c $(PRNAME).c

debug: CFLAGS += -g
debug: all
	@echo DEBUG WITH: gdb $(PRNAME)
	@echo MEMCHECK: valgrind --leak-check=full $(PRNAME) *args*

clean:
	rm $(PRNAME) *.o *.*~ *~ .tags .cscope*
