
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include "tabla_simbolos.h"

int yystopparser=0;
FILE  *yyin;

  int yyerror();
  int yylex();

%}

%union {
    int int_val;
    double float_val;
    char *str_val;
}

%type <str_val> ID CTE_STRING
%type <int_val> CTE_INT
%type <float_val> CTE_REAL

%token RES_DIM
%token RES_AS
%token RES_WHILE
%token RES_IF
%token RES_AND
%token RES_OR
%token RES_NOT
%token RES_PUT
%token RES_GET
%token RES_ELSE
%token RES_TIPO_ENTERO
%token RES_TIPO_REAL
%token RES_TIPO_STRING
%token RES_CONST
%token RES_MAXIMO

%token ARROBA
%token ESP
%token COM
%token NUMERAL
%token PREGUNTA_ABRE
%token PREGUNTA_CIERRA
%token COMENTARIO_ABRE
%token COMENTARIO_CIERRA
%token COMA
%token PUNTO
%token SIGN
%token BLOQUE_ABRE
%token BLOQUE_CIERRA
%token CORCHETE_ABRE
%token CORCHETE_CIERRA

%token PAR_ABRE
%token PAR_CIERRA
%token ADMIRACION_ABRE
%token ADMIRACION_CIERRA

%token FIN_SENTENCIA

%token ID

%token OP_COMP_IGUAL
%token OP_COMP_MAYOR_IGUAL
%token OP_COMP_MAYOR
%token OP_COMP_MENOR
%token OP_COMP_MENOR_IGUAL
%token OP_COMP_DIST

%token OP_ASIG
%token OP_COCIENTE
%token OP_MULT
%token OP_SUMA
%token OP_RESTA
%token OP_PORCENTAJE

%token COMENTARIO

%token CTE_STRING
%token CTE_REAL
%token CTE_INT


%token LISTA_DE_VARIABLES
%token LISTA_DE_TIPOS

%token DECLARACION_LISTA_VARIABLES

%%
p:
    programa {printf("\nFIN PROGRAMA");asignarValorConstante();crearArchivoTS();} ;

programa: 
    bloque ;

bloque:
    sentencia |
    bloque sentencia |
    decvar;

sentencia:  	   
	asignacion FIN_SENTENCIA |
    iteracion |
    seleccion |
    salida FIN_SENTENCIA |
    entrada FIN_SENTENCIA;

decvar:
    RES_DIM OP_COMP_MENOR variables OP_COMP_MAYOR RES_AS OP_COMP_MENOR listatipos OP_COMP_MAYOR {printf("\nDIM OP_COMP_MENOR variables OP_COMP_MAYOR RES_AS OP_COMP_MENOR listatipos OP_COMP_MAYOR");}; 

variables:
    ID {cargarEnTS($1, 7);} | variables COMA ID {cargarEnTS($3, 7);};

listatipos:
    tipodato | listatipos COMA tipodato;

tipodato:
    RES_TIPO_ENTERO |
    RES_TIPO_REAL |
    RES_TIPO_STRING;

salida:
    RES_PUT mensaje {printf("\nPUT mensaje");};

 mensaje:
    ID {cargarEnTS($1, 7);} |
    CTE_STRING {cargarEnTS($1, 6);};

 entrada:   
    RES_GET mensaje {printf("\nGET mensaje");};

asignacion:
    RES_CONST ID {cargarEnTS($2, 8);} OP_ASIG constante {printf("\nCONST ID OP_ASIG constante");} |
    ID {cargarEnTS($1, 7);} OP_ASIG expresion {printf("\nID OP_ASIG expresion");};

iteracion:
    RES_WHILE PAR_ABRE condicion PAR_CIERRA BLOQUE_ABRE programa BLOQUE_CIERRA {printf("\nWHILE PAR_ABRE condicion PAR_CIERRA BLOQUE_ABRE programa BLOQUE_CIERRA");};

seleccion:
    RES_IF PAR_ABRE condicion PAR_CIERRA BLOQUE_ABRE programa BLOQUE_CIERRA RES_ELSE BLOQUE_ABRE programa BLOQUE_CIERRA {printf("\nIF PAR_ABRE condicion PAR_CIERRA BLOQUE_ABRE programa BLOQUE_CIERRA ELSE BLOQUE_ABRE programa BLOQUE_CIERRA");};|
    RES_IF PAR_ABRE condicion PAR_CIERRA BLOQUE_ABRE programa BLOQUE_CIERRA {printf("\nIF PAR_ABRE condicion PAR_CIERRA BLOQUE_ABRE programa BLOQUE_CIERRA");};|
    RES_IF PAR_ABRE condicion PAR_CIERRA sentencia {printf("\nIF PAR_ABRE condicion PAR_CIERRA sentencia");};

condicion:
    comparacion |
    condicion RES_AND comparacion  {printf("\ncondicion AND comparacion");};|
    condicion RES_OR comparacion  {printf("\ncondicion OR comparacion");};

comparacion:
    expresion comparador expresion;

comparador:
    OP_COMP_IGUAL | OP_COMP_DIST | OP_COMP_MAYOR | OP_COMP_MAYOR_IGUAL | OP_COMP_MENOR | OP_COMP_MENOR_IGUAL;

expresion:
    expresion OP_SUMA termino |
    expresion OP_RESTA termino |
    termino;

lista:
    expresion | lista COMA expresion;

termino:
    termino OP_MULT factor |
    termino OP_COCIENTE factor |
    factor;

factor:
    RES_MAXIMO PAR_ABRE lista PAR_CIERRA {printf("\nMAXIMO PAR_ABRE lista PAR_CIERRA");}; |
    PAR_ABRE expresion PAR_CIERRA |
    ID {cargarEnTS($1, 7);}|
    constante;

constante:
    CTE_STRING {cargarEnTS($1, 6);}|
    CTE_INT {
                char valorString[100];
                sprintf(valorString, "%d", $1);
                cargarEnTS(valorString, 2);
            }|
    CTE_REAL{
                char valorString[100];
                sprintf(valorString, "%lf", $1);
                cargarEnTS(valorString, 4);
            };

%%


int main(int argc, char *argv[])
{
    if((yyin = fopen(argv[1], "rt"))==NULL)
    {
        printf("\nNo se puede abrir el archivo de prueba: %s\n", argv[1]);
       
    }
    else
    { 
        
        yyparse();
        
    }
	fclose(yyin);
        return 0;
}
int yyerror(void)
{
    printf("\nError Sintactico\n");
	exit (1);
}

