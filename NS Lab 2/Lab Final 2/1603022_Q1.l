%option noyywrap

%{
#include "1603022_Q1.tab.h"
// Roll: 1603022
//Question 2: function myFunction() { var myVar = "Nick"; console.log(myVar); }
%}

delim [ \t\n]
ws {delim}+
us [_]
point [.]
digit [0-9]
number ({digit})+
letter [A-Za-z]
type ("var"|"int"|"float")
id ({us}|{letter})({us}|{letter}|{digit})*
if ("if")
main ("main")
sc [.!,?%]
invert ["]
string ({invert}(({letter}+)|({sc}+))*{invert})

%%
{ws}        {}
{type}      { return (TYPE); }
{main}      { return (MAIN);}
{if}        { return (IF); }
{string}    { return (STRING); }
{point}     { return (POINT); }
{number}    { return (NUMBER); }
{id}        { return (ID); }
"="         { return (ASSIGN); }
";"         { return (SEMICOLON); }
"("         { return (LP); }
")"         { return (RP); }
"{"         { return (LB); }
"}"         { return (RB); }
"<"         { return (LESS); }
"=="        { return (COM); }
"++"        { return (INC); }
"--"        { return (DEC); }
"+"         { return (PLUS); }
"<<"        { return (BOOL); }
%%