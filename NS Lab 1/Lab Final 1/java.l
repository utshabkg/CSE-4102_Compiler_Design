%option noyywrap

%{
#include "java.tab.h"
%}

delim [ \t\n]
ws {delim}+
us [_]
point [.]
digit [0-9]
letter [A-Za-z]
int_number ({digit}+)
float_number ({digit})*({point})({digit})+
type ("int"|"static"|"void"|"float"|"long"|"String"|"String[]")
main ("main")
keyword ("public"|"System"|"out"|"println")
id ({us}|{letter})({us}|{letter}|{digit})*


%%
{ws}        {}
{float_number}  { yylval = atoi(yytext); return(NUM); }
{int_number}    { yylval = atoi(yytext); return(NUM); }
{type}      { return(TYPE); }
{main}      { return(MAIN); }
"if"        { return(IF); }
"class"     { return (C); }
{keyword}   { return(KEYWORD); }
{id}        { return(ID); }
"=="        { return(EQUAL); }
"="         { return(ASSIGN); }
";"         { return(SEMICOLON); }
"+"         { return(ADD); }
"-"         { return(SUB); }
"("         { return(LP); }
")"         { return(RP); }
"{"         { return(LB); }
"}"         { return(RB); }
%%