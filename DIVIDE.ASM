.model small

.data

a dw 3214
b db 4
quot db ?
rem dw ?

.code

mov ax,@data
mov ds,ax

mov al,b
div a
mov quot,al
mov rem,ah

mov ah,4ch
int 21h
end


