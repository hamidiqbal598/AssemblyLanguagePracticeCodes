.model
.stack
.data
var db 0
.code

mov var,0
mov ah,01h
int 21h

sub al,48
mov bl,2
div bl
cmp ah,var
JE L1
jmp L2
L2:
mov dl,79
jmp exit

L1:
    mov dl,69
    jmp exit
exit:
    mov ah,02h
    int 21h
    mov ah,4ch
    int 21h