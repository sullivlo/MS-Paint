
%{
	#include <stdio.h>
    #include "zoomjoystrong.h"
	void yyerror(const char* msg);
	int yylex();
	int num_contacts = 0;
%}

%error-verbose

%union {int i; float f; char* str; }

%token LINE
%token POINT
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token END
%token INT
%token END_STATEMENT
%token FLOAT

%type<str> 	LINE
%type<str> 	POINT
%type<str> 	CIRCLE
%type<str>	RECTANGLE
%type<str> 	SET_COLOR
%type<i> 	INT
%type<f>	FLOAT 

%%

line:		LINE INT INT INT INT END_STATEMENT
		{ printf(" %s %d %d %d %d%s", $1, $2, $3, $4, $5, $6); line($2, $3, $4, $5); } 	
;

point:		POINT INT INT END_STATEMENT
		{ printf(" %s %d %d%s", $1, $2, $3, $4); point($2, $3); }
;

circle:		CIRCLE INT INT INT END_STATEMENT
		{ prinf(" %s %d %d %d%s",  $1, $2, $3, $4, $5); circle($2, $3, $4); }
;

rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
		{ printf(" %s %d %d %d %d%s", $1, $2, $3, $4, $5, $6); rectangle($2, $3, $4, $5); }
;

set_color:	SET_COLOR INT INT INT END_STATEMENT
		{ printf(" %s %d %d %d%s",  $1, $2, $3, $4, $5); set_color($2, $3, $4); }
;

%%

/*************************
* Main will print what instruction was inputed by the user
* Main will return 0 if the users's instruction was formated correctly
* Main will print an error if the user inputted the incorrect format
*************************/
int main(int argc,char** argv){
	printf("\n===========\n");
		
	yyparse();
	
	return 0;
	}	

void yyerror(const char* msg){
	fprintf(stdeer, "ERROR! %s\n", msg):
	}
