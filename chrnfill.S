	.file	"chrnfill.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	strnfill
	.type	strnfill, @function
strnfill:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,7
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 7 */
/* stack size = 9 */
.L__stack_usage = 9
	std Y+4,r25
	std Y+3,r24
	std Y+5,r22
	std Y+7,r21
	std Y+6,r20
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	rjmp .L2
.L3:
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	ldd r18,Y+5
	mov r30,r24
	mov r31,r25
	st Z,r18
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r24,1
	std Y+2,r25
	std Y+1,r24
.L2:
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r24,Y+6
	ldd r25,Y+7
	cp r24,r18
	cpc r25,r19
	brge .L3
	ldd r24,Y+1
	ldd r25,Y+2
/* epilogue start */
	adiw r28,7
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	strnfill, .-strnfill
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,124
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 124 */
/* stack size = 126 */
.L__stack_usage = 126
	ldi r20,lo8(80)
	ldi r21,0
	ldi r22,lo8(42)
	mov r24,r28
	mov r25,r29
	adiw r24,1
	rcall strnfill
	mov r24,r28
	mov r25,r29
	subi r24,-81
	sbci r25,-1
	mov r30,r24
	mov r31,r25
	st Z,__zero_reg__
	ldi r24,0
	ldi r25,0
/* epilogue start */
	subi r28,-124
	sbci r29,-1
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
