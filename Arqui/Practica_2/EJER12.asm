CONT EQU 10H
COMP EQU 11H
IMR EQU 21H
EOI EQU 20H
INT1 EQU 25H
ORG 40
IP_CLK DW RUT_CLK
ORG 1000H
 MIN DB 30H
     DB 30H
 SEG DB 30H
     DB 30H
 FIN DB ?
 ESPACIO DB 20H
ORG 3000H
 RUT_CLK: PUSH AX
 ;VAMOS SUMANDO DEL 00 AL 09
 MOV BX, OFFSET SEG
 INC BX
 INC BYTE PTR [BX]
 CMP BYTE PTR [BX], 3AH
 JNZ RESET
 
 ;VAMOS SUMANDO DEL 00 AL 60 (En la direccion que le sigue a segundo)
 ;COMIENZO EN EL SEGUNDO DIGITO
 MOV BYTE PTR [BX], 30H ;iniciamos en 0
 DEC BX ;SEG
 INC BYTE PTR [BX]
 CMP BYTE PTR [BX], 36H ;Hasta el 60
 JNZ RESET
 
 MOV BYTE PTR [BX], 30H
 
 RESET: MOV BX, OFFSET SEG ;REINICIAMOS EL ESTADO DE SEGUNDOS
 MOV AL, OFFSET FIN-OFFSET SEG ;PORQUE LO USAMOS MAS ARRIBA
 INT 7
 MOV BX, OFFSET ESPACIO 
 MOV AL, 1 
 INT 7
 MOV AL, 0
 OUT 10H, AL
 MOV AL, 20H
 OUT 20H, AL
 POP AX
IRET
 
ORG 2000H

 CLI
 MOV AL, 11111101b ;Activamos el timer
 OUT 21H, AL ; PIC: registro IMR
 
 MOV AL, 10
 OUT INT1, AL ; PIC: registro INT1 (Timer)
 MOV AL, 1
 OUT COMP, AL ; TIMER: registro COMP (No se cual es)
 MOV AL, 0
 OUT CONT, AL ; TIMER: registro CONT
 
 STI
 LAZO: JMP LAZO
END
