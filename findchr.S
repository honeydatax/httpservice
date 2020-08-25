	.file	"findchr.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	findcahr
	.type	findcahr, @function
findcahr:
	push r28
	push r29
	rcall .
	rcall .
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 7 */
.L__stack_usage = 7
	std Y+4,r25
	std Y+3,r24
	std Y+5,r22
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	rjmp .L2
.L4:
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
	breq .L3
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	mov r30,r24
	mov r31,r25
	ld r25,Z
	ldd r24,Y+5
	cp r25,r24
	brne .L4
.L3:
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	mov r30,r24
	mov r31,r25
	ld r25,Z
	ldd r24,Y+5
	cp r25,r24
	breq .L5
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	std Y+2,r25
	std Y+1,r24
.L5:
	ldd r24,Y+1
	ldd r25,Y+2
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	findcahr, .-findcahr
	.section	.rodata
.LC0:
	.string	"hello world\n"
	.text
.global	main
	.type	main, @function
main:
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
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	std Y+4,r25
	std Y+3,r24
	ldd r24,Y+3
	ldd r25,Y+4
	ldi r22,lo8(119)
	rcall findcahr
	std Y+2,r25
	std Y+1,r24
	ldi r24,0
	ldi r25,0
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.1"
.global __do_copy_data
