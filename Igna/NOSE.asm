DATO EQU 40H
ESTADO EQU 41H
EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H

ORG 20
IP_PAR DW PAR

ORG 1000H
 MSJ DB "INGRESE UN NRO DEL 1 AL 9"
 FINMSJ DB ?
 MSJPAR DB "EL NUMERO ES PAR"
 FINPAR DB 0
 MSJIMPAR DB "EL NUMERO ES IMPAR"
 FINIMPAR DB 0
 CAR DB ?
ORG 3000H
PAR: MOV AL,[BX];LE PASO EL CAR
AND AL,1
JNZ IMPAR
ESPAR:MOV BX,OFFSET MSJPAR
 JMP POLLING
IMPAR: MOV BX,OFFSET MSJIMPAR
POLLING: IN AL,ESTADO
AND AL,1
JNZ POLLING
IMPRIMIR:MOV AL,[BX] 
OUT DATO,AL
INC BX
CMP BYTE PTR [BX],0
JNZ POLLING
FINN: MOV AL,20H
OUT EOI,AL
IRET
ORG 2000H
MOV BX,OFFSET MSJ
MOV AL, OFFSET FINMSJ-OFFSET MSJ
INT 7
SALTO: MOV BX,OFFSET CAR
INT 6
MOV AL,[BX]
CMP AL,31H
JS SALTO
CMP AL,3AH
JNS SALTO
CLI 
MOV AL,0FEH
OUT IMR,AL
MOV AL,5
OUT INT0,AL
IN AL,ESTADO
AND AL,80H
OUT ESTADO,AL
STI
MOV BX,OFFSET CAR
LOOPEAR:CMP BYTE PTR [BX],0
 JZ FIN
JMP LOOPEAR
FIN: INT 0
END
