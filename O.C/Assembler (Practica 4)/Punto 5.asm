;Escribir un programa que genere una tabla a partir de la dirección de memoria almacenada en la celda DIR con los
; múltiplos de 5 desde cero hasta MAX.

;Tener cuidado con esto: al hacer una tabla cuya cantidad de elementos no esta predefinida, fijarse bien donde 
; quedan guardadas las variables que no corresponden a la tabla porque pueden pisarse. Tuve este problema con la variable
; MAX que la pisaba al crear la tabla desde la posicion 1000h, teniendo a MAX declarada en 1001H...

ORG 1000H
MAX DB 25 ; maximo random a definir
DIR DW 1001H ; dir de memoria a definir

ORG 2000H
MOV BX, DIR
MOV AL, 0 ; valor inicial
AGREGAR: MOV [BX], AL
ADD AL, 5
INC BX
CMP MAX, AL
JNS AGREGAR

hlt
end
