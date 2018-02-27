<<<<<<< HEAD
/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.
=======
/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
>>>>>>> master

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
<<<<<<< HEAD
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */
=======
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
>>>>>>> master

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

<<<<<<< HEAD
/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LINE = 258,
     POINT = 259,
     CIRCLE = 260,
     RECTANGLE = 261,
     SET_COLOR = 262,
     END = 263,
     INT = 264,
     END_STATEMENT = 265,
     FLOAT = 266
   };
#endif
/* Tokens.  */
#define LINE 258
#define POINT 259
#define CIRCLE 260
#define RECTANGLE 261
#define SET_COLOR 262
#define END 263
#define INT 264
#define END_STATEMENT 265
#define FLOAT 266




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 14 "zoomjoystrong.y"
{int i; float f; char* str; }
/* Line 1529 of yacc.c.  */
#line 73 "zoomjoystrong.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

=======
#ifndef YY_YY_ZOOMJOYSTRONG_TAB_H_INCLUDED
# define YY_YY_ZOOMJOYSTRONG_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    LINE = 258,
    POINT = 259,
    CIRCLE = 260,
    RECTANGLE = 261,
    SET_COLOR = 262,
    END = 263,
    INT = 264,
    END_STATEMENT = 265,
    FLOAT = 266
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 11 "zoomjoystrong.y" /* yacc.c:1909  */
int i; float f; char* str; 

#line 69 "zoomjoystrong.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ZOOMJOYSTRONG_TAB_H_INCLUDED  */
>>>>>>> master
