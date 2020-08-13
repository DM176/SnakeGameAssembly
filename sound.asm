[org 0x0100]

jmp start


sounds: dw   262, 262, 294, 262, 349, 330, 262, 262, 294, 262, 392, 349, 262, 262, 523, 440, 349, 330, 294, 466, 466, 440, 349, 392, 349
sound:              push bp
                    mov bp, sp
                    push ax

                    mov ax,0xffff
		    waqfa:
		    dec ax
		    jnz waqfa
                     mov ax,0xffff
		    waqfa1:
		    dec ax
		    jnz waqfa1
 		    mov ax,0xffff
		    waqfa2:
		    dec ax
		    jnz waqfa2
                     mov ax,0xffff
		    waqfa3:
		    dec ax
		    jnz waqfa3
                    
                    mov     al, 182         ; Prepare the speaker for the
                    out     43h, al         ;  note.
                    mov     ax, [bp+4]
                    ;mov     ax, [bp+6]        ; Frequency number (in decimal)
                                            ;  for middle C.
                    out     42h, al         ; Output low byte.
                    mov     al, ah          ; Output high byte.
                    out     42h, al 
                    in      al, 61h         ; Turn on note (get value from
                                            ;  port 61h).
                    or      al, 00000011b   ; Set bits 1 and 0.
                    out     61h, al         ; Send new value.
                    mov     bx, 2          ; Pause for duration of note.
    
                    in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
                    and     al, 11111100b   ; Reset bits 1 and 0.
                    out     61h, al         ; Send new value.
                    
                    pop ax
                    pop     bp
                    ret     2

start:



mov cx,1000
l3:
push word[bx+sounds]   ;cx        
call sound
add bx,2
cmp bx,52
jnz l3


dec cx
jmp l3



 mov dx, start ; end of resident portion
 add dx, 15 ; round up to next para
 mov cl, 4
 shr dx, cl ; number of paras
 mov ax,0x3100
int 21h