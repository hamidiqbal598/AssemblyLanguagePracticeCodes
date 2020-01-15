.model small
.stack 100h  

.data
string_input db 26 dup ('$')         
string_in_1 db 'Enter the string $'
string_in_2 db 'Now enter the character you want to search $'
string_out db 'The character is at position $'
search db ?
remainder db 0 
count db 0
.code 

mov ax,@data
mov ds,ax
lea dx,string_in_1
mov ah,09h
int 21h
               
mov dx,offset string_input
mov ah,0Ah
int 21h                  
       
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h
       
lea dx,string_in_2
mov ah,09h
int 21h
mov ah,01h
int 21h
mov search,al
 
mov si,offset string_input+2
Search_Character:
    cmp al,[si] 
    JE exit
    inc count
    inc si
    JMP Search_Character
exit:
    mov dx,10
    mov ah,02h
    int 21h
    mov dx,13
    mov ah,02h
    int 21h
    lea dx,string_out
    mov ah,09h
    int 21h
    mov ax,0
    mov al,count
    mov bl,10
    div bl
    mov remainder,ah
    add al,48
    mov dl,al
    mov ah,02h
    int 21h
    add remainder,48
    mov dl,remainder
    mov ah,02h
    int 21h
    mov ah,4ch
    int 21h
end