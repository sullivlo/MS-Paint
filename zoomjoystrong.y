
%{
	#include <stdio.h>
    #include "zoomjoystrong.h"
	void yyerror(const char* msg);
	int yylex();
	int inRange(int x, int y);
	int inRangeR(int x, int y, int r);
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
		{ if(inRange($2, $3) == 1 && inRange($4, $5) == 1){
				line($2, $3, $4, $5);} } 	
;

point:		POINT INT INT END_STATEMENT
		{  if(inRange($2, $3) == 1){
				point($2, $3);} }
;

circle:		CIRCLE INT INT INT END_STATEMENT
		{  if(inRangeR($2, $3, $4) == 1){
				circle($2, $3, $4);} }
;

rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
		{ if(inRange($2, $3) == 1 && inRange($4, $5) == 1){
				rectangle($2, $3, $4, $5);} }
;

set_color:	SET_COLOR INT INT INT END_STATEMENT
		{ set_color($2, $3, $4); }
;

%%

/*************************
* Main will print what instruction was inputed by the user
* Main will return 0 if the users's instruction was formated correctly
* Main will print an error if the user inputted the incorrect format
*************************/
int main(int argc,char** argv){
	printf("\n================\n");
	printf("Welcome to the Language ZoomJoyStrong!\n");
	printf("Your Bounds are : Height: %d, Width: %d\n", HEIGHT, WIDTH);

	setup();
	yyparse();
	
	return 0;
	}	
/*************************
* inRange checks the x and y coordinates to the overall drawing map.
* @param int x - The x location.
* @param int y - The y location.
* @return 1 - Returns 1 if is in the bounds.
* @return 0 - Returns 0 if is not in the bounds.
*************************/
int inRange(int x, int y){
	if(-1 < x && x < WIDTH && -1 < y && y < HEIGHT){
		return 1;
	}
	printf("Error. %d or %d is out of the bounds.\n", x, y);
	return 0;
}

/*************************
* inRange checks the x and y coordinates to the overall drawing map
* and checks the radius points of the circle.
* @param int x - The x location.
* @param int y - The y location.
* @param int r - The r is the radius of the circle.
* @return 1 - Returns 1 if is in the bounds.
* @return 0 - Returns 0 if is not in the bounds.
*************************/
int inRangeR(int x, int y, int r){
	if(-1 < (x+r) && x < WIDTH && -1 < (y+r) && y < HEIGHT && 
	-1 < x && (x+r) < WIDTH && -1 < y && (y+r) < HEIGHT
	-1 < (x-r) && x < WIDTH && -1 < (y-r) && y < HEIGHT &&
	-1 < x && (x-r) < WIDTH && -1 < y && (y-r) < HEIGHT){
		return 1;
	}
	printf("Error. %d or %d with Range %d is out of the bounds.\n", x, y, r);
	return 0;
}


void yyerror(const char* msg){
	fprintf(stderr, "Error. %s", msg);
	}
	