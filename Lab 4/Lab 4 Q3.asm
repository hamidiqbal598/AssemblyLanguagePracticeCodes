.model
.stack

.data
input1_1 db 0
input1_2 db 0
input2_1 db 0
input2_2 db 0
input1 db 0
input2 db 0
operand db 0
result db 0 
string0 db 'Give your input as 00+00 $'
string1 db 'The product is $'
string2 db 'The sum is $'
string3 db 'The difference is $'
string4 db 'The division is $'

.code
mov ax,@data
mov ds,ax
lea dx,string0
mov ah,9
int 21h
mov dl,10
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
mov ah,01h
int 21h
sub al,48
mov bl,10
mul bl
mov input1_1,al

mov ah,01h
int 21h
sub al,48        

add al,input1_1
mov input1,al

mov ah,01h
int 21h
mov operand,al

mov ah,01h
int 21h
sub al,48
mov bl,10
mul bl
mov input2_1,al

mov ah,01h
int 21h
sub al,48        

add al,input2_1
mov input2,al

mov dl,10
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
mov ax,0
cmp operand,42
JE Product
CMP operand,43
JE Sum
CMP operand,45
JE Subtract
cmp operand,47
JE Divide
Product:
    lea dx,string1
    mov ah,9
    int 21h
    mov al,input1
    mov bl,input2
    mul bl
    mov bl,10
    div bl
    mov input1_1,ah
    add al,48
    mov dl,al
    mov ah,02h
    int 21h
    mov dl,input1_1
    add dl,48
    mov ah,02h
    int 21h
    JMP exit
Sum:
    lea dx,string2
    mov ah,9
    int 21h
    mov ax,0
    mov al,input1
    add al,input2
    mov bl,10
    div bl
    mov input1_1,ah
    add al,48
    mov dl,al
    mov ah,02h
    int 21h
    mov dl,input1_1
    add dl,48
    mov ah,02h
    int 21h
    JMP exit
Subtract:
    lea dx,string3
    mov ah,9
    int 21h
    mov ax,0
    mov al,input1
    sub al,input2
    mov bl,10
    div bl
    mov input1_1,ah
    add al,48
    mov dl,al
    mov ah,02h
    int 21h 
    mov dl,input1_1
    add dl,48
    mov ah,02h
    int 21h
    JMP exit
Divide:
    lea dx,string4
    mov ah,9
    int 21h
    mov ax,0
    mov al,input1
    mov bl,input2
    div bl
    mov bl,10
    div bl
    mov input1_1,ah
    add al,48
    mov dl,al
    mov ah,02h
    int 21h
    mov dl,input1_1
    add dl,48
    mov ah,02h
    int 21h
    JMP exit
exit:
    mov ah,4ch
    int 21h
end