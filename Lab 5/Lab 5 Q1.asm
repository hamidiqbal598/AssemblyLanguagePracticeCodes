.model
.stack

.data
array db 16 dup(?) 
looper1 db 0
looper2 db 0
row_string db 'Give the inputs for row $'
array_string db 'The Given array is $'
row_number db 0
minimum db 'The Minimum value is $'
maximum db 'The Maximum value is $'
new_liner dw 0

.code
                            
mov si,offset array
mov bx,16
mov ax,@data
mov ds,ax
mov looper2,4
mov row_number,48
mov new_liner,4

main_loop:
    cmp looper2,0
    JE offset_reset
    dec looper2
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    lea dx,row_string
    mov ah,9
    int 21h
    mov dl,row_number
    mov ah,02h
    int 21h
    inc row_number
    mov looper1,4
loop1:
    cmp looper1,0
    JE main_loop
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    mov ah,01h
    int 21h
    mov [array+si],al
    inc si
    dec looper1
    JMP loop1
offset_reset:
    mov si,offset array
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    lea dx,array_string
    mov ah,9
    int 21h
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
print:
    cmp si,16
    JE next_task
    cmp si,new_liner
    JE new_line              
    mov dl,[array+si]
    mov ah,02h
    int 21h
    mov dl,32
    mov ah,02h
    int 21h
    inc si
    JMP print
new_line:
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    add new_liner,4
    JMP print
next_task:
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    lea dx,minimum
    mov ah,9
    int 21h
    mov di,0
    mov si,offset array
min:
    cmp si,16
    JE final_minimum
    mov al,[array+di]
    cmp al,[array+si]
    JA not_minimum 
    inc si
    JMP min
not_minimum:
    inc di
    mov si,offset array
    JMP min
final_minimum:
    mov dl,[array+di]
    mov ah,02h
    int 21h
new_task:
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    lea dx,maximum
    mov ah,9
    int 21h
    mov di,0
    mov si,offset array
max:
    cmp si,16
    JE final_maximum
    mov al,[array+di]
    cmp al,[array+si]
    JB not_maximum
    inc si
    JMP max
not_maximum:
    inc di
    mov si,offset array
    JMP max
final_maximum:
    mov dl,[array+di]
    mov ah,02h
    int 21h 
exit:
    mov ah,4ch
    int 21h
end
    
    