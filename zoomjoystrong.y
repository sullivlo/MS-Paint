
%{
	#include <stdio.h>
        #include "zoomjoystrong.h"
	void yyerror(const char* msg);
	int yylex();
	int num_contacts = 0;
%}


%error-verbose

%union {int i; float f; char* str; }

%token line
%token point
%token circle 
%token rectangle
%token set_color



%%

line:		LINE INT INT INT INT END_STATEMENT
		{printf(" %s %d %d %d %d%s", $1, $2, $3, $4, $5, $6);} 	
;

point:		POINT INT INT END_STATEMENT
		{printf(" %s %d %d%s", $1, $2, $3, $4);}
;

circle:		CIRCLE INT INT INT END_STATEMENT
		{prinf(" %s %d %d %d%s",  $1, $2, $3, $4, $5);}
;

rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
		{printf(" %s %d %d %d %d%s", 1, $2, $3, $4, $5, $6);}
;

set_color:	SET_COLOR INT INT INT END_STATEMENT
		{printf(" %s %d %d %d%s",  $1, $2, $3, $4, $5);}
;

%%

/*************************
* Main will print what instruct was inputted by the user
* Main will return 0 if the instruction was formateed correctly
* Main will rint an error if the user inputted the incorrect format
*************************/
int main(int argc,char** argv){
	printf("\n===========\n");
		
	yyparse();
	
	return 0;
	}	

void yyerror(const char* msg){
	fprintf(stdeer, "ERROR! %s\n", msg):
	}
