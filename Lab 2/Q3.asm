.model
.stack
.data
main_input1 dw 0
main_input2 dw 0
input1 dw 0
input2 dw 0
remainder1 dw 0
remainder2 dw 0
input3 dw 0
input4 dw 0
output db 0
output1 dw 0
output2 dw 0
temp dw 0
temp1 dw 0
.code

mov ah,01h
int 21h
mov ah,0
sub al,48
mov input1,ax

mov ah,01h
int 21h
mov ah,0
sub al,48
mov input2,ax

mov ax,input1
mov bx,10
mul bl

add ax,input2
mov main_input1,ax
mov temp1,ax

mov ah,01h
int 21h
mov ah,0
sub al,48
mov input3,ax

mov ah,01h
int 21h
mov ah,0
sub al,48
mov input4,ax

mov ax,input3
mov bx,10
mul bl

add ax,input4
mov main_input2,ax
mov temp,ax

mov ax,main_input1
cmp ax,main_input2         ;using it as a min
JA min1
JB min2
JMP result
min1:
    mov ax,0
    mov dx,0
    mov ax,main_input1
    mov bx,temp
    div bx
    cmp dx,0
    JE divide1
    dec temp
    JMP min1
divide1:
    mov dx,0
    mov ax,main_input2
    mov bx,temp
    div bx
    cmp dx,0       
    JE result
    cmp temp,1
    JE result1
    dec temp
    JMP min1
min2:
    mov ax,0
    mov dx,0
    mov ax,main_input2
    mov bx,temp1
    div bx
    cmp dx,0
    JE divide2
divide2:
    mov dx,0
    mov ax,main_input2
    mov bx,temp1
    div bx
    cmp dx,0       
    JE result2
    cmp temp1,1
    JE result1
    dec temp1
    JMP min2
result1:
    mov dx,49
    mov ah,02h
    int 21h
    JMP exit
result:    
    mov ax,temp
    mov bx,10
    div bx
    mov remainder2,dx
    add ax,48
    mov dx,ax
    mov ah,02h
    int 21h
    add remainder2,48
    mov dx,remainder2
    mov ah,02h
    int 21h
    JMP exit
result2:
    mov ax,temp1
    mov bx,10
    div bx
    mov remainder1,dx
    add ax,48
    mov dx,ax
    mov ah,02h
    int 21h
    add remainder1,48
    mov dx,remainder1
    mov ah,02h
    int 21h
    JMP exit
exit:
    mov ah,4ch
    int 21h
end
    