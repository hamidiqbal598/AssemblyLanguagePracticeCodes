.model
.stack

.data
height db 0
asterisk db 42
looper1 db 0
looper2 db 0
string db 'Give the Height $'
space db ' $'
space1 db 0
space2 db 0
looper3 db 0
.code

mov ax,@data
mov ds,ax

lea dx,string
mov ah,9
int 21h

mov ah,01h
int 21h
sub al,48

mov height,al
mov looper1,al
mov looper2,al
mov looper3,al

mov dl,10
mov ah,02h
int 21h

mov dl,13
mov ah,02h
int 21h 

asterisk_1:
    mov dl,asterisk
    mov ah,02h
    int 21h
spaces:
    cmp looper1,0
    JE asterisk_2
    lea dx,space
    mov ah,9
    int 21h
    dec looper1
    JMP spaces
asterisk_2:
    mov dl,asterisk
    mov ah,02h
    int 21h
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    inc space1
    mov al,space1
    mov space2,al
    cmp al,height
    JE exit
    jmp before_space
before_space:
    cmp space2,0
    JBE asterisk_1
    lea dx,space
    mov ah,9
    int 21h
    JE exit
    sub looper2,2
    mov al,looper2
    mov looper1,al
    dec space2
    JMP before_space  
exit:
    mov ah,4ch
    int 21h
end    