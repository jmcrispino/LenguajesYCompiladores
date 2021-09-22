/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     RES_DIM = 258,
     RES_AS = 259,
     RES_WHILE = 260,
     RES_ENDWHILE = 261,
     RES_DO = 262,
     RES_IF = 263,
     RES_AND = 264,
     RES_OR = 265,
     RES_NOT = 266,
     RES_DISPLAY = 267,
     RES_GET = 268,
     RES_ELSE = 269,
     RES_ENDIF = 270,
     RES_TIPO_ENTERO = 271,
     RES_TIPO_REAL = 272,
     RES_TIPO_STRING = 273,
     RES_CONST = 274,
     RES_FOR = 275,
     RES_IN = 276,
     RES_NEXT = 277,
     RES_TO = 278,
     RES_STEP = 279,
     ARROBA = 280,
     ESP = 281,
     COM = 282,
     NUMERAL = 283,
     PREGUNTA_ABRE = 284,
     PREGUNTA_CIERRA = 285,
     COMENTARIO_ABRE = 286,
     COMENTARIO_CIERRA = 287,
     COMA = 288,
     PUNTO = 289,
     SIGN = 290,
     BLOQUE_ABRE = 291,
     BLOQUE_CIERRA = 292,
     CORCHETE_ABRE = 293,
     CORCHETE_CIERRA = 294,
     PAR_ABRE = 295,
     PAR_CIERRA = 296,
     ADMIRACION_ABRE = 297,
     ADMIRACION_CIERRA = 298,
     FIN_SENTENCIA = 299,
     ID = 300,
     OP_COMP_IGUAL = 301,
     OP_COMP_MAYOR_IGUAL = 302,
     OP_COMP_MAYOR = 303,
     OP_COMP_MENOR = 304,
     OP_COMP_MENOR_IGUAL = 305,
     OP_COMP_DIST = 306,
     OP_ASIG = 307,
     OP_COCIENTE = 308,
     OP_MULT = 309,
     OP_SUMA = 310,
     OP_RESTA = 311,
     OP_PORCENTAJE = 312,
     COMENTARIO = 313,
     CTE_STRING = 314,
     CTE_REAL = 315,
     CTE_INT = 316,
     LISTA_DE_VARIABLES = 317,
     LISTA_DE_TIPOS = 318,
     DECLARACION_LISTA_VARIABLES = 319
   };
#endif
/* Tokens.  */
#define RES_DIM 258
#define RES_AS 259
#define RES_WHILE 260
#define RES_ENDWHILE 261
#define RES_DO 262
#define RES_IF 263
#define RES_AND 264
#define RES_OR 265
#define RES_NOT 266
#define RES_DISPLAY 267
#define RES_GET 268
#define RES_ELSE 269
#define RES_ENDIF 270
#define RES_TIPO_ENTERO 271
#define RES_TIPO_REAL 272
#define RES_TIPO_STRING 273
#define RES_CONST 274
#define RES_FOR 275
#define RES_IN 276
#define RES_NEXT 277
#define RES_TO 278
#define RES_STEP 279
#define ARROBA 280
#define ESP 281
#define COM 282
#define NUMERAL 283
#define PREGUNTA_ABRE 284
#define PREGUNTA_CIERRA 285
#define COMENTARIO_ABRE 286
#define COMENTARIO_CIERRA 287
#define COMA 288
#define PUNTO 289
#define SIGN 290
#define BLOQUE_ABRE 291
#define BLOQUE_CIERRA 292
#define CORCHETE_ABRE 293
#define CORCHETE_CIERRA 294
#define PAR_ABRE 295
#define PAR_CIERRA 296
#define ADMIRACION_ABRE 297
#define ADMIRACION_CIERRA 298
#define FIN_SENTENCIA 299
#define ID 300
#define OP_COMP_IGUAL 301
#define OP_COMP_MAYOR_IGUAL 302
#define OP_COMP_MAYOR 303
#define OP_COMP_MENOR 304
#define OP_COMP_MENOR_IGUAL 305
#define OP_COMP_DIST 306
#define OP_ASIG 307
#define OP_COCIENTE 308
#define OP_MULT 309
#define OP_SUMA 310
#define OP_RESTA 311
#define OP_PORCENTAJE 312
#define COMENTARIO 313
#define CTE_STRING 314
#define CTE_REAL 315
#define CTE_INT 316
#define LISTA_DE_VARIABLES 317
#define LISTA_DE_TIPOS 318
#define DECLARACION_LISTA_VARIABLES 319




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1685 of yacc.c  */
#line 16 "Sintactico.y"

	int int_val;
	double float_val;
	char *str_val;



/* Line 1685 of yacc.c  */
#line 187 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


