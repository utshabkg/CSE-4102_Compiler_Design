%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%start program
%token KEYWORD ID COLON POINT TYPE LP RP STRING
%left ADD SUB

%%
program     : KEYWORD ID LP ID RP COLON statements
            ;
statements  : statements statement
            |
            ;
statement   : KEYWORD LP STRING RP
            ;

%%

int main(){
    yyparse();
    printf("Parsing Finished.\n");
}

void yyerror(char *s){
    fprintf(stderr, "error: %s", s);
}