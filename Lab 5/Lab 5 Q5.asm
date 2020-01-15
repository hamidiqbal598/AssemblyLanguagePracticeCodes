.model
.stack

.data
var dw 0
looper db 0
looper1 db 0
index dw 0
store db 0
array db 10 dup(?)
remainder db 0
.code
mov looper1,6
mov looper,10
mov store,49
mov index,5
mov si,offset array
loop1:  
    cmp looper,0
    JE set
    mov dl,store
    mov [array+si],dl
    add store,1
    dec looper
    inc si
    JMP loop1
set:   
    mov store,1
print:
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    mov looper,2
    dec looper1
    cmp looper1,0
    JE exit
    JMP next_loop
   
next_loop:      
    cmp looper,0 
    JE print
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
    inc store
    inc si
    JMp next_loop    
     
exit:
mov ah,4ch
int 21h
end