%option noyywrap

%{
#include "1603022_Q2.tab.h"
// Roll: 1603022
//Question 2: function myFunction() { var myVar = "Nick"; console.log(myVar); }
%}

delim [ \t\n]
ws {delim}+
us [_]
point [.]
digit [0-9]
letter [A-Za-z]
type ("var")
id ({us}|{letter})({us}|{letter}|{digit})*
keyword ("function"|"log"|"console")
sc [.!,?%]
invert ["]
string ({invert}(({letter}+)|({sc}+))*{invert})

%%
{ws}        {}
{type}      { return(TYPE); }
{keyword}   { return (KEYWORD); }
{string}    { return (STRING); }
{point}     { return (POINT); }
{id}        { return(ID); }
"="         { return(ASSIGN); }
";"         { return(SEMICOLON); }
"("         { return(LP); }
")"         { return(RP); }
"{"         { return(LB); }
"}"         { return(RB); }
%%