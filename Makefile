#use command "make main SHELL=cmd"
input = in_4.1.txt
output = out_4.1.txt

main: lab_4.1.l
	flex lab_4.1.l
	gcc lex.yy.c
	a <$(input)> $(output)

main2: lab_4.1.l lab_4.1.y
	bison -d lab_4.1.y
	flex lab_4.1.l
	gcc lab_4.1.tab.c lex.yy.c
	a <$(input)> $(output)