.model small

.data

a dw 1569
b dw 3215
c dw ?

.code

mov ax,@data
mov ds,ax

mov ax,a
sub ax,b
mov c,ax

mov ah,4ch
int 21h
end
