all: part2.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o part2.o part2.asm 
	gcc -m64 -no-pie -o part2.out part2.o

clean:
	rm *.out
	rm *.o