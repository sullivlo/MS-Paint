
%{
	#include <stdio.h>
    #include "zoomjoystrong.h"
	void yyerror(const char* msg);
	int yylex();
%}

%error-verbose
%start zoomjoystrong

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


%type<i> 	INT
%type<f>	FLOAT 

%%
zoomjoystrong: command_list END END_STATEMENT	{ finish(); return 0; }
	|		END END_STATEMENT					{ finish(); return 0; }
;

command_list: 	command
	|			command command_list
;

command: point  |	line  |	circle	| rectangle | set_color 
;

line:		LINE INT INT INT INT END_STATEMENT

		{ printf(" %s %d %d %d %d%s", $1, $2, $3, $4, $5); line($2, $3, $4, $5); } 	
;

point:		POINT INT INT END_STATEMENT
		{ printf(" %s %d %d%s", $1, $2, $3); point($2, $3); }
;

circle:		CIRCLE INT INT INT END_STATEMENT
		{ prinf(" %s %d %d %d%s",  $1, $2, $3, $4); circle($2, $3, $4); }
;

rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
		{ printf(" %s %d %d %d %d%s", $1, $2, $3, $4, $5); rectangle($2, $3, $4, $5); }
;

set_color:	SET_COLOR INT INT INT END_STATEMENT
		{ printf(" %s %d %d %d%s",  $1, $2, $3, $4); set_color($2, $3, $4); }

;

%%

/*************************
* Main will print what instruction was inputed by the user
* Main will return 0 if the users's instruction was formated correctly
* Main will print an error if the user inputted the incorrect format
*************************/
int main(int argc,char** argv){
	printf("\n===========\n");
	setup();
	yyparse();
	
	return 0;
	}	

void yyerror(const char* msg){

	//fprintf( "ERROR! %s\n", msg);
	fprintf(stdeer, "ERROR! %s\n", yylex);
	
}

