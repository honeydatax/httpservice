	.file	"strncopy.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	strncopy
	.type	strncopy, @function
strncopy:
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
	std Y+4,r25
	std Y+3,r24
	std Y+6,r23
	std Y+5,r22
	std Y+8,r21
	std Y+7,r20
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
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+5
	ldd r21,Y+6
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
.L2:
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r24,Y+7
	ldd r25,Y+8
	cp r24,r18
	cpc r25,r19
	brge .L3
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
	.size	strncopy, .-strncopy
	.section	.rodata
.LC0:
	.string	"hello world\n"
	.text
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,2
	sbci r29,4
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 1026 */
/* stack size = 1028 */
.L__stack_usage = 1028
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	std Y+2,r25
	std Y+1,r24
	ldd r18,Y+1
	ldd r19,Y+2
	mov r24,r28
	mov r25,r29
	adiw r24,3
	ldi r20,lo8(5)
	ldi r21,0
	mov r22,r18
	mov r23,r19
	rcall strncopy
	std Y+8,__zero_reg__
	ldi r24,0
	ldi r25,0
/* epilogue start */
	subi r28,-2
	sbci r29,-5
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
