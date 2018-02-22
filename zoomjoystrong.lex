%{
	#include <stdlib.h>
	#include "zoomjoystrong.h"
%}

%option noyywrap

%%



[0-9]+													{ yylval.i = atoi(yytext); return NUMBER; }

([A-Za-z]{4})+?\t[0-9]+?\t[0-9]+\t[0-9]+?\t[0-9]+ 		{ yylval.str = strip(yytext); return line; } 

([A-Za-z]{5})+?\t[0-9]+?\t[0-9]+ 						{ yylval.str = strip(yytext); return point; }

([A-Za-z]{6})+?\t[0-9]+?\t[0-9]+?\t[0-9]+ 				{ yylval.str = strip(yytext); return circle; }

([A-Za-z]{9})+?\t[0-9]+?\t[0-9]+\t[0-9] 				{ yylval.str = strip(yytext); return rectangle; }

([A-Za-z]{3})+\_([a-z]{5})+?\t[0-9]+?\t[0-9]+?\t[0-9]+ 	{ yylval.i = atoi(yytext); return SET_COLOR; }

[A-Za-z]+												{ yylval.str = strup(yytext); return STRING; }

[0-9]+\.[0-9]+											{ yylval.i = atoi(yytext); return FLOAT; }

[ \t\n]				;


%%



