.model
.stack
.data
var1 db 0
var2 db 0
var3 db 0
sum db 0
.code    

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
add al,var1

mov var1,al

mov dl,var2
L1:
    inc var3
    cmp var3,dl
    jne top
    jmp exit
top:
mov al,var1
mov bl,var1
mul bl
add sum,al
Jmp L1   

    
exit:
mov al,sum
add al,48
mov dl,al
mov ah,02h
int 21h
mov ah,4ch
int 21h    