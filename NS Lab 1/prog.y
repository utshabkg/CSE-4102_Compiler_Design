%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB ID ASSIGN SEMI IF LP RP LB RB EQUAL
%start program
%left ADD SUB

%%
program: statement
    ;
statement: IF LP exp RP LB statement RB
    | id_declare
    ;
id_declare: ID ASSIGN exp SEMI
    ;
exp: number
    | exp ADD number
    | exp SUB number
    | exp EQUAL number
    |ID
number: NUM
        | SUB NUM
        ;
%%

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}
