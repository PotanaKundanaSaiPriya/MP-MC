.model small
display macro msg
  lea dx,msg
  mov ah,09h
  int 21h
endm
.data
list db 02h,01h,34h,0f4h,09h,05h
number equ $-list
msg1 db 0dh,0ah,"1>>sort in ascending order$"
msg2 db 0dh,0ah,"2>>sort in descending order$"
msg3 db 0dh,0ah,"3>>exit$"
msg4 db 0dh,0ah,"enter your choice ::$"
msg5 db 0dh,0ah,"invalid choice...$"
.code
start:mov ax,@data
mov ds,ax
lea si,list
mov ch,number-1
display msg1
display msg2
display msg3
display msg4
mov ah,01h
int 21h
sub al,30h
cmp al,01h
je ascort
cmp al,02h
je dessort
cmp al,03h
je final
display msg5
jmp final
ascort:mov bl,00h
again:mov si,offset list
      mov cl,00h
      mov bh,ch
      sub bh,bl
npass:cmp cl,bh
      jnc next
      mov al,[si]
      mov bp,01h
      cmp al,ds:[bp][si]
      jc _nope
      xchg al,[si+1]
      xchg [si],al
_nope:inc cl
      inc si
      jmp npass
next:inc bl
     cmp bl,ch
     jc again
     jmp final
dessort:mov bl,00h
again1:mov si,offset list
       mov cl,00h
       mov bh,ch
       sub bh,bl
npass1:cmp cl,bh
       jnc next
       mov al,[si]
       mov bp,01h
       cmp al,ds:[bp][si]
       jnc _nope1
       xchg al,[si+1]
       xchg [si],al
_nope1:inc cl
       inc si
       jmp npass1
next1:inc bl
      cmp bl,ch
      jc again1
final:mov ah,4ch
      int 21h
end

