org 1000h
byt db 01101011b
org 3000h
ROTARIZQ: mov bx, sp
  add bx, 2
  mov bx, [bx]
  mov ch, [bx]
  add ch,ch
  jnc nocarry
  inc ch
  nocarry: mov [bx], ch
  ret
org 2000h
mov ax, offset byt
push ax
call ROTARIZQ
hlt
end
