	.file	"lab3.c"
	.text
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	fldl	80(%esp)
	fstpl	40(%esp)
	movl	88(%esp), %eax
	movl	%eax, 36(%esp)
	movl	92(%esp), %ebp
	movl	$1, 8(%esp)
	movl	$0, 12(%esp)
	fldz
	fstpl	16(%esp)
	jmp	.L2
.L3:
	movl	8(%esp), %esi
	movl	12(%esp), %edi
	addl	$1, %esi
	adcl	$0, %edi
	movl	%esi, 24(%esp)
	movl	%edi, 28(%esp)
	fildq	24(%esp)
	leal	-8(%esp), %esp
	.cfi_def_cfa_offset 88
	fstpl	(%esp)
	pushl	$-1074790400
	.cfi_def_cfa_offset 92
	pushl	$0
	.cfi_def_cfa_offset 96
	call	pow@PLT
	fstpl	40(%esp)
	fildq	24(%esp)
	fstl	24(%esp)
	leal	-8(%esp), %esp
	.cfi_def_cfa_offset 104
	fstpl	(%esp)
	pushl	68(%esp)
	.cfi_def_cfa_offset 108
	pushl	68(%esp)
	.cfi_def_cfa_offset 112
	call	pow@PLT
	fmull	56(%esp)
	fdivl	40(%esp)
	faddl	48(%esp)
	fstpl	48(%esp)
	addl	$32, %esp
	.cfi_def_cfa_offset 80
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
.L2:
	movl	8(%esp), %eax
	movl	12(%esp), %edx
	cmpl	%eax, 36(%esp)
	movl	%ebp, %ecx
	sbbl	%edx, %ecx
	jge	.L3
	fldl	16(%esp)
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE23:
	.size	ln1p_series, .-ln1p_series
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"a"
.LC3:
	.string	"out.txt"
.LC4:
	.string	"Error opening file!"
.LC5:
	.string	"x in (-1 < x <= 1): "
.LC6:
	.string	"%lf"
.LC7:
	.string	"max N: %lld\n"
.LC8:
	.string	"count N (maximum: %lld): "
.LC9:
	.string	"%lld"
.LC11:
	.string	"error. x in (-1, 1]."
.LC12:
	.string	"error. n <= %lld.\n"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC13:
	.string	"Enter how many times the program should run: "
	.section	.rodata.str1.1
.LC14:
	.string	"%d"
	.section	.rodata.str1.4
	.align 4
.LC15:
	.string	"Error: The number of runs should be a positive integer."
	.align 4
.LC16:
	.string	"Should it increase N? If yes, enter the number by which to increase the parameter N. If not, enter 0: "
	.align 4
.LC17:
	.string	"Error: N exceeds maximum limit."
	.align 4
.LC18:
	.string	"Error: N exceeds maximum limit.\n"
	.align 4
.LC20:
	.string	"RES: ln(1 + %0.10lf) \342\211\210 %0.10lf\n"
	.section	.rodata.str1.1
.LC21:
	.string	"TIME: %0.10lf sec\n"
.LC22:
	.string	"Run %d:\n"
.LC23:
	.string	"N = %lld\n"
	.section	.rodata.str1.4
	.align 4
.LC24:
	.string	"TIME: ~~~~~~~~~~[[%0.10lf sec]]~~~~~~~~~~\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	subl	$96, %esp
	call	__x86.get_pc_thunk.si
	addl	$_GLOBAL_OFFSET_TABLE_, %esi
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	leal	.LC2@GOTOFF(%esi), %eax
	pushl	%eax
	leal	.LC3@GOTOFF(%esi), %eax
	pushl	%eax
	movl	%esi, %ebx
	call	fopen@PLT
	addl	$16, %esp
	testl	%eax, %eax
	je	.L20
	movl	%eax, %edi
	subl	$8, %esp
	leal	.LC5@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$8, %esp
	leal	-64(%ebp), %eax
	pushl	%eax
	leal	.LC6@GOTOFF(%esi), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	pushl	$2147483647
	pushl	$-1
	leal	.LC7@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$32, %esp
	pushl	$2147483647
	pushl	$-1
	leal	.LC8@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$8, %esp
	leal	-56(%ebp), %eax
	pushl	%eax
	leal	.LC9@GOTOFF(%esi), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	fldl	-64(%ebp)
	addl	$16, %esp
	fld1
	fchs
	fcomip	%st(1), %st
	jnb	.L24
	fld1
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	ja	.L8
	movl	$0, %eax
	cmpl	-56(%ebp), %eax
	sbbl	-52(%ebp), %eax
	jge	.L21
	movl	$0, -72(%ebp)
	movl	$0, -68(%ebp)
	subl	$8, %esp
	leal	.LC13@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$8, %esp
	leal	-72(%ebp), %eax
	pushl	%eax
	leal	.LC14@GOTOFF(%esi), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	cmpl	$0, -72(%ebp)
	jle	.L22
	subl	$8, %esp
	leal	.LC16@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$8, %esp
	leal	-68(%ebp), %eax
	pushl	%eax
	leal	.LC14@GOTOFF(%esi), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	movl	$0, -76(%ebp)
	jmp	.L13
.L20:
	subl	$12, %esp
	leal	.LC4@GOTOFF(%esi), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L5
.L24:
	fstp	%st(0)
.L8:
	subl	$12, %esp
	leal	.LC11@GOTOFF(%esi), %eax
	pushl	%eax
	movl	%esi, %ebx
	call	puts@PLT
	movl	%edi, (%esp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$1, %eax
.L5:
	movl	-28(%ebp), %edx
	subl	%gs:20, %edx
	jne	.L23
	leal	-16(%ebp), %esp
	popl	%ecx
	.cfi_remember_state
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
.L21:
	.cfi_restore_state
	pushl	$2147483647
	pushl	$-1
	leal	.LC12@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	movl	%edi, (%esp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L5
.L22:
	subl	$12, %esp
	leal	.LC15@GOTOFF(%esi), %eax
	pushl	%eax
	call	puts@PLT
	movl	%edi, (%esp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L5
.L14:
	subl	$8, %esp
	leal	-44(%ebp), %eax
	pushl	%eax
	pushl	$4
	movl	%esi, %ebx
	call	clock_gettime@PLT
	pushl	-52(%ebp)
	pushl	-56(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	call	ln1p_series
	fstpl	-88(%ebp)
	addl	$24, %esp
	leal	-36(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-36(%ebp), %eax
	subl	-44(%ebp), %eax
	movl	%eax, -96(%ebp)
	fildl	-96(%ebp)
	movl	-32(%ebp), %eax
	subl	-40(%ebp), %eax
	movl	%eax, -96(%ebp)
	fildl	-96(%ebp)
	fmull	.LC19@GOTOFF(%esi)
	faddp	%st, %st(1)
	fstpl	-96(%ebp)
	addl	$8, %esp
	pushl	-84(%ebp)
	pushl	-88(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	leal	.LC20@GOTOFF(%esi), %eax
	movl	%eax, -80(%ebp)
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$32, %esp
	pushl	-92(%ebp)
	pushl	-96(%ebp)
	leal	.LC21@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$1, -76(%ebp)
	movl	-76(%ebp), %eax
	pushl	%eax
	leal	.LC22@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	pushl	%edi
	call	__fprintf_chk@PLT
	addl	$20, %esp
	pushl	-52(%ebp)
	pushl	-56(%ebp)
	leal	.LC23@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	pushl	%edi
	call	__fprintf_chk@PLT
	addl	$28, %esp
	pushl	-84(%ebp)
	pushl	-88(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	-80(%ebp)
	pushl	$1
	pushl	%edi
	call	__fprintf_chk@PLT
	addl	$20, %esp
	pushl	-92(%ebp)
	pushl	-96(%ebp)
	leal	.LC24@GOTOFF(%esi), %eax
	pushl	%eax
	pushl	$1
	pushl	%edi
	call	__fprintf_chk@PLT
	movl	-68(%ebp), %eax
	cltd
	addl	%eax, -56(%ebp)
	adcl	%edx, -52(%ebp)
	addl	$32, %esp
.L13:
	movl	-76(%ebp), %eax
	cmpl	%eax, -72(%ebp)
	jle	.L15
	movl	-68(%ebp), %ecx
	movl	%ecx, %ebx
	sarl	$31, %ebx
	movl	$-1, %eax
	movl	$2147483647, %edx
	subl	%ecx, %eax
	sbbl	%ebx, %edx
	cmpl	-56(%ebp), %eax
	movl	%edx, %eax
	sbbl	-52(%ebp), %eax
	jge	.L14
	subl	$12, %esp
	leal	.LC17@GOTOFF(%esi), %eax
	pushl	%eax
	movl	%esi, %ebx
	call	puts@PLT
	pushl	%edi
	pushl	$32
	pushl	$1
	leal	.LC18@GOTOFF(%esi), %eax
	pushl	%eax
	call	fwrite@PLT
	addl	$32, %esp
.L15:
	subl	$12, %esp
	pushl	%edi
	movl	%esi, %ebx
	call	fclose@PLT
	addl	$16, %esp
	movl	$0, %eax
	jmp	.L5
.L23:
	call	__stack_chk_fail_local
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC19:
	.long	-400107883
	.long	1041313291
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB25:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE25:
	.section	.text.__x86.get_pc_thunk.si,"axG",@progbits,__x86.get_pc_thunk.si,comdat
	.globl	__x86.get_pc_thunk.si
	.hidden	__x86.get_pc_thunk.si
	.type	__x86.get_pc_thunk.si, @function
__x86.get_pc_thunk.si:
.LFB26:
	.cfi_startproc
	movl	(%esp), %esi
	ret
	.cfi_endproc
.LFE26:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
