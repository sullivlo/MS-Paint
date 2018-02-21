%{
	#include <stdlib.h>
	#include "zoomjoystrong.h"
%}

%option noyywrap

%%

[0-9]+				{ yylval.i = atoi(yytext); return NUMBER;}
[A-Za-z]+			{ yylval.str = strup(yytext); return SET_COLOR; }
[0-9]+\.[0-9]+			{ yylval.i = atoi(yytext); return FLOAT;}
[ \t\n]				;


%%
