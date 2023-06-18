; Escribir un programa que, utilizando las mismas variables y datos que el programa del punto anterior (TABLA, FIN,
TOTAL, MAX), determine cuántos de los elementos de TABLA son menores o iguales que MAX. Dicha cantidad
debe almacenarse en la celda TOTAL

ORG 1000H
TABLA DB 2,4,6,8,10,12,14,16,18,20
FIN DB ?
TOTAL DB ?
MAX DB 13

ORG 2000H
MOV AL, 0
MOV CL, OFFSET FIN - OFFSET TABLA
MOV BX, OFFSET TABLA
SUMA: ADD AL, [BX]
INC BX
DEC CL
JNZ SUMA
HLT
END
