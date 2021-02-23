;Andrew Persaud (23627628)
;To assemble and run:
;	nasm -f elf task_2.asm
;	ld -m elf_i386 task_2.o -o task_2
;	ls task_2
;	./task_2

global		_start

section 	.text
_start:


mov 		eax, message		;Moves message into the eax register
push		ebx			;Saves the value of ebx
call 		strlen			;Calls the string length function
pop		ebx;			;Restore the value of ebx

mov 		eax, 4			;System call for write
mov		ebx, 1			;File handle 1 is stdout
mov		ecx, message		;Puts the string to output in the C register
int 		80h			;Request for an interuption

exit:
mov		eax, 1			;System call for exit
mov 		ebx, 0			;return 0 on exit (No errors)
int 		80h			;Request for an interuption

strlen:					;the string length function
mov		ebx, 0			;EBX will be the length of the string, set to 0

strlen_loop:				;a loop function that will go through each character
cmp		byte [eax+ebx], 0	;compares the bytes to 0
je		strlen_end		;If condition is satisfied, jump to end. Meaning the character of the string

inc		ebx			;If it is not satisfied, increment EBX by 1 keeping  track of its length
jmp		strlen_loop 		;Continue doing the loop

strlen_end:				;End of string function
inc 		ebx 			;Increment ebx by 1
mov		edx, ebx		;Instead of storing answer in ebx, store it in edx.  EBX will be used for File handle later on.

ret					;Return the size of the string (in ebx)

section		.data
message:	db "Hello, I am the string you are looking for", 0Ah
 
