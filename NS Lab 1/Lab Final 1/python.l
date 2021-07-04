%option noyywrap

%{
    #include<stdio.h>
    // 1603036
    // def mokhaHasib01():
    // print("hasib mokha!!")
%}


char [A-Za-z]
tab [ \t]
us [_]

digit [0-9]
number ({digit}+)


space [ ]
sc [.,_!?]
invert ["]
comma [,]
string ({invert}(({char}+)|({space}+)|({sc}+))*{invert})
keyword ("def"|"print")
id ({us}*{char}*{digit}*) 

%%
{tab} {}
":" {printf("%s -> COLON \n", yytext);}
"(" {printf("%s -> LP \n", yytext);}
")" {printf("%s -> RP \n", yytext);}
{string} {printf("%s -> STRING \n", yytext);}
{keyword} {printf("%s -> keyword \n", yytext);}
{id} {printf("%s -> ID \n", yytext);}

%%

int main(){
    yylex();
}