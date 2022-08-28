a) Escribir una subrutina LONGITUD que cuente el número de caracteres de una cadena de caracteres terminada en
cero (00H) almacenada en la memoria. La cadena se pasa a la subrutina por referencia vía registro, y el resultado se
retorna por valor también a través de un registro.
Ejemplo: la longitud de ‘abcd’00h es 4 (el 00h final no cuenta) 

org 1000h
palabra DB "abcd"
DB 00h
org 3000h
longitud: cmp byte ptr [BX], 00h
 jz fin
 mov CX,0
 sig: inc BX
  inc CX
  cmp byte ptr [BX], 00h
  jnz sig
fin: ret
org 2000h
 mov BX, offset palabra
 call longitud
hlt
end
~~~~~~~~~~~~~~~~~~~~~~~~~~OPCION 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
org 1000h
palabra DB "abcd"
DB 00h
org 3000h
longitud: mov CX,0
 sig: cmp byte ptr [BX], 00h
 jz fin
 inc BX
  inc CX
  jmp sig
fin: ret
org 2000h
 mov BX, offset palabra
 call longitud
hlt
end
