CC = gcc
CFLAGS = -pipe
PRNAME = simulator

all: $(PRNAME).o tags
	$(CC) $(CFLAGS) $(PRNAME).o -o $(PRNAME)

simulator.o: $(PRNAME).c
	$(CC) $(CFLAGS) -c $(PRNAME).c

debug: CFLAGS += -g
debug: all
	@echo DEBUG: gdb $(PRNAME)
	@echo MEM: valgrind --leak-check=full ./$(PRNAME) *args*

tags:
	ctags -R -f ./.tags
	cscope -bcqR -f ./.cscope.out

clean:
	rm $(PRNAME) *.o *.*~ *~ .tags .cscope*
