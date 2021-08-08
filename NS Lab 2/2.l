%option noyywrap

%{
#include "2.tab.h"
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
keyword ("function"|"log"|"console"|"if"|"else"|"else if"|"for"|"def"|"print")
main ("main")
sc [.!,?%]
invert ["]
string ({invert}(({letter}+)|({sc}+))*{invert})
%%
{ws}        {}
{type}      { return (TYPE); }
{main}      { return (MAIN);}
{keyword}   { return (KEYWORD); }
{string}    { return (STRING); }
{point}     { return (POINT); }
{number}    { return (NUMBER); }
{id}        { return (ID); }
":"         { return (COLON); }
"("         { return (LP); }
")"         { return (RP); }
%%