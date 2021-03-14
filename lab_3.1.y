%{

#include <stdio.h>
#include <stdlib.h>

%}

%token number
%left '+' '-'
%left '*' '/'
%%

start : expr '\n'		{printf("\nComplete");exit(1);}
	;

expr:  expr '+' expr	{$$ = $1 + $3; printf("%d", $$);}
	| expr '-' expr		{$$ = $1 - $3; printf("%d", $$);}
	| expr '*' expr		{$$ = $1 * $3; printf("%d", $$);}
	| expr '/' expr		{$$ = $1 / $3; printf("%d", $$);}
	| number;

%%

yyerror()
{
	printf("Error");
}

yylex()
{
	int c;
	c = getchar();
	if(isdigit(c))
	{
		yylval = c - '0';
		return number;

	}
	return c;
}

main()
{
	yyparse();
	return 1;
}
