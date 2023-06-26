;  Escribir un programa que sume 2 vectores de 6 elementos (similar al realizado en el ejercicio 15), de modo tal que
; utilice una subrutina que sume números de 32 bits (similar al programa escrito en ejercicio 14).

ORG 1000H
TAB1 DW 1,1,2,2,3,3,4,4,5,5,6,6
TAB2 DW 01,01,02,02,03,03,04,04,05,05,06,06
TAB3 DW 12 DUP (?) ; con el DUP dejamos 12 lugares para guardar los resultados
CANT DB 12 ; la cantidad de veces que hacemos el bucle
DIR3 DW ? ; para ir guardando dir de TAB3
iterable DB 0 ; para seguir movimiento de las direcciones de cada nro de cada vector

ORG 3000H
SumarParteMenosSign: MOV BX, AX
MOV DX, [BX] ;guarda primeros 16bits (primeras dos celdas) del primer nro de TAB1, osea la parte baja, en el registro DX
MOV BX, CX ; se guarda en BX primeros 16bits (primeras dos celdas) del primer nro de TAB2, osea la parte baja. 
ADD DX, [BX] ;Hacemos la suma de la parte baja de los valores de TAB1 Y TAB2

MOV BX, DIR3 
MOV [BX], DX ; guardo la suma en TAB3

;se inc en dos las dirs para avanzar
ADD AX, 2
ADD CX, 2
ADD DIR3, 2
CALL SumarParteMasSign
RET

SumarParteMasSign:
MOV DX, [BX] 
MOV BX, CX 
ADD DX, [BX] 

MOV BX, DIR3 
MOV [BX], DX ; guardo la suma en TAB3


ORG 2000H

MOV AX, OFFSET TAB1
MOV CX, OFFSET TAB2
MOV DIR3, OFFSET TAB3

CALL SumarParteMenosSign 



hlt
end
