#use command "make SHELL=cmd"

input1 = 1603022_Q1_input.txt
input2 = 1603022_Q2_input.txt

output1 = 1603022_Q1_output.txt
output2 = 1603022_Q2_output.txt

main1: 1603022_Q1.l
	flex 1603022_Q1.l
	gcc lex.yy.c
	a <$(input1)> $(output1)
	a < 1603022_Q1_input.txt

main2: 1603022_Q2.l 1603022_Q2.y
	bison -d 1603022_Q2.y
	flex 1603022_Q2.l
	gcc 1603022_Q2.tab.c lex.yy.c
	a <$(input2)> $(output2)
	a < 1603022_Q2_input.txt
