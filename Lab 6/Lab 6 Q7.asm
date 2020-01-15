.model small
.stack 100h  

.data
string_input db 26 dup ('$')         
string_in db 'Enter the string $'
char_str1 db 'Give the 1st character $'  
char_str2 db 'Give the 2nd character $'
string_out db 'The resulting string is $'
char1 db 0
char2 db 0
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
lea dx,char_str1
mov ah,09h
int 21h
mov ah,01h 
int 21h
mov char1,al
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h
lea dx,char_str2
mov ah,09h
int 21h
mov ah,01h 
int 21h
mov char2,al
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h

mov si,offset string_input+2 
mov bl,char1
Replace_Characters:
    cmp [si],'$'
    JE print
    cmp [si],bl
    JE replace
    inc si
    JMP Replace_Characters                  
replace:
    mov al,char2
    mov [si],al
    inc si
    JMP Replace_Characters
print:
mov ah,09h 
mov dx,offset string_input+2 
int 21h
mov ah,4ch
int 21h

end