%option noyywrap

%{
#include<stdio.h>
// Roll: 1603022
//Question 1: if (1) var+=1;
%}

delim [ \t]
ws {delim}+
us [_]
point [.]
digit [0-9]
letter [A-Za-z]
int ({digit}+)
type ("double"|"int"|"float"|"long"|"string")
key ("main"|"while"|"if")
id ({us}|{letter})({us}|{letter}|{digit})*

%%
{ws}        {}
{int}    { printf("%s Integer\n", yytext); }
{key}       { printf("%s Keyword\n", yytext); }
{id}        { printf("%s Identifier\n", yytext); }
"+"         { printf("%s Add\n", yytext); }
"="         { printf("%s Assign Operator\n", yytext); }
";"         { printf("%s Semicolon\n", yytext); }
"("         { printf("%s Left Parenthesis\n", yytext); }
")"         { printf("%s Right Parenthesis\n", yytext); }

%%

int main()
{
    yylex();
}
