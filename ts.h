#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

void crearArchivoTS(void);
int cargarEnTS(char *, int);
void asignarValorConstante(void);
char tipo[9][14] = {"", "ENTERO", "CTE ENTERA", "REAL", "CTE REAL", "STRING", "CTE STRING", "ID", "CONST"};

typedef struct {
	char nombre[100]; // Nombre del token
	char tipo[14];  // Tipo de Dato
	int  tipoDato; // Manejo interno del tipo tipo[14]
	int flag;  // Para saber si el token fue almacenado o no en la TS
	char valor[100];
} ts; // tabla de simbolos


// Tabla de simbolos
ts t_simbolos[100];

// Funciones generales de la TS

void crearArchivoTS(void) {
	FILE *fp;
	int x;
	
	fp = fopen ("ts.txt", "w+");
	
	if (fp == NULL) {
		fputs("File error", stderr); 
		exit (1);
	}
	    
	for (x = 0; x < 100; x++)  {
        if(t_simbolos[x].tipoDato != 0)
            fprintf(fp, "%s\t%s\t%s\n", t_simbolos[x].nombre, t_simbolos[x].tipo, t_simbolos[x].valor);
        else
            break;
    		
	}
	fclose(fp);
	
    printf("\n\nSe ha cerrado el archivo y la Tabla de Simbolos fue cargada sin errores.\n");        
 }

int cargarEnTS ( char *nombre, int val ){
    int x;
	int l_repetido=0;
    char nombreConGuion[strlen(nombre)+1];    

    for(x=0; x<100; x++ ){
        if (t_simbolos[x].flag == 1) {//para saber si el token ya esta en la tabla
            if(strcmp(nombre, t_simbolos[x].nombre) == 0) {
                return x;                
            }
        }
    }
        
    for(x = 0; x < 100; x++){
        if(t_simbolos[x].flag == 0) {
            if(strstr(tipo[val], "CTE")) {
                strcpy(nombreConGuion, "_");   
                strcat(nombreConGuion, nombre);
                strcpy(t_simbolos[x].nombre, nombreConGuion);
                strcpy(t_simbolos[x].valor, nombre);
            }
			else {
                strcpy(t_simbolos[x].nombre, nombre);
            }            
            strcpy(t_simbolos[x].tipo, tipo[val]);
            t_simbolos[x].tipoDato = val;
            t_simbolos[x].flag = 1;//para indicar que ya se almaceno en la tabla
            return x;
        }
    }
		
	return x;
 }//retorna posicion en la tabla de simbolos
 
 void asignarValorConstante()
 {
     int x;
     for(x = 0; x < 99; x++) {
        if(t_simbolos[x].flag == 1) {//para saber si el token ya esta en la tabla
            if(t_simbolos[x].tipoDato == 8) {
                char *aux = t_simbolos[x + 1].nombre;
                strcpy(t_simbolos[x].valor, ++aux);//valor reconocido                
            }
        }
    }
 }
 


