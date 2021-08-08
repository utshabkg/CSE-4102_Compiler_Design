#use command "make SHELL=cmd"

input = input.txt
output = output.txt
	
main: 1603022_Q1.l 1603022_Q1.y
	bison -d 1603022_Q1.y 
	flex 1603022_Q1.l 
	gcc 1603022_Q1.tab.c lex.yy.c
	a <$(input)> $(output)
	a < input.txt