.model small

.data

a db 7
b db 6
c db ?

.code

mov ax,@data
mov ds,ax

mov al,a
sub al,b
mov c,al

mov ah,4ch
int 21h
end
