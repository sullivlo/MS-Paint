%{
	#include <stdlib.h>
	#include "zoomjoystrong.tab.h"
%}

%option noyywrap

%%

end								{ return END; }

;								{ return END_STATEMENT; }

line							{ return LINE; } 

point							{ return POINT; }

circle							{ return CIRCLE; }

rectangle						{ return RECTANGLE; }

set_color						{ return SET_COLOR; }

[0-9]+ 							{ yylval.i = atoi(yytext); return INT; }

[0-9]+\.[0-9]+					{ yylval.f = atoi(yytext); return FLOAT; }							

[ \t\n]							;

.								{ printf("Incorrect Statement"); }


%%


