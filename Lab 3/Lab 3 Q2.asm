.model
.stack
.data
var1 db 0
var2 db 0
var3 db 0
.code
mov var1,1
mov var2,4
mov var3,9

mov ah,01h
int 21h

sub al,48

cmp al,var1
Jae L1

cmp al,var2
JaE L2   

cmp al,var3
JaE L3

L1:
    cmp al,4
    jbe L4
    jmp L2
    
L2:
    cmp al,8
    jbe L5
    jmp L3
L3:
    cmp al,9
    jae L6
L4:
    mov al,76
    jmp exit
L5:
    mov al,77
    jmp exit
L6:
    mov al,72
    jmp exit
    
exit:
mov dl,al    
mov ah,02h
int 21h
    
mov ah,4ch
int 21h

end