.model
.stack

.data

multiplier dw 0
number dw 0
result dw 0
remainder dw 0
string1 dw 'Your Input $'
string2 dw 'The Table is$'
.code

mov ax,@data
mov ds,ax
lea dx,string1
mov ah,9
int 21h
mov multiplier,1
mov ah,01h
int 21h
mov ah,0
sub ax,48
mov number,ax
mov dl,10
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h

lea dx,string2
mov ah,9
int 21h
mov dl,10
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
mov cx,10
table:
     mov ax,0
     mov ax,number
     mov bx,multiplier
     mul bx
     mov result,ax
     mov bx,10
     div bx
     mov remainder,dx
     add ax,48
     mov dx,ax
     mov ah,02h
     int 21h
     add remainder,48
     mov dx,remainder
     mov ah,02h
     int 21h
     mov ax,0
     mov dl,10
     mov ah,02h
     int 21h
     mov dl,13
     mov ah,02h
     int 21h
     inc multiplier
loop table
mov ah,4ch
int 21h
end