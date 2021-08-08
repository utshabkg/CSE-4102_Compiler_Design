%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%start program
%token IF ID SEMICOLON POINT ASSIGN TYPE LP RP LB RB STRING NUMBER LESS COM INC MAIN DEC PLUS BOOL
%left ADD SUB

%%
program     : IF LP ID BOOL NUMBER RP SEMICOLON
%%

int main(){
    yyparse();
    printf("Parsing Finished.\n");
}

void yyerror(char *s){
    fprintf(stderr, "error: %s", s);
}