.model
.stack
.data

var1 db 0
var2 db 0
var3 db 0
var4 db 0
var5 db 0
var6 dw 0
var7 db 0

.code
mov ax,0
mov ah,01h
int 21h

sub al,48
mov var1,al

mov ah,01h
int 21h

sub al,48
mov var2,al

mov ah,01h
int 21h

sub al,48
mov var3,al

mov al,var2
mov bl,3
mul bl

mov var4,al

mov al,var4
mov bl,2
div bl

mov var5,al 

mov al,var5
add al,var3
mov var6,ax

mov al,var2
mov bl,6
mul bl

sub al,var1
mov var7,al
mov al,var7
add ax,var6

mov ax,var6
mov bl,var7
mul bl
    
mov dx,ax
mov ah,02h
int 21h

mov ah,4ch
int 21h
end