	.file	"strcat.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	strslen
	.type	strslen, @function
strslen:
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
	brne .L3
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
	.size	strslen, .-strslen
.global	strcats
	.type	strcats, @function
strcats:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 8 */
/* stack size = 10 */
.L__stack_usage = 10
	std Y+6,r25
	std Y+5,r24
	std Y+8,r23
	std Y+7,r22
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	ldd r24,Y+5
	ldd r25,Y+6
	rcall strslen
	ldd r18,Y+5
	ldd r19,Y+6
	add r24,r18
	adc r25,r19
	std Y+4,r25
	std Y+3,r24
	rjmp .L6
.L7:
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+7
	ldd r21,Y+8
	add r18,r20
	adc r19,r21
	mov r30,r18
	mov r31,r19
	ld r18,Z
	mov r30,r24
	mov r31,r25
	st Z,r18
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r24,1
	std Y+2,r25
	std Y+1,r24
.L6:
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+7
	ldd r19,Y+8
	add r24,r18
	adc r25,r19
	mov r30,r24
	mov r31,r25
	ld r24,Z
	tst r24
	brne .L7
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	add r24,r18
	adc r25,r19
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+7
	ldd r21,Y+8
	add r18,r20
	adc r19,r21
	mov r30,r18
	mov r31,r19
	ld r18,Z
	mov r30,r24
	mov r31,r25
	st Z,r18
	ldd r24,Y+1
	ldd r25,Y+2
/* epilogue start */
	adiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	strcats, .-strcats
	.section	.rodata
.LC1:
	.string	"world\n"
.LC0:
	.string	"hello "
	.zero	43
	.text
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,52
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 52 */
/* stack size = 54 */
.L__stack_usage = 54
	ldi r24,lo8(7)
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
	ldi r18,lo8(43)
	mov r24,r28
	mov r25,r29
	adiw r24,10
	mov r30,r24
	mov r31,r25
	mov r19,r18
	0:
	st Z+,__zero_reg__
	dec r19
	brne 0b
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	std Y+2,r25
	std Y+1,r24
	ldd r18,Y+1
	ldd r19,Y+2
	mov r24,r28
	mov r25,r29
	adiw r24,3
	mov r22,r18
	mov r23,r19
	rcall strcats
	ldi r24,0
	ldi r25,0
/* epilogue start */
	adiw r28,52
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
