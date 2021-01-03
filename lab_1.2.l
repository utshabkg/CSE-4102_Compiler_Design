%{
    #include<stdio.h>
%}

digit [0-9]

%%
((R|B|K|C)UET(" ")CSE[ ]1{digit})* { printf("%s is a CSEian\n", yytext); }
.* { printf("%s ==> Not matched", yytext); }
%%

int yywrap()
{

}

int main()
{
    yylex();
}