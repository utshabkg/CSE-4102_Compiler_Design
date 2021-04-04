%{
    #include<stdio.h>
    void yyerror(char *s);
    int yylex();
%}

%token NUM ADD SUB
%start lab

%%
lab: NUM ADD NUM
%%

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}

// error management
void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}