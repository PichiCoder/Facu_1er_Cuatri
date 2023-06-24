;Dada la frase "Organización y la Computación", almacenada en la memoria, escriba un programa que determine
;cuantas letras ‘a’ seguidas de ‘c’ hay en ella.

ORG 1000H
pal DB "Organización y la Computación" ; una letra por celda porque es un caracter ascii de 8bits
total DB 0

ORG 3000H
revisarC: INC BX
CMP BYTE PTR [BX], 63h ; comparo si le sigue una 'c'
JZ ocurrencia
JMP re
ocurrencia: INC total
re: RET

revisarA: CMP BYTE PTR [BX], 61h ; comparo a lo que apunta BX con el valor 'a' en ascii, si me da 0 es una 'a'.
JZ verC
JMP r
verC: Call revisarC
r: RET

ORG 2000H

MOV BX, OFFSET pal

inicio: CALL revisarA

INC BX

CMP BX, OFFSET total ; comparo dir actual de BX con la de total, que es la inmediata al terminar la frase. Si da 0 termine de recorrer la frase.
JNZ inicio

hlt

end
