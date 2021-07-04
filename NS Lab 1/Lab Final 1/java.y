%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%start program
%token NUM ADD SUB ID IF SEMICOLON ASSIGN TYPE LP RP LB RB MAIN EQUAL C KEYWORD
%left ADD SUB

%%
program     : C ID LB statements RB
            ;
statements  : statements statement
            |
            ;
statement   : declaration
            | KEYWORD TYPE TYPE MAIN LP TYPE ID 
            ;
declaration : TYPE ID ASSIGN expr SEMICOLON RP LB expr
            ;
expr        : expr ADD number
            | expr SUB number
            | expr EQUAL number
            | number
            | ID
            ;
number      : NUM
            | SUB NUM
            ;
%%

int main(){
    yyparse();
    printf("Parsing Finished.\n");
}

void yyerror(char *s){
    fprintf(stderr, "error: %s", s);
}