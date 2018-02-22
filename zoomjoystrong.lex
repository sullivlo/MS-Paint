%{
	#include <stdlib.h>
	#include "zoomjoystrong.h"
%}

%option noyywrap

%%

[0-9]+				{ yylval.i = atoi(yytext); return NUMBER;}

[a-z][a-z][a-z][a-z]?\t[0-9]+?\t[0-9]+\t[0-9]+?\t[0-9]+ {yylval.str = strip(yytext); return line;} 

[a-z][a-z][a-z][a-z][a-z]?\t[0-9]+?\t[0-9]+ {yylval.str = strip(yytext); return point;}

[a-z][a-z][a-z][a-z][a-z][a-z]?\t[0-9]+?\t[0-9]+?\t[0-9]+ {yylval.str = strip(yytext); return circle;}

[a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z]?\t[0-9]+?\t[0-9]+\t[0-9] {yylval.str = strip(yytext); return rectangle;}


[A-Za-z]+			{ yylval.str = strup(yytext); return SET_COLOR; }

[0-9]+\.[0-9]+			{ yylval.i = atoi(yytext); return FLOAT;}

[ \t\n]				;


%%



