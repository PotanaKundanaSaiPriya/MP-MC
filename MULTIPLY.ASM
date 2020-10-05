.model small
.data
a db 2
b db 3
res dw ?
.code
mov ax,@data
mov ds,ax
mov al,num1
mul num2
mov res,ax
mov ah,4ch
int 21h
end

