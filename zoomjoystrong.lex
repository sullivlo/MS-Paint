%{
	#include <stdlib.h>
	#include "zoomjoystrong.h"
%}

%option noyywrap

%%

[$$]							{ return END;}

[;]								{ return END_STATEMENT;}

([A-Za-z]{4})					{ yylval.str = strup(yytext); return LINE; } 

([A-Za-z]{5})					{ yylval.str = strup(yytext); return POINT; }

([A-Za-z]{6})					{ yylval.str = strup(yytext); return CIRCLE; }

([A-Za-z]{9})					{ yylval.str = strup(yytext); return RECTANGLE; }

([A-Za-z]{3})\_([A-Za-z]{5})	{ yylval.i = atoi(yytext); return SET_COLOR; }

[0-9]+ 							{ yylval.i = atoi(yytext); return INT; }

[0-9]+\.[0-9]+					{ yylval.i = atoi(yytext); return FLOAT; }

[ \t\n]							;


%%



