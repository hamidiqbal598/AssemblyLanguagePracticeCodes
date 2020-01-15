.model
.stack

.data
input db 0
start db 0
looper db 0
looper1 db 0
string db 'Your Input $'
.code
mov ax,@data
mov ds,ax
mov start,49
lea dx,string
mov ah,9
int 21h
mov ah,01h
int 21h
sub al,48
mov input,al

mov dl,10
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
mov al,input
mov looper,al
mov looper1,al

loop1:
    cmp looper,0
    JE newline
    mov dl,start
    mov ah,02h
    int 21h
    dec looper
    JMP loop1

newline:
    inc start
    dec input
    cmp input,0
    JE exit
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    mov al,looper1
    mov looper,al
    jmp loop1 

exit:
    mov ah,4ch
    int 21h
end