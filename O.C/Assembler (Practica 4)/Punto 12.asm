; Escribir un programa que, dado un número X, genere un arreglo con todos los resultados que se obtienen hasta llegar
;a 0, aplicando la siguiente fórmula: 

; si X es par, se le resta 7; 
; si es impar, se le suma 5, 
; y al resultado se le aplica nuevamente la misma fórmula. 

; Ej: si X = 3 entonces el arreglo tendrá: 8, 1, 6, -1, 4, -3, 2, -5, 0.

ORG 1000H
X DW 3 ; el nro X
tabla DW 1000H ; la tabla para guardar resulados

ORG 3000H


ORG 2000H
MOV CX, 0001H ; es 00000000 00000001 en binario
MOV AX, X
MOV BX, tabla

INICIO: AND CX, AX ; si CX queda en todos 0, el nro en AX es par o es 0 

CMP AX, 0 ; revisamos si AX queda en 0, donde tendria que terminar el programa.
JZ FIN

CMP CX, 0001H ; Si se prende Z, por hacer 1 - 1 sobre el bit menos sig, el nro en AX es impar
JZ IMPAR

SUB AX, 7 ; si no se hace el salto porque es par se ejecuta esto
JMP AGREGAR_A_TABLA

IMPAR: ADD AX, 5

AGREGAR_A_TABLA: MOV [BX], AX

ADD BX, 2

MOV CX, 0001H

JMP INICIO

FIN: hlt

end
