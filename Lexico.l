%{
    /*
    Sección definiciones:
        Includes
        Defines
        Variables Globales
    */
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "y.tab.h"
    /*#include <limits.h>*/

    void informarError(char *);

    FILE *yyin;
    char *yyltext;
    int MAXINT = 32768;
    int MININT = -32768;
    char lexema[100];

    float MAXREAL = 2147483648;
    float MINREAL = -2147483648;

%}

/*Sección Conjuntos y Regex:
    En esta sección deberá incluir
    declaraciones de:
        • opciones (%option)
        • conjuntos
        • expresiones regulares
*/
%option noyywrap
%option yylineno


/*/----Palabras Reservadas----/*/
RES_DIM             "DIM"
RES_AS              "AS"
RES_WHILE           "WHILE"
RES_IF              "IF"
RES_AND             "AND"
RES_OR              "OR"
RES_NOT             "NOT"
RES_PUT             "PUT"
RES_GET             "GET" 
RES_ELSE            "ELSE"
RES_TIPO_ENTERO     "Integer"
RES_TIPO_REAL       "Float"
RES_TIPO_STRING     "String"
RES_CONST           "CONST"
RES_MAXIMO          "maximo"

DIGITO [0-9]
LETRA [a-zA-ZáéíóúñÁÉÍÓÚÑ]

/*/----Caracteres Especiales----/*/
ARROBA              "@"
ESP                 " "
COM                 "\""
NUMERAL             "#"
PREGUNTA_ABRE       "¿"
PREGUNTA_CIERRA     "?"
COMENTARIO_ABRE     "*-"
COMENTARIO_CIERRA   "-*"
COMA                ","
PUNTO               "."
BLOQUE_ABRE         "{"
BLOQUE_CIERRA       "}"
CORCHETE_ABRE       "["
CORCHETE_CIERRA     "]"

PAR_ABRE            "("
PAR_CIERRA          ")"
ADMIRACION_ABRE     "¡"
ADMIRACION_CIERRA   "!"

FIN_SENTENCIA       ";"
DOS_PUNTOS          ":"


ID {LETRA}+

/*----Operadores Comparacion----*/
OP_COMP_IGUAL           "=="
OP_COMP_MAYOR_IGUAL     ">="
OP_COMP_MAYOR           ">"
OP_COMP_MENOR           "<"
OP_COMP_MENOR_IGUAL     "<="
OP_COMP_DIST            "!="

/*----Otros Operadores----*/
OP_ASIG                 ":="
OP_COCIENTE             "/"
OP_MULT                  "*"
OP_SUMA                 "+"
OP_RESTA                "-"
OP_PORCENTAJE           "%"

/*----Compuestos----*/
COMENTARIO {COMENTARIO_ABRE}({DIGITO}*|{ARROBA}*|{NUMERAL}*|{PREGUNTA_ABRE}*|{PREGUNTA_CIERRA}*|{LETRA}*|{ESP}*|{COMENTARIO_ABRE}?|{COMENTARIO_CIERRA}?)*{COMENTARIO_CIERRA}


CTE_STRING  {COM}({DOS_PUNTOS}*|{ADMIRACION_ABRE}*|{ADMIRACION_CIERRA}*|{COMA}*|{PUNTO}*|{DIGITO}*|{ARROBA}*|{NUMERAL}*|{PREGUNTA_ABRE}*|{PREGUNTA_CIERRA}*|{LETRA}*|{ESP}*|{OP_PORCENTAJE}*)*{COM}   
CTE_INT {OP_RESTA}?{DIGITO}+
CTE_REAL {OP_RESTA}?(({DIGITO}*{PUNTO}{DIGITO}+)|({DIGITO}+{PUNTO}{DIGITO}*))


LISTA_DE_VARIABLES {RES_DIM}{ESP}+{OP_COMP_MENOR}({ID}{COMA})*{ID}{OP_COMP_MAYOR}
LISTA_DE_TIPOS {ESP}+{RES_AS}{ESP}+{OP_COMP_MENOR}(({RES_TIPO_ENTERO}|{RES_TIPO_REAL}){COMA})*({RES_TIPO_ENTERO}|{RES_TIPO_REAL}){OP_COMP_MAYOR}

DECLARACION_LISTA_VARIABLES {LISTA_DE_VARIABLES}{LISTA_DE_TIPOS}

%%

{RES_AS}            {return RES_AS;};
{RES_DIM}           {return RES_DIM;};
{RES_GET}           {return RES_GET;};
{RES_PUT}           {return RES_PUT;};
{RES_AND}           {return RES_AND;};
{RES_OR}            {return RES_OR;};
{RES_NOT}           

{RES_WHILE}         {return RES_WHILE;};    
{RES_IF}            {return RES_IF;};        
{RES_ELSE}          {return RES_ELSE;};
{RES_TIPO_ENTERO}   {return RES_TIPO_ENTERO;};
{RES_TIPO_REAL}     {return RES_TIPO_REAL;};
{RES_TIPO_STRING}   {return RES_TIPO_STRING;};
{RES_CONST}         {return RES_CONST;};
{RES_MAXIMO}        {return RES_MAXIMO;};

{LISTA_DE_VARIABLES} 
{LISTA_DE_TIPOS}     
{DECLARACION_LISTA_VARIABLES} 

{COM}               
{COMA}              {return COMA;};
{PAR_ABRE}          {return PAR_ABRE;};
{PAR_CIERRA}        {return PAR_CIERRA;};
{BLOQUE_ABRE}       {return BLOQUE_ABRE;};
{BLOQUE_CIERRA}     {return BLOQUE_CIERRA;};
{FIN_SENTENCIA}     {return FIN_SENTENCIA;};

{OP_COMP_IGUAL}         {return OP_COMP_IGUAL;};
{OP_COMP_MAYOR_IGUAL}   {return OP_COMP_MAYOR_IGUAL;};
{OP_COMP_MAYOR}         {return OP_COMP_MAYOR;};
{OP_COMP_MENOR}         {return OP_COMP_MENOR;};
{OP_COMP_MENOR_IGUAL}   {return OP_COMP_MENOR_IGUAL;};
{OP_COMP_DIST}          {return OP_COMP_DIST;};
{OP_ASIG}               {return OP_ASIG;};

{OP_COCIENTE}           {return OP_COCIENTE;};
{OP_MULT}               {return OP_MULT;};
{OP_SUMA}               {return OP_SUMA;};
{OP_RESTA}              {return OP_RESTA;};
{ADMIRACION_ABRE}       {return ADMIRACION_ABRE;};
{ADMIRACION_CIERRA}     {return ADMIRACION_CIERRA;};

{ID}                {
                        sprintf(lexema,"%s", yytext);
                        if(strlen(yytext) > 100) {
                            informarError(yytext);
                        }
                            
                        yylval.str_val=lexema;
                        return ID;
                    }
                    
{CTE_STRING}        {
                        if(strlen(yytext) > 100) {
                            informarError(yytext);
                        }
                        yylval.str_val=yytext;
                        return CTE_STRING;
                    }

{CTE_INT}           { 
                        if (strtol(yytext,(char **)NULL,10) < MININT ){
                            printf("\nConstante entera fuera de rango: %s, minimo permitido %d", yytext, MININT);
                        }else{
                            if(strtol(yytext,(char **)NULL,10) > MAXINT){
                                printf("\nConstante entera fuera de rango: %s, maximo permitido %d", yytext, MAXINT);
                            } else {
                                 yylval.int_val=strtol(yytext,(char **)NULL,10);
                                return CTE_INT;
                            }
                        }
                    };

{CTE_REAL}          {
                        if (atof(yytext) < MINREAL || atof(yytext) > MAXREAL|| strlen(yytext)>32){
                            printf("\nConstante real fuera de rango: %s, minimo permitido %f", yytext, MINREAL);
                        }else{
                            yylval.float_val=atof(yytext);
                            return CTE_REAL;
                        }
                    };

{COMENTARIO}        
{ESP}
"\n"
"\t"
"\n\t"
"\r\n"

%%

void informarError(char *error) {
  printf("Mensaje de error: %s\n", error);
  system ("Pause");
  exit(2);
}

