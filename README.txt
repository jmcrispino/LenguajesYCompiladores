Comandos de Compilación
---------------------------------------------
flex lexico.l
bison -dyv Sintactico.y
gcc lex.yy.c y.tab.c -o Primera.exe -std=gnu99

Comando de Ejecución
----------------------------------------------
Primera.exe prueba.txt