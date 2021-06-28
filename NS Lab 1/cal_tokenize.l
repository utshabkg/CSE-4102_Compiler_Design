%option noyywrap

%{
    
%}

delim [ \t]
ws {delim}+
digit [0-9]
number ({digit}+)

%%
{ws} {}
{number} {printf("%s NUMBER\n", yytext);}
"+" {printf("%s ADD\n", yytext);}
%%
