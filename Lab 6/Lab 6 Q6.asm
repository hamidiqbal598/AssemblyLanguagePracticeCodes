.model small
.stack 100h  

.data
string_1 db 26 dup ('$')
string_2 db 26 dup ('$')
string_3 db 26 dup ('$')         
string_in_1 db 'Enter string 1 $'
string_in_2 db 'Enter string 2 $'
string_in_3 db 'Enter string 3 $'
string_equal db 'The Strings are equal$'
string_equal_not db 'The Strings are not equal$'
.code 

mov ax,@data
mov ds,ax
;Taking string 1 as input 
lea dx,string_in_1
mov ah,09h
int 21h              
mov dx,offset string_1
mov ah,0Ah
int 21h                  
       
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h
   ;Taking string 2 as input
lea dx,string_in_2
mov ah,09h
int 21h               
mov dx,offset string_2
mov ah,0Ah
int 21h                  
       
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h
   ;Taking string 3 as input               
lea dx,string_in_3
mov ah,09h
int 21h
mov dx,offset string_3
mov ah,0Ah
int 21h                  
       
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h

mov si,offset string_1+2
Equality_Check:
    cmp [si],'$'
    JE check
    mov al,[si]
    cmp al,[string_2+si]
    JE Check_
    JMP not_equal    
check:
    mov bl,[string_2+si]
    cmp [si],bl
    JNE not_equal
    mov cl,[string_3+si]
    cmp [si],cl
    JNE not_equal
    cmp bl,cl
    JNE not_equal
    JMP equal
Check_:
    mov bl,[string_3+si]
    cmp al,bl
    JNE not_equal
    mov cl,[string_2+si]
    cmp cl,bl
    JE increment
    jmp not_equal
increment:        
    inc si
    JMP Equality_Check
not_equal:
    lea dx,string_equal_not
    mov ah,09h
    int 21h
    JMP exit
equal:
    lea dx,string_equal
    mov ah,09h
    int 21h
    JMP exit
exit:
    mov ah,4ch
    int 21h

end