.model
.stack
.data
var1 dw 0
var2 dw 0
.code

mov ax,0
mov bx,0
mov cx,2
mov dx,1

cmp bx,ax
JBE L1
jmp exit
L1:
    cmp cx,dx
    JA L2
    jmp exit
L2:
    mov ax,53
    mov var1,ax
    mov dx,54
    mov var2,dx
    jmp exit
exit:
    mov dx,var1
    mov ah,02h
    int 21h
    mov dx,var2
    mov ah,02h
    int 21h
    mov ah,4ch
    int 21h
end