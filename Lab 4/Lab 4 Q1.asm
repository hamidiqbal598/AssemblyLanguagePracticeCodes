.model
.stack
.data
input1 dw 0
input2 dw 0
multi dw 0
.code
mov multi,10
mov ax,0
mov bx,0
mov dx,0
mov ah,01h
int 21h
sub al,48
mov ah,0
mov input1,ax
mov ah,01h
int 21h
sub al,48
mov ah,0
mov input2,ax
mov ax,input1
mov bx,multi
mul bx
add ax,input2
F:
    cmp ax,50
    JA D
    mov dl,70
    mov ah,02h
    int 21h
    JMP exit
D:
    cmp al,59
    JA C
    mov dl,68
    mov ah,02h
    int 21h
    JMP exit
C:
    cmp al,69
    JA B
    mov dl,67
    mov ah,02h
    int 21h
    JMP exit
B:
    cmp al,79
    JA A
    mov dl,66
    mov ah,02h
    int 21h
    JMP exit
A:
    cmp al,89
    JA A_plus
    mov dl,65
    mov ah,02h
    int 21h
    JMP exit
A_plus:
    mov dl,65
    mov ah,02h
    int 21h
    mov dl,43
    mov ah,02h
    int 21h    
exit: 
    mov ah,4ch
    int 21h
end