.model medium
.stack
.data
.code
mov al,65
mov cx,26
L1:
    mov dl,al
    mov ah,02h
    int 21h
    inc al
    cmp cx,0
    JBE exit
loop L1    
exit:
    mov ah,4ch
    int 21h   
end     