%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%start program
%token KEYWORD ID SEMICOLON POINT ASSIGN TYPE LP RP LB RB STRING
%left ADD SUB

%%
program     : KEYWORD ID LP RP LB statements RB
            ;
statements  : statements statement
            |
            ;
statement   : declaration
            ;
declaration : TYPE ID ASSIGN STRING SEMICOLON
            | KEYWORD POINT KEYWORD LP ID RP SEMICOLON
            ;
%%

int main(){
    yyparse();
    printf("Parsing Finished.\n");
}

void yyerror(char *s){
    fprintf(stderr, "error: %s", s);
}