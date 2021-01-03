%{
    #include<stdio.h>
%}

/* we can also define variable */
letter [A-Za-z]
digit [0-9]

%%
[A-Za-z] { printf("%s is a letter\n", yytext); }
[0-9] { printf("%s is a digit\n", yytext); }

[A-Za-z]+ { printf("%s is a word\n", yytext); }
[0-9]+ { printf("%s is a number\n", yytext); }


("_"|{letter})({letter}|{digit}|"_")* { printf("%s is an identifier\n", yytext); }
.* { printf("Nothing is matched"); }
%%

int yywrap()
{

}

int main()
{
    yylex();
}