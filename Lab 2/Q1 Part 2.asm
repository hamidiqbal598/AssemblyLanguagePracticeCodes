.model
.stack
.data
var db 0
adder db 0
looper db 0
.code
mov looper,30
mov var,48
mov adder,48
mov cx,36
loop1:
    cmp looper,0
    JBE exit
    loop loop2

newline:
    inc adder
    sub looper,6
    mov bl,adder
    mov var,bl
    MOV dl,10
    MOV ah,02h
    INT 21h
    MOV dl,13
    MOV ah,02h
    INT 21h
    jmp loop1

loop2:
    cmp cl,looper
    JE newline
    inc var
    mov dl,var
    mov ah,02h
    int 21h
loop loop2
exit:
    mov ah,4ch
    int 21h
end    