.model small
.stack 100h  

.data
string_input db 26 dup ('$')         
string_in db 'Enter the string $'
string_out db 'You entered $'

.code 

mov ax,@data
mov ds,ax
lea dx,string_in
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
       
lea dx,string_out
mov ah,09h
int 21h
                   
mov si,offset string_input+2

Output:
    cmp [si],'$'
    JE exit
    mov dx,[si]
    mov ah,02h
    int 21h
    inc si
    JMP Output
exit:
    mov ah,4ch
    int 21h

end