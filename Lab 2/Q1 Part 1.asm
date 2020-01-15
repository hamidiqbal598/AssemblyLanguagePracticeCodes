.model
.stack
.data
var db 0
adder db 0
adder2 db 0
looper db 0
looper2 db 0
lesser db 0
lesser1 db 0
var2 db 0
looper3 db 0
looper4 db 0
subtracter db 0

var3 db 0
adder3 db 0
adder4 db 0
looper5 db 0
looper6 db 0
lesser2 db 0
lesser3 db 0
var4 db 0
looper7 db 0
looper8 db 0
subtracter1 db 0


.code
mov subtracter,6
mov looper2,4
mov looper3,4
mov looper4,5
mov var2,49
mov looper,18
mov var,54         
mov adder,49
mov adder2,54
mov lesser,49
mov lesser1,49
mov cx,24
loop_main:
    cmp looper,0
    JBE exit
    loop loop1

newline:
    dec looper4
    cmp looper4,0
    JE exit
    dec looper3
    mov bl,var2
    mov bl,looper3
    mov looper2,bl
    dec adder2
    mov bl,adder2
    mov var,bl
    dec subtracter
    mov bl,adder2
    mov adder,bl
    mov bl,adder
    mov var2,bl
    mov bl,lesser1
    mov lesser,bl
    mov bl,subtracter
    sub looper,bl
    MOV dl,10
    MOV ah,02h
    INT 21h
    MOV dl,13
    MOV ah,02h
    INT 21h
    jmp loop_main

loop1:
    cmp cl,looper
    JE loop2
    dec var
    mov dl,var
    mov ah,02h
    int 21h
loop loop1
loop2:
    inc lesser
    cmp looper2,0
    JE newline
    mov al,lesser
    mov dl,al
    mov ah,02h
    int 21h
    dec looper2
    JMP loop2
    
exit:
    mov ah,4ch
    int 21h
end    