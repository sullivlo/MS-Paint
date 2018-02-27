
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
		{ 
            if($2 >= 0 && $2 <= WIDTH &&
               $3 >= 0 && $3 <= HEIGHT &&
               $4 >= 0 && $4 <= WIDTH &&
               $5 >= 0 && $5 <= HEIGHT)   
               		{
                    /* Draw the line! */
                    line($2, $3, $4, $5);
                    }
            else { printf("Out of bounds\n");}
        }	
;

point:		POINT INT INT END_STATEMENT
		{ 
            if($2 >= 0 && $2 <= WIDTH &&
               $3 >= 0 && $3 <= HEIGHT)
               		{
                    /* Draw the point! */
                    point($2, $3);
                    }
            else { printf("Out of bounds\n");}
        }
;

circle:		CIRCLE INT INT INT END_STATEMENT
		{ 
            if( ($2 - $4) >= 0 && ($2 + $4) <= WIDTH &&
                ($3 - $4) >= 0 && ($3 + $4) <= HEIGHT ) 
               		{
                    /* Draw the circle! */
                    circle($2, $3, $4);
                    }
            else { printf("Out of bounds\n");}
        }
;

rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
		{ 
			if($2 <= WIDTH && $2 >= 0 &&
               $3 <= HEIGHT && $3 >= 0 &&
               (($2 + $4) <= WIDTH) &&
               (($3 + $5) <= HEIGHT) ) 
               		{
              		rectangle($2, $3, $4, $5); 
              		}
            else{ printf("Out of bounds\n");}
        } 
;

set_color:	SET_COLOR INT INT INT END_STATEMENT
		{  set_color($2, $3, $4); }
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
	fprintf(stderr, "Error. %s", msg);
	}