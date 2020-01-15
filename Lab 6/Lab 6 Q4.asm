.model small
.stack 100h  

.data

buff1 db 26 dup ('$')
buff2 db 26 dup ('$')         
string_in db 'Enter the string $'
string_1 db 'You entered string 1 : $'
string_2 db 'The string 2 contains : $'

.code 

mov ax,@data
mov ds,ax
lea dx,string_in
mov ah,09h
int 21h
               
mov dx,offset buff1
mov ah,0Ah
int 21h                  
       
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h
       
lea dx,string_1
mov ah,09h
int 21h
mov ah,09h
mov dx,offset buff1+2
int 21h
                   
mov si,offset buff1+2 

mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h
       
lea dx,string_2
mov ah,09h
int 21h

Equal:
    cmp [si],'$'
    JE Output
    mov al,[si]
    mov [buff2+si],al
    inc si
    JMP Equal
Output:
    mov ah,09h
    mov dx,offset buff2+2
    int 21h
exit:
    mov ah,4ch
    int 21h
end