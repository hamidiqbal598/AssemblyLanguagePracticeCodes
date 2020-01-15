.model
.stack
.data
input db 0
start dw 0
product dw 0
quotient dw 0
remainder dw 0
string1 dw 'Your Input $'
string2 db 'The squares $'
.code
mov ax,@data
mov ds,ax
mov start,48
lea dx,string1
mov ah,9
int 21h
mov ax,0

mov ah,01h
int 21h   

sub al,48
mov input,al
mov cl,input
Table:
    cmp cl,0
    JE string_squares
    inc start
    MOV dl,10
    MOV ah,02h
    INT 21h
    MOV dl,13
    MOV ah,02h
    INT 21h
    mov dx,start
    mov ah,02h
    int 21h
loop Table

string_squares:
    mov dl,10
    mov ah,02h
    int 21h 
    mov dl,13
    mov ah,02h
    int 21h
    LEA DX,string2      ; load & display the STRING2  
    MOV AH,9            
    INT 21H
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h 

mov cl,input
mov start,0
squares:
    cmp cl,0
    JE exit
    inc start
    mov ax,0
    mov ax,start
    mov bx,start
    mul bx
    mov product,ax
    mov ax,product
    mov bx,10
    div bx
    mov quotient,ax
    mov remainder,dx
    add quotient,48
    add remainder,48
    mov dx,quotient
    mov ah,02h
    int 21h
    mov dx,remainder
    mov ah,02h
    int 21h
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
loop squares 
exit:
    mov ah,4ch
    int 21h
end