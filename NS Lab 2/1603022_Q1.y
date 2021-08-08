%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%start program
%token KEYWORD ID SEMICOLON POINT ASSIGN TYPE LP RP LB RB STRING NUMBER LESS COM INC MAIN DEC PLUS GREQ
%left ADD SUB

%%
program     : TYPE MAIN LP RP LB statements RB
            ;
statements  : statements statement
            |
            ;
statement   : TYPE ID ASSIGN NUMBER SEMICOLON
            | KEYWORD LP condition RP LB extensions RB
            ;
extensions  : extensions extension
            |
            ;
extension   : KEYWORD LP ID COM NUMBER RP LB ID ASSIGN ID PLUS NUMBER SEMICOLON RB
            | KEYWORD LP ID GREQ NUMBER RP LB ID ASSIGN ID INC SEMICOLON RB
            | KEYWORD LB ID DEC SEMICOLON RB
condition   : ID ASSIGN NUMBER SEMICOLON ID LESS NUMBER SEMICOLON
%%

int main(){
    yyparse();
    printf("Parsing Finished.\n");
}

void yyerror(char *s){
    fprintf(stderr, "error: %s", s);
}