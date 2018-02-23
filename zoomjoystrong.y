
%{
	#include <stdio.h>
        #include "zoomjoystrong.h"
	void yyerror(const char* msg);
	int yylex();
	int num_contacts = 0;
%}


%error-verbose

%union {int i;float f;char* str; }

%token line
%token point
%token circle 
%token rectangle
%token set_color

%%

line:		line
		{printf(" %s", $1);} 	
;

point:		point
		{printf(" %s", $1);}
;

circle:		circle
		{prinf(" %s",  $1);}
;

rectangle:	rectangle
		{printf(" %s", $1);}
;

set_color:	set_color
		{printf(" %s", $1);}
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
