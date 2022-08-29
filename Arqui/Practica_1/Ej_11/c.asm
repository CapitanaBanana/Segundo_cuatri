org 1000h
num1 dw 0100101010010100B, 1010101111111110B
num2 dw 0101010101110101B, 0101010101010111B
resul dw ?,?

org 2000h
mov bx, offset num1 +2
mov cx, [bx]; pongo en cx parte baja de num1
mov bx, offset num2+2
add cx, [bx]; sumo parte baja de num2
adc ax, 0;cx tiene resultado pbaja, ax de alta
mov bx, offset num1
add ax, [bx];sumo a ax parte alta de num1
mov bx, offset num2
add ax, [bx]
mov bx, offset resul
mov [bx], ax
add bx, 1
mov [bx], cx
hlt
end
