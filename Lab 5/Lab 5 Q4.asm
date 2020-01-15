.model
.stack

.data
var dw 0
looper db 0
index dw 0
store db 0
array db 10 dup(?)
remainder db 0
.code
mov looper,5
mov store,49
mov index,5
loop1:  
    cmp looper,0
    JE new
    mov dl,store
    mov [array+si],dl
    mov ah,02h
    int 21h
    mov dl,32
    mov ah,02h
    int 21h
    add store,2
    dec looper
    JMP loop1
new:
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    mov looper,5
    mov store,11
    mov si,5    
next_loop:      
    cmp looper,0 
    JE exit
    mov dl,store
    mov [array+si],dl
    mov ax,0
    mov al,store
    mov bl,10
    div bl
    mov remainder,ah
    mov dl,al
    add dl,48
    mov ah,02h
    int 21h
    mov dl,remainder
    add dl,48
    mov ah,02h
    int 21h
    mov dl,32
    mov ah,02h
    int 21h
    dec looper
    add store,3
    JMp next_loop 
exit:
mov ah,4ch
int 21h
end