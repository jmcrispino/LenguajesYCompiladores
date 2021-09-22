flex lexico.l
bison -dyv Sintactico.y
gcc lex.yy.c y.tab.c -o Primera.exe -std=gnu99
Primera.exe prueba.txt
