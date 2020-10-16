all: labexam_april6.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o labexam_april6.o labexam_april6.asm 
	gcc -m64 -no-pie -o labexam_april6.out labexam_april6.o

clean:
	rm *.out
	rm *.o