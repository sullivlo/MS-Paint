
%{
	#include <stdio.h>
        #include "zoomjoystrong.h"
	void yyerror(const char* msg);
	int yylex();
	int num_contacts = 0;
%}

   %union {int i;float f;char* str; }

%token line
%token point
%token circle 
%token rectangle
%token set_color

%%

line:		i i i i
;

point:		i i
;

circle:		i i i
;

rectangle:	i i i i
;

set_color:	i i i
;

%%
int main(int argc,char* argv){

	printf(int argc, char** argv){

	yyparse();
	}
