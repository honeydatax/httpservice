	.file	"lcase.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	lcase
	.type	lcase, @function
lcase:
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	std Y+4,r25
	std Y+3,r24
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	rjmp .L2
.L4:
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	mov r30,r24
	mov r31,r25
	ld r24,Z
	cpi r24,lo8(65)
	brlt .L3
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	mov r30,r24
	mov r31,r25
	ld r24,Z
	cpi r24,lo8(91)
	brge .L3
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+3
	ldd r21,Y+4
	add r18,r20
	adc r19,r21
	mov r30,r18
	mov r31,r19
	ld r18,Z
	subi r18,lo8(-(32))
	mov r30,r24
	mov r31,r25
	st Z,r18
.L3:
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r24,1
	std Y+2,r25
	std Y+1,r24
.L2:
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	mov r30,r24
	mov r31,r25
	ld r24,Z
	tst r24
	brne .L4
	ldd r24,Y+1
	ldd r25,Y+2
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	lcase, .-lcase
	.section	.rodata
.LC0:
	.string	"HeLlO WoRlD\n"
	.text
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,15
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 15 */
/* stack size = 17 */
.L__stack_usage = 17
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	ldi r24,lo8(13)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	mov r26,r28
	mov r27,r29
	adiw r26,3
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	mov r24,r28
	mov r25,r29
	adiw r24,3
	rcall lcase
	std Y+2,r25
	std Y+1,r24
	ldi r24,0
	ldi r25,0
/* epilogue start */
	adiw r28,15
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.1"
.global __do_copy_data
