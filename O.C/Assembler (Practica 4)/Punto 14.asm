; Escribir un programa que sume dos números representados en Ca2 de 32 bits almacenados en memoria de datos y
; etiquetados NUM1 y NUM2 y guarde el resultado en RESUL (en este caso cada dato y el resultado ocuparán 4 celdas
; consecutivas de memoria). Verifique el resultado final y almacene 0FFH en la celda BIEN en caso de ser correcto o
; en otra MAL en caso de no serlo. Recordar que el MSX88 trabaja con números en Ca2 pero tener en cuenta que las
; operaciones con los 16 bits menos significativos de cada número deben realizarse en BSS.

; IMPORTANTE: considero que la parte mas significativa de cada NUM1 y NUM2 es la primer posicion, es decir, 1234H

;Probando valores para NUM1, este caso actual da Carry

ORG 1000H
NUM1 DW 0FFFFH, 01FF1H ; Total de 4 celdas de memoria
NUM2 DW 01001H, 05678H

BIEN DB ?
MAL DB 11H
RESUL DW 0000H, 0000H

ORG 2000H

;sumo y guardo parte menos sign
MOV BX, OFFSET NUM1 + 2
MOV AX, [BX] ;guardo parte menos sign. de NUM1 en AX
MOV BX, OFFSET NUM2 + 2
ADD AX, [BX]; En AX me queda la suma de las partes menos sign.

MOV BX, OFFSET RESUL + 2
MOV [BX], AX ; guardo resultado de la parte menos sign en RESUL

;sumo y guardo parte sign
MOV CX, NUM1
ADC CX, NUM2 ;En CX me queda la suma de las partes sign. + carry de operacion anterior

MOV BX, OFFSET RESUL
MOV [BX], CX ; guardo resultado de la parte mas sign en RESUL

JO M ;si la suma de la parte mas sign da overflow o carry, RESUL esta mal
JC M
MOV BIEN, 0FFH ; sino, esta bien
JMP FIN
M: MOV MAL, 0FFH

FIN: hlt

end
