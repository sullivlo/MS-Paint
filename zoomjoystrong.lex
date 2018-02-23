%{
	#include <stdlib.h>
	#include "zoomjoystrong.h"
%}

%option noyywrap

%%

[$$]							{ yylval.str = strip(yytext); return END;}

[;]								{ yylval.str = strip(yytext); return END_STATEMENT;}

<<<<<<< HEAD
([A-Za-z]{4})					{ yylval.str = strip(yytext); return LINE; } 

([A-Za-z]{5})					{ yylval.str = strip(yytext); return POINT; }
=======
[0-9]+										{ yylval.i = atoi(yytext); return NUMBER; }

([A-Za-z]{4})+?\t[0-9]+?\t[0-9]+\t[0-9]+?\t[0-9]+ 				{ yylval.str = strip(yytext); return line; } 
>>>>>>> master

([A-Za-z]{6})					{ yylval.str = strip(yytext); return CIRCLE; }

<<<<<<< HEAD
([A-Za-z]{9})					{ yylval.str = strip(yytext); return RECTANGLE; }

([A-Za-z]{3})\_([A-Za-z]{5})	{ yylval.i = atoi(yytext); return SET_COLOR; }

[0-9]+ 							{ yylval.i = atoi(yytext); return INT; }

[0-9]+\.[0-9]+					{ yylval.i = atoi(yytext); return FLOAT; }

[ \t\n]							;
=======
([A-Za-z]{6})+?\t[0-9]+?\t[0-9]+?\t[0-9]+ 					{ yylval.str = strip(yytext); return circle; }

([A-Za-z]{9})+?\t[0-9]+?\t[0-9]+\t[0-9] 					{ yylval.str = strip(yytext); return rectangle; }

([A-Za-z]{3})+\_([a-z]{5})+?\t[0-9]+?\t[0-9]+?\t[0-9]+ 				{ yylval.i = atoi(yytext); return SET_COLOR; }

[A-Za-z]+									{ yylval.str = strup(yytext); return STRING; }

[0-9]+\.[0-9]+									{ yylval.i = atoi(yytext); return FLOAT; }

[ \t\n]				;
>>>>>>> master


%%



