; Andrew Persaud (23627628)
;----------------------------------------------------------------------
;To assemble and run:
;	nasm -f elf task_1.asm
;	ld -m elf_i386 task_1.o -o task_1
;	./task_1

		global 		_start

		section		.text
_start:		mov		eax,4		;System call for write
		mov		ebx,1		;file handle 1 is stdout
		mov		ecx,message	;Puts the string to output in the C register
		mov		edx,31		;Number of bytes
		int 80h				;Request for an interuption
exit:		mov		eax,1		;System call number for exit
		mov		ebx,0		;return 0 on exit (No errors)
		int 80h				;Request for an interuption

		section 	.data
message:	db 		"Andrew Persaud 23627628 CC2", 0Ah

