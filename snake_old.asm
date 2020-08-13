[org 0x0100]


mov ax,1100
out 0x40,al
mov al,ah
out 0x40,al
jmp start

snake_size: dw 20
direction: dw 0x004d
temp_index: dw 846
end_index: dw 846
start_index: dw 810
not_check: dw 2
life: dw 3
ticks: dw 0
temp_ticks: dw 0
temp_seconds: dw 0
stage : dw 0
minutes : dw 0
seconds: dw 0
speed_counter: dw 0
speed_limit : dw 100
speed : dw 1
temp_speed: dw 1
life_flag: dw 0
cool: dw 0
fruit : db 0x23 , 0x24 , 0x25 , 0x26 
color: db 0x05, 0x03, 0x02, 0x01

 
old_kbisr: dd 0
old_timer: dd 0

flag : dw 0
stop:dw 0


message: db 'GAME OVER',0
message2: db 'Total life :',0 
message3: db 'Time :',0
message4: db 'Score : ',0
message5: db'Congatulations! You Won  :',0


boundry:
pusha
mov ax,0xb800
mov es,ax

mov ah,0x11
;mov al,'|'

mov si,320   ;gap of two rows and 8 columns from start
mov di,3840  ;gap of two rows and 8 columns from end

l_boundry:

mov word[es:si],ax
add si,160
cmp si,di
jnz l_boundry

mov si,0
mov di,320
;mov al,'~'

u_boundry:

mov word[es:si],ax
add si,2
cmp si,di
jnz u_boundry

mov si,478
mov di,3998

r_boundry:

mov word[es:si],ax
add si,160
cmp si,di
jnz r_boundry

mov si,3840
mov di,4000

d_boundry:

mov word[es:si],ax
add si,2
cmp si,di
jnz d_boundry

popa
ret


level2:
pusha
mov ax,0xb800
mov es,ax

mov ah,0x11
;mov al,'|'

mov si,320   ;gap of two rows and 8 columns from start
mov di,3840  ;gap of two rows and 8 columns from end

l_boundry1:

mov word[es:si],ax
add si,160
cmp si,di
jnz l_boundry1

mov si,0
mov di,320
;mov al,'~'

u_boundry1:

mov word[es:si],ax
add si,2
cmp si,di
jnz u_boundry1

mov si,478
mov di,3998

r_boundry1:

mov word[es:si],ax
add si,160
cmp si,di
jnz r_boundry1

mov si,3840
mov di,4000

d_boundry1:

mov word[es:si],ax
add si,2
cmp si,di
jnz d_boundry1


mov si, 980
mov  di,1018

h_hurdle1:

mov word[es:si],ax
add si,2
cmp si,di
jnz h_hurdle1

mov si,1616
mov di,2736

v_hurdle1:

mov word[es:si],ax
add si,160
cmp si,di
jnz v_hurdle1

mov si,2982
mov di,3020

h_hurdle2:

mov word[es:si],ax
add si,2
cmp si,di
jnz h_hurdle2

mov si,1424
mov di,2544

v_hurdle2:

mov word[es:si],ax
add si,160
cmp si,di
jnz v_hurdle2


popa
ret


level3:
pusha
mov ax,0xb800
mov es,ax

mov ah,0x11
;mov al,'|'

mov si,320   ;gap of two rows and 8 columns from start
mov di,3840  ;gap of two rows and 8 columns from end

l_boundry2:

mov word[es:si],ax
add si,160
cmp si,di
jnz l_boundry2

mov si,0
mov di,320
;mov al,'~'

u_boundry2:

mov word[es:si],ax
add si,2
cmp si,di
jnz u_boundry2

mov si,478
mov di,3998

r_boundry2:

mov word[es:si],ax
add si,160
cmp si,di
jnz r_boundry2

mov si,3840
mov di,4000

d_boundry2:

mov word[es:si],ax
add si,2
cmp si,di
jnz d_boundry2


mov si, 980
mov  di,1018

h_hurdle3:

mov word[es:si],ax
add si,2
cmp si,di
jnz h_hurdle3

mov si,1616
mov di,2736

v_hurdle3:

mov word[es:si],ax
add si,160
cmp si,di
jnz v_hurdle3

mov si,2982
mov di,3020

h_hurdle4:

mov word[es:si],ax
add si,2
cmp si,di
jnz h_hurdle4

mov si,1424
mov di,2544

v_hurdle4:

mov word[es:si],ax
add si,160
cmp si,di
jnz v_hurdle4

mov si,1200
mov di,2800

d_hurdle:
mov word[es:si],ax
add si,160
cmp si,di
jnz d_hurdle


popa
ret





Generate_dangerous:
pusha

mov ax,0

place:

add ax,17
mov bx,word[cs:seconds]
mul bx
mov bx,word[cs:end_index]
add ax,bx
;mul bx
shl ax,1

now2:
cmp ax,30000
jbe good2
shr ax,1
jmp now2

good2:



mov bx,3360
div bx
add dx,640
mov di,dx
;push 1234
;push di
;call printnum
;mov word[es:520],0x0720
cmp word[es:di],0x0720
jnz place

mov ax,0x0458
mov word[es:di],ax

popa

ret

generate_fruit:

pusha

mov ax,0
placement:

;mov word[es:580],0x0742
add ax,17
mov bx,word[cs:temp_seconds]
add bx,2
mul bx
mov bx,word[cs:end_index]
add ax,bx
;mul bx
shl ax,1

now1:
cmp ax,30000
jbe good1
shr ax,1
jmp now1

good1:

add ax,18

;good:
mov bx,2680
div bx
add dx,640
mov di,dx

;mov word[es:1234],0x0720
;mov word[es:580],0x0720
cmp word[es:di],0x0720

jnz placement

mov ax,17
mov bx,word[cs:seconds]
mul bx
add bx,23
mov bx,word[cs:start_index]
add ax, bx
;add ax,ax
;shl ax,1

now:
cmp ax,10000
jbe good
shr ax,1
jmp now

good:
mov bx,4
div bx

mov si,dx
mov bx,fruit
mov al,byte[bx+si]
mov bx,color
mov ah,byte[bx+si]
mov word[es:di],ax
popa
ret



myisr:

pusha
push bp

mov bp,sp
add word[bp+2],2
mov ax,0xb800
mov es,ax
mov word[es:478],0x0739

pop bp
popa

iret

clrscr: 
 push es
 push ax
 push cx
 push di
 mov ax, 0xb800
 mov es, ax
 xor di, di 
 mov ax, 0x0720 
 mov cx, 2000 
 cld 
 rep stosw 
 pop di 
 pop cx
 pop ax
 pop es
 ret 

increase_size:

pusha
push di
mov ah,0x07
mov al,'+'
mov di,word[start_index]
;mov word[es:di],0x0220
add di,2
cmp [es:di],ax
jnz check2
mov cx,4
sub di,2
in1:
sub di,2
mov word[es:di],ax
sub word[start_index],2
loop in1
;mov word[es:start_index],0x0220
add word[snake_size],4
pop di
jmp hogya

check2:
;push di
mov di,word[start_index]
;mov word[es:di],0x0220
sub di,2
cmp [es:di],ax
jnz check3
mov cx,4
add di,2
in2:
add di,2
mov word[es:di],ax
add word[start_index],2
loop in2
;mov word[es:start_index],0x0220
add word[snake_size],4
pop di
jmp hogya

check3:
;push di
mov di,word[start_index]
;mov word[es:di],0x0220
sub di,160
cmp [es:di],ax
jnz check4
mov cx,4
add di,160
in3:
add di,160
mov word[es:di],ax
add word[start_index],160
loop in3
;mov word[es:start_index],0x0220
add word[snake_size],4
pop di
jmp hogya

check4:
;push di
mov di,word[start_index]
;mov word[es:di],0x0220
add di,160
cmp [es:di],ax
jnz not_increase
mov cx,4
sub di,160
in4:
sub di,160
mov word[es:di],ax
sub word[start_index],160
loop in4
;mov word[es:start_index],0x0220
add word[snake_size],4
pop di


hogya:
cmp word[snake_size],240
jnz wakai_hogya


add word[cs:stage],1
cmp word[cs:stage],1
jz stage2
cmp word[cs:stage],2
jz stage3
cmp word[cs:stage],3
jnz wakai_hogya
call clrscr

wakai_hogya:
popa
ret

stage2:


mov word[temp_seconds],0
mov word[life],4
mov word[speed],1
mov word[snake_size],20
call clrscr
call level2
call snake
jmp wakai_hogya

stage3:

mov word[temp_seconds],0
mov word[life],4
mov word[speed],1
mov word[snake_size],20
call clrscr
call level3
call snake
jmp wakai_hogya


timer:

pusha
push cs
pop ds

cmp word[stage],3
jnz abhi_khelte_jaao 

;call clrscr
mov ax, 30
 push ax ; push x position
 mov ax, 10
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message5
 push ax ; push address of message
 call print_string ; call the printstr subroutin




abhi_khelte_jaao:
mov ax,0xb800
mov es,ax

add word[cs:temp_ticks],1
cmp word[cs:temp_ticks],1000
jnz speed_nahi_barahni
mov word[cs:temp_ticks],0
add word[cs:temp_seconds],1
cmp word[cs:temp_seconds],20 
jnz speed_nahi_barahni
;add word[cs:speed],1
mov ax, word[cs:speed_limit]
shr ax,1
mov word[cs:speed_limit],ax

mov word[cs:temp_seconds],0
mov word[cs:speed_counter],0

speed_nahi_barahni:

mov ax,word[speed]
mov word[temp_speed],ax

add word[ticks],1
cmp word[ticks],1000
jnz kuch_nahi
mov word[ticks],0
add word[seconds],1
push 523
call sound
cmp word[seconds],60
jnz jaane_de
add word[minutes],1
cmp word[minutes],4
jnz  not_check_characters

cmp word[cs:snake_size],240
jnz reduce_life

not_check_characters:
mov word[seconds],00
push ax
mov ax,0xb800
mov es,ax
pop ax
mov word[es:318],0x0720

jaane_de:
push 316
push word[seconds]
call printnum
push 312
push word[minutes]
call printnum
push 52
mov ax,[snake_size]
sub ax,20
push ax
call printnum 
cmp word[seconds],15
jnz kuch_nahi
call Generate_dangerous

kuch_nahi:

;mov cx,0xffff
;lop2:
;dec cx
;jnz lop2
;mov cx,0xffff
;lop3:
;dec cx
;jnz lop3
;mov ax,word[speed]
;mov word[temp_speed],ax

 
mov ah,0
in al,0x60




for_speed:

;mov cx,0xffff
;lop:
;dec cx
;jnz lop
;comparsions for moving snake in desired direction

cmp al,0x48   ;up
jnz nextcmp
mov dx,word[cs:direction]
cmp dx,0x0050 ;checking if down
jz go

mov word[direction],ax
jmp go

nextcmp:
cmp al,0x50 ;down
jnz nextcmp2
mov dx,word[cs:direction]
cmp dx,0x0048  ;checking if up
jz go
mov word[direction],ax
jmp go

nextcmp2:
cmp al,0x4b  ;left
jnz nextcmp3
mov dx,word[cs:direction]
cmp dx,0x004d ;checking if right
jz go
mov word[direction],ax
jmp go

nextcmp3:
cmp al,0x4d  ;right
jnz go
mov dx,word[cs:direction]
cmp dx,0x004b  ;checking if left
jz go
mov word[direction],ax



go:


add word[cs:speed_counter],1
mov ax,[cs:speed_counter]
cmp word[cs:speed_limit],ax
jnz seedha_end
mov word[cs:speed_counter],0



mov ah,0x07
mov al,'+'
mov dx,[cs:direction]
cmp dx,0x0048 ;checking up
jz up
cmp dx,0x0050  ;checking down
jz down
cmp dx,0x004B ;checking left
jz left
cmp dx,0x0048


mov bh,0x11
right:

mov di,word[cs:end_index] ;swapping head
add di,2

cmp word[es:di],ax
jz reduce_life
cmp word[es:di],bx
jz reduce_life
cmp word[es:di],0x0458
jz reduce_size

push si
mov cx,4
loping:
sub cx,1
mov si,cx
mov bx,fruit
mov al,byte[bx+si]
mov bx,color
mov ah,byte[bx+si]
cmp word[es:di],ax
jz increase
cmp cx,0
jnz loping
pop si
jmp not_increase

increase:
mov word[es:di],0x0720
pop si
call increase_size
call generate_fruit

not_increase:
mov word[cs:end_index],di
mov si,word[cs:temp_index]
call swap
mov word[cs:not_check],2


push 2
push 160
push -160
push -2
call MOVEMENT
jmp khtm

left:
mov bh,0x11
mov bl,0

mov di,word[cs:end_index] ;swapping head
sub di,2

cmp word[es:di],ax
jz reduce_life
cmp word[es:di],bx
jz reduce_life
cmp word[es:di],0x0458
jz reduce_size

push si
mov cx,4
loping1:
sub cx,1
mov si,cx
mov bx,fruit
mov al,byte[bx+si]
mov bx,color
mov ah,byte[bx+si]
cmp word[es:di],ax
jz increase1
cmp cx,0
jnz loping1
pop si
jmp not_increase1

increase1:
mov word[es:di],0x0720
pop si
call increase_size
call generate_fruit


not_increase1:

mov word[cs:end_index],di
mov si,word[cs:temp_index]
call swap
mov word[cs:not_check],-2


push -2
push -160
push 160
push 2
call MOVEMENT 
jmp khtm


up:
mov bh,0x11
mov di,word[cs:end_index] ;swapping head
sub di,160

cmp word[es:di],ax
jz reduce_life
cmp word[es:di],bx
jz reduce_life
cmp word[es:di],0x0458
jz reduce_size

push si
mov cx,4
loping2:
sub cx,1
mov si,cx
mov bx,fruit
mov al,byte[bx+si]
mov bx,color
mov ah,byte[bx+si]
cmp word[es:di],ax
jz increase2
cmp cx,0
jnz loping2
pop si
jmp not_increase2

increase2:
mov word[es:di],0x0720
pop si
call increase_size
call generate_fruit


not_increase2:
mov word[cs:end_index],di
mov si,word[cs:temp_index]
call swap
mov word[cs:not_check],-160

push -160
push 2
push -2
push 160
call MOVEMENT 
jmp khtm


down:
mov bh,0x11
mov bl,0

mov di,word[cs:end_index] ;swapping head
add di,160

cmp word[es:di],ax
jz reduce_life
cmp word[es:di],bx
jz reduce_life
cmp word[es:di],0x0458
jz reduce_size

push si
mov cx,4
loping3:
sub cx,1
mov si,cx
mov bx,fruit
mov al,byte[bx+si]
mov bx,color
mov ah,byte[bx+si]
cmp word[es:di],ax
jz increase3
cmp cx,0
jnz loping3
pop si
jmp not_increase3

increase3:
mov word[es:di],0x0720
pop si
call increase_size
call generate_fruit



not_increase3:

mov word[cs:end_index],di
mov si,word[cs:temp_index]
call swap
mov word[cs:not_check],160

push 160
push  2
push -2
push -160
call MOVEMENT
	
khtm:
mov ax,word[cs:end_index]
mov word[cs:temp_index],ax

end: 
; cmp word[life],0
 ;jz print_str
; cmp word[temp_speed],0
; jz seedha_end
 ;dec word[temp_speed]
 ;jnz for_speed
 seedha_end:
 popa
 mov al, 0x20
 out 0x20, al ; send EOI to PIC
 iret ; return from interrupt






MOVEMENT:

mov bp,sp
pusha

mov ah,0x07
mov al,'+'


mov cx,word[cs:snake_size]
dec cx

movement:  ;ONLY FOR every movement


mov di,word[cs:temp_index]
add di,[bp+2]
cmp word[es:di],ax
jnz next_comp


mov si,[bp+2]
cmp si,word[cs:not_check]
jz next_comp

mov si,di   ;pointing to +
mov di,[cs:temp_index]   ;pointing ar space

call swap
cmp word[cs:start_index],si
jnz continue
mov word[cs:start_index],di
;mov word[es:di-2],0x0720
jmp finish

continue:
mov word[cs:temp_index],si

push ax
push dx
push di
;sub di,si
mov di,word[bp+2]
mov ax,di
mov dx,-1
mul dx
mov word[cs:not_check],ax  ; for not check
pop di
pop dx
pop ax



dec cx
jnz movement

jmp finish
next_comp:

mov di,word[cs:temp_index] 
add di,[bp+4]
cmp word[es:di],ax
jnz next_comp2

mov si,[bp+4]
cmp si,[cs:not_check]
jz next_comp2

mov si,di   ;pointing to +
mov di,[cs:temp_index]   ;pointing ar space
call swap

cmp word[cs:start_index],si
jnz continue2
mov word[cs:start_index],di
;mov word[es:di-2],0x0720
jmp finish

continue2:
mov word[cs:temp_index],si



push ax
push dx
push di
;sub di,si
mov di,word[bp+4]
mov ax,di
mov dx,-1
mul dx
mov word[cs:not_check],ax  ; for not check
pop di
pop dx
pop ax

dec cx
jnz movement

jmp finish
next_comp2:
mov di,word[cs:temp_index]
add di,[bp+6]

cmp word[es:di],ax
jnz next_comp3    ;this will end when no + sign will be left

mov si,[bp+6]
cmp si,[cs:not_check]
jz next_comp3

mov si,di   ;pointing to +
mov di,[cs:temp_index]   ;pointing ar space

call swap

cmp word[cs:start_index],si
jnz continue3
mov word[cs:start_index],di
;mov word[es:di-2],0x0720
jmp finish

continue3:
mov word[cs:temp_index],si


push ax
push dx
push di

mov di,word[bp+6]
mov ax,di
mov dx,-1
mul dx
mov word[cs:not_check],ax  ; for not check
pop di
pop dx
pop ax

dec cx
jnz movement

jmp finish
next_comp3:
mov di,word[cs:temp_index]
add di,[bp+8]

cmp word[es:di],ax
jnz finish    ;this will end when no + sign will be left


mov si,[bp+8]
cmp si,[cs:not_check]
jz finish

mov si,di   ;pointing to +
mov di,[cs:temp_index]   ;pointing ar space

call swap

cmp word[cs:start_index],si
jnz continue4
mov word[cs:start_index],di
;mov word[es:di-2],0x0720
jmp finish

continue4:
mov word[cs:temp_index],si


push ax
push dx
push di
mov di,word[bp+8]
mov ax,di
mov dx,-1
mul dx
mov word[cs:not_check],ax  ; for not check
pop di
pop dx
pop ax

dec cx
jnz movement

mov ah,0x07
mov al,'#'
mov di,word[cs:start_index]
cmp word[es:di-2],ax
jnz agla
mov word[es:di-2],0x0720

jmp finish
agla:
cmp word[es:di+2],ax
jnz agla2
mov word[es:di+2],0x0720

jmp finish
agla2:

cmp word[es:di-160],ax
jnz agla3
mov word[es:di-160],0x0720

jmp finish
agla3:

cmp word[es:di+160],ax
jnz finish
mov word[es:di+160],0x0720



finish:
; cmp word[temp_speed],0
 ;jnz movement 


popa
ret 8

swap:

pusha
mov ax,0xb800
mov es,ax
mov ax,[es:di]
mov dx,[es:si]
mov word[es:di],dx
mov word[es:si],ax

end_it:
popa
ret

print_str:

mov ax, 30
 push ax ; push x position
 mov ax, 10
 push ax ; push y position
 mov ax, 0x81 ; blue on black attribute
 push ax ; push attribute
 mov ax, message
 push ax ; push address of message
 call print_string ; call the printstr subroutine
 jmp end


print_string:
 push bp
 mov bp, sp
 push es
 push ax
 push cx
 push si
 push di
 push ds
 pop es ; load ds in es
 mov di, [bp+4] ; point di to string
 mov cx, 0xffff ; load maximum number in cx
 xor al, al ; load a zero in al
 repne scasb ; find zero in the string
 mov ax, 0xffff ; load maximum number in ax
 sub ax, cx ; find change in cx
 dec ax ; exclude null from length
 jz exit ; no printing if string is empty
 mov cx, ax ; load string length in cx
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov al, 80 ; load al with columns per row
 mul byte [bp+8] ; multiply with y position
 add ax, [bp+10] ; add x position
 shl ax, 1 ; turn into byte offset
 mov di,ax ; point di to required location
 mov si, [bp+4] ; point si to string
 mov ah, [bp+6] ; load attribute in ah
 cld ; auto increment mode
nextchar: lodsb ; load next char in al
 stosw ; print char/attribute pair
 loop nextchar ; repeat for the whole string
exit: pop di
 pop si
 pop cx
 pop ax
 pop es
 pop bp
 ret 8 

printnum:
 push bp
 mov bp, sp
 push es
 push ax
 push bx
 push cx
 push dx
 push di
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov ax, [bp+4] ; load number in ax
 mov bx, 10 ; use base 10 for division
 mov cx, 0 ; initialize count of digits
nextdigit: mov dx, 0 ; zero upper half of dividend
 div bx ; divide by 10
 add dl, 0x30 ; convert digit into ascii value
 push dx ; save ascii value on stack
 inc cx ; increment count of values
 cmp ax, 0 ; is the quotient zero
 jnz nextdigit ; if no divide it again
 mov di, [bp+6] ; point di to top left column 
nextpos: pop dx ; remove a digit from the stack
 mov dh, 0x17 ; use normal attribute
 mov [es:di], dx ; print char on screen
 add di, 2 ; move to next screen location
 loop nextpos ; repeat for all digits on stack
 pop di
 pop dx
 pop cx
 pop bx
 pop ax
 pop es
 pop bp
 ret 4

reduce_life:
pusha

mov word[life_flag],1 
sub word[life],1
cmp word[life],0
jz print_str
call clrscr
mov word[snake_size],20
mov word[start_index],810
mov word[end_index],846
mov word[temp_index],846
mov word[not_check],2
mov word[direction],0x004d

cmp word[stage],0
jnz next_level
call boundry

jmp okay

next_level:
cmp word[stage],1
jnz next_level2
call level2

jmp okay
next_level2:
call level3

okay:
call snake
mov ax, 18
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message4
 push ax ; push address of message
 call print_string ; call the printstr subroutin

 mov ax, 148
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message3
 push ax ; push address of message
 call print_string ; call the printstr subroutine


mov ax, 0
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message2
 push ax ; push address of message
 call print_string ; call the printstr subroutine
push 26
push word[life]
call printnum

;call generate_fruit 

;mov ax, 0xb800
;mov es,ax
;mov ah,0x07
;mov al,'#'
;mov word[es:2264],ax
popa
jmp end



reduce_size:
pusha

mov word[life_flag],1 
;sub word[life],1
;cmp word[life],0
;jz print_str
call clrscr
mov word[snake_size],20
mov word[start_index],810
mov word[end_index],846
mov word[temp_index],846
mov word[not_check],2
mov word[direction],0x004d


cmp word[stage],0
jnz next_level3
call boundry

jmp okay2

next_level3:
cmp word[stage],1
jnz next_level4
call level2

jmp okay2
next_level4:
call level3

okay2:



call snake

 mov ax, 148
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message3
 push ax ; push address of message
 call print_string ; call the printstr subroutine

mov ax, 18
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message4
 push ax ; push address of message
 call print_string ; call the printstr subroutin


mov ax, 0
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message2
 push ax ; push address of message
 call print_string ; call the printstr subroutine
push 26
push word[life]
call printnum
 

popa
jmp end



snake:
pusha

;mov cx,[start_index]
;shl cx,1
;sub cx,2
;mov word[end_index],cx
mov ax,0xb800
mov es,ax
mov di,word[start_index]
cld
mov ah,0x07
mov  al,'+'
mov bx,2
mov cx,[snake_size]
sub cx,2
rep stosw
mov al,'@'
mov word[es:di],ax
mov  ah,0x17
mov al,':'
mov word[es:314],ax
call generate_fruit
popa
ret

sound:              push bp
                    mov bp, sp
                    push ax

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
    .pause1:
                    mov     cx, 25535
    .pause2:
                    dec     cx
                    jne     .pause2
                    dec     bx
                    jne     .pause1
                    in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
                    and     al, 11111100b   ; Reset bits 1 and 0.
                    out     61h, al         ; Send new value.
                    
                    pop ax
                    pop     bp
                    ret     2


start:
call clrscr
call boundry
call snake

mov ax, 148
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message3
 push ax ; push address of message
 call print_string ; call the printstr subroutine


 mov ax, 0
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message2
 push ax ; push address of message
 call print_string ; call the printstr subroutine


mov ax, 18
 push ax ; push x position
 mov ax, 0
 push ax ; push y position
 mov ax, 0x71 ; blue on black attribute
 push ax ; push attribute
 mov ax, message4
 push ax ; push address of message
 call print_string ; call the printstr subroutine

push 52
mov ax,[snake_size]
sub ax,20
push ax
call printnum 


push 26
push word[life]
call printnum

;call generate_fruit
;mov ax,0xb800
;mov es,ax
;mov ah,0x07
;mov al,'#'

;mov [es:2628],ax
xor ax,ax
mov es,ax
mov ah,0

mov ax,word[es:8h*4]
mov word[old_timer],ax
mov ax,[es:8h*4 +2]
mov word[old_timer+2],ax

cli
mov word[es:8h*4],timer
mov [es:8h*4 +2],cs
sti

cli
mov word[es:0*4],myisr
mov [es:0*4+2],cs
sti


l2:
jmp l2

;l3:
;jmp l3

;l4:
;jmp l4

mov dx, start ; end of resident portion
add dx, 15 ; round up to next para
mov cl, 4
shr dx, cl ; number of paras
mov ax,0x3100
int 21h
