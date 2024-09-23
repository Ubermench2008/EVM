	.file	"lab3.c"
	.text
	.p2align 4
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	xorl	%eax, %eax
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	movl	88(%esp), %esi
	fldl	80(%esp)
	movl	92(%esp), %edi
	cmpl	%esi, %eax
	sbbl	%edi, %eax
	fstpl	32(%esp)
	jge	.L4
	addl	$1, %esi
	fldz
	adcl	$0, %edi
	movl	%esi, 40(%esp)
	movl	$1, %esi
	movl	%edi, 44(%esp)
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%esi, 16(%esp)
	addl	$1, %esi
	movl	%edi, 20(%esp)
	adcl	$0, %edi
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	fstpl	32(%esp)
	movl	%esi, 16(%esp)
	movl	%edi, 20(%esp)
	fildq	16(%esp)
	fstpl	(%esp)
	pushl	$-1074790400
	.cfi_def_cfa_offset 92
	pushl	$0
	.cfi_def_cfa_offset 96
	call	pow@PLT
	subl	$8, %esp
	.cfi_def_cfa_offset 104
	fstpl	32(%esp)
	fildq	40(%esp)
	fstl	(%esp)
	fstpl	40(%esp)
	pushl	60(%esp)
	.cfi_def_cfa_offset 108
	pushl	60(%esp)
	.cfi_def_cfa_offset 112
	call	pow@PLT
	fmull	40(%esp)
	fldl	48(%esp)
	fdivrp	%st, %st(1)
	fldl	56(%esp)
	movl	72(%esp), %eax
	addl	$32, %esp
	.cfi_def_cfa_offset 80
	movl	44(%esp), %edx
	movl	%eax, %ebp
	movl	%edx, %ecx
	faddp	%st, %st(1)
	xorl	%esi, %ebp
	xorl	%edi, %ecx
	orl	%ebp, %ecx
	jne	.L3
	addl	$60, %esp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	fldz
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
	.section	.text.startup,"ax",@progbits
	.p2align 4
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
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	addl	$-128, %esp
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	fopen@PLT
	addl	$16, %esp
	movl	%eax, -120(%ebp)
	testl	%eax, %eax
	je	.L31
	subl	$8, %esp
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	leal	-64(%ebp), %eax
	popl	%ecx
	popl	%esi
	pushl	%eax
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	leal	.LC7@GOTOFF(%ebx), %eax
	pushl	$2147483647
	pushl	$-1
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$32, %esp
	leal	.LC8@GOTOFF(%ebx), %eax
	pushl	$2147483647
	pushl	$-1
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	popl	%edi
	popl	%eax
	leal	-56(%ebp), %eax
	pushl	%eax
	leal	.LC9@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	fldl	-64(%ebp)
	addl	$16, %esp
	fld1
	fchs
	fcomip	%st(1), %st
	jnb	.L36
	fld1
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	ja	.L11
	xorl	%eax, %eax
	cmpl	-56(%ebp), %eax
	sbbl	-52(%ebp), %eax
	jge	.L32
	pushl	%eax
	leal	.LC14@GOTOFF(%ebx), %esi
	pushl	%eax
	leal	.LC13@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	movl	$0, -72(%ebp)
	movl	$0, -68(%ebp)
	call	__printf_chk@PLT
	popl	%eax
	leal	-72(%ebp), %eax
	popl	%edx
	pushl	%eax
	pushl	%esi
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	cmpl	$0, -72(%ebp)
	jle	.L33
	leal	.LC16@GOTOFF(%ebx), %eax
	pushl	%ecx
	pushl	%ecx
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	popl	%edi
	popl	%eax
	leal	-68(%ebp), %eax
	pushl	%eax
	pushl	%esi
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	cmpl	$0, -72(%ebp)
	jle	.L17
	leal	.LC20@GOTOFF(%ebx), %ecx
	movl	-68(%ebp), %eax
	movl	-56(%ebp), %esi
	movl	$0, -116(%ebp)
	movl	%ecx, -124(%ebp)
	leal	.LC21@GOTOFF(%ebx), %ecx
	movl	-52(%ebp), %edi
	movl	%ecx, -128(%ebp)
	.p2align 4,,10
	.p2align 3
.L21:
	movl	%eax, -80(%ebp)
	sarl	$31, %eax
	movl	$2147483647, %edx
	movl	%eax, -76(%ebp)
	movl	$-1, %eax
	subl	-80(%ebp), %eax
	sbbl	-76(%ebp), %edx
	cmpl	%esi, %eax
	movl	%edx, %eax
	sbbl	%edi, %eax
	jl	.L34
	subl	$8, %esp
	leal	-44(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-56(%ebp), %esi
	xorl	%eax, %eax
	fldl	-64(%ebp)
	movl	-52(%ebp), %edi
	addl	$16, %esp
	cmpl	%esi, %eax
	sbbl	%edi, %eax
	fstpl	-112(%ebp)
	jge	.L24
	addl	$1, %esi
	fldz
	adcl	$0, %edi
	movl	%esi, -88(%ebp)
	movl	$1, %esi
	movl	%edi, -84(%ebp)
	xorl	%edi, %edi
	fstpl	-80(%ebp)
	.p2align 4,,10
	.p2align 3
.L20:
	movl	%esi, -96(%ebp)
	addl	$1, %esi
	movl	%edi, -92(%ebp)
	adcl	$0, %edi
	subl	$8, %esp
	movl	%esi, -104(%ebp)
	movl	%edi, -100(%ebp)
	fildq	-104(%ebp)
	fstpl	(%esp)
	pushl	$-1074790400
	pushl	$0
	call	pow@PLT
	subl	$8, %esp
	fstpl	-104(%ebp)
	fildq	-96(%ebp)
	fstl	(%esp)
	pushl	-108(%ebp)
	pushl	-112(%ebp)
	fstpl	-96(%ebp)
	call	pow@PLT
	fmull	-104(%ebp)
	fldl	-96(%ebp)
	addl	$32, %esp
	movl	-88(%ebp), %edx
	movl	-84(%ebp), %eax
	fdivrp	%st, %st(1)
	xorl	%esi, %edx
	xorl	%edi, %eax
	orl	%edx, %eax
	faddl	-80(%ebp)
	fstpl	-80(%ebp)
	jne	.L20
.L19:
	subl	$8, %esp
	leal	-36(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-32(%ebp), %eax
	subl	-40(%ebp), %eax
	movl	%eax, -88(%ebp)
	movl	-36(%ebp), %eax
	subl	-44(%ebp), %eax
	fildl	-88(%ebp)
	fmull	.LC19@GOTOFF(%ebx)
	movl	-124(%ebp), %esi
	movl	%eax, -88(%ebp)
	fildl	-88(%ebp)
	popl	%eax
	popl	%edx
	pushl	-76(%ebp)
	pushl	-80(%ebp)
	faddp	%st, %st(1)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	%esi
	pushl	$1
	fstpl	-88(%ebp)
	call	__printf_chk@PLT
	addl	$32, %esp
	pushl	-84(%ebp)
	pushl	-88(%ebp)
	pushl	-128(%ebp)
	pushl	$1
	call	__printf_chk@PLT
	addl	$1, -116(%ebp)
	movl	-116(%ebp), %eax
	movl	-120(%ebp), %edi
	pushl	%eax
	leal	.LC22@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	pushl	%edi
	call	__fprintf_chk@PLT
	addl	$20, %esp
	leal	.LC23@GOTOFF(%ebx), %eax
	pushl	-52(%ebp)
	pushl	-56(%ebp)
	pushl	%eax
	pushl	$1
	pushl	%edi
	call	__fprintf_chk@PLT
	addl	$28, %esp
	pushl	-76(%ebp)
	pushl	-80(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	%esi
	pushl	$1
	pushl	%edi
	call	__fprintf_chk@PLT
	addl	$20, %esp
	leal	.LC24@GOTOFF(%ebx), %eax
	pushl	-84(%ebp)
	pushl	-88(%ebp)
	pushl	%eax
	pushl	$1
	pushl	%edi
	call	__fprintf_chk@PLT
	movl	-68(%ebp), %eax
	movl	-116(%ebp), %ecx
	movl	%eax, %edi
	movl	%eax, %esi
	sarl	$31, %edi
	addl	-56(%ebp), %esi
	adcl	-52(%ebp), %edi
	addl	$32, %esp
	movl	%esi, -56(%ebp)
	movl	%edi, -52(%ebp)
	cmpl	-72(%ebp), %ecx
	jl	.L21
.L17:
	subl	$12, %esp
	pushl	-120(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	xorl	%eax, %eax
	jmp	.L8
.L36:
	fstp	%st(0)
.L11:
	subl	$12, %esp
	leal	.LC11@GOTOFF(%ebx), %eax
.L30:
	pushl	%eax
	call	puts@PLT
.L29:
	popl	%eax
	pushl	-120(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$1, %eax
.L8:
	movl	-28(%ebp), %edx
	subl	%gs:20, %edx
	jne	.L35
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
.L24:
	.cfi_restore_state
	fldz
	fstpl	-80(%ebp)
	jmp	.L19
.L32:
	leal	.LC12@GOTOFF(%ebx), %eax
	pushl	$2147483647
	pushl	$-1
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	jmp	.L29
.L34:
	subl	$12, %esp
	leal	.LC17@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	leal	.LC18@GOTOFF(%ebx), %eax
	pushl	-120(%ebp)
	pushl	$32
	pushl	$1
	pushl	%eax
	call	fwrite@PLT
	addl	$32, %esp
	jmp	.L17
.L33:
	subl	$12, %esp
	leal	.LC15@GOTOFF(%ebx), %eax
	jmp	.L30
.L35:
	call	__stack_chk_fail_local
.L31:
	subl	$12, %esp
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L8
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
.LFB26:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE26:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
