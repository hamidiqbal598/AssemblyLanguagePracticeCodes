.model
.stack
.data
var1 db 0
var2 db 0
looper db 0
subtractor1 db 0
subtractor2 db 0
.code

mov var1,53
mov var2,48
mov looper,0
mov subtractor1,6
mov subtractor2,5
mov cx,20
main_loop:
    cmp cx,0
    JE exit
    loop loop1
loop1:
    dec subtractor1
    cmp subtractor1,0
    JE incrementer
    inc var2
    mov dl,var1
    mov ah,02h
    int 21h
    loop loop2
loop2:
    mov dl,var2
    mov ah,02h
    int 21h
    MOV dl,10
    MOV ah,02h
    INT 21h
    MOV dl,13
    MOV ah,02h
    INT 21h
    loop loop1
incrementer:
    dec var1
    mov var2,48
    dec subtractor2
    cmp subtractor2,0
    JBE exit
    mov al,subtractor2
    mov subtractor1,al
    JMP main_loop
exit:
    mov ah,4ch
    int 21h
end