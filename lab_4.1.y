%{
    #include<stdio.h>
    void yyerror(char *s);
    int yylex();
%}

%token NUM ADD SUB
%start lab
%left ADD SUB

%%
lab: exp {$$ = $1; printf("%d\n", $$);}
    ;
exp: exp ADD NUM {$$ = $1+$3; printf("ADD: %d\n", $$);}
    | exp SUB NUM {$$ = $1-$3; printf("SUB: %d\n", $$);}
    | NUM {$$=$1; printf("NUM %d\n", $$);}
    ;
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