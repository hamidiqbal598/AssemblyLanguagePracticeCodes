.model
.stack
.data

int1 db 0
int2 db 0
int3 db 0
int4 db 0

.code

mov ah,01h
int 21h

sub al,48
mov int1,al

mov ah,01h
int 21h

sub al,48
mov int2,al

mov ah,01h
int 21h

sub al,48
mov int3,al

mov ah,01h
int 21h

sub al,48
mov int4,al
mov al,0
L1:
    MOV al,int1
    CMP al,int2
    JNAE L5
    JMP L2
L2:
    CMP al,int3
    JNAE L5
    JMP L3
L3:
    CMP al,int4
    JNAE L5
    JMP L4
L4:
    ADD int1,48
    MOV dl,int1
    MOV ah,02h
    INT 21h
    JMP exit
L5:
    MOV al,int2
    CMP al,int3
    JNAE L6
    JMP L7
L6:
    CMP al,int4
    JNAE L9
    JMP L8
    
L7:
    ADD int2,48
    MOV dl,int2
    MOV ah,02h
    INT 21h
    JMP exit
L8:
    MOV al,int3
    CMP al,int4
    JNAE L10
    JMP L9
L9:
    ADD int3,48
    MOV dl,int3
    MOV ah,02h
    INT 21h
    JMP exit
L10:
    ADD int4,48
    MOV dl,int4
    MOV ah,02h
    INT 21h
    JMP exit
exit:
    MOV ah,4ch
    INT 21h 
end