	.file	"lab3.c"
	.text
	.p2align 4
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB23:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	xorl	%eax, %eax
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$48, %esp
	.cfi_def_cfa_offset 64
	movl	72(%esp), %esi
	fldl	64(%esp)
	movl	76(%esp), %edi
	cmpl	%esi, %eax
	sbbl	%edi, %eax
	fstpl	40(%esp)
	jge	.L4
	fld1
	addl	$1, %esi
	movl	$1, (%esp)
	fstpl	32(%esp)
	adcl	$0, %edi
	fldz
	movl	%esi, 16(%esp)
	movl	(%esp), %esi
	movl	%edi, 20(%esp)
	movl	$0, 4(%esp)
	movl	4(%esp), %edi
	fstpl	8(%esp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L10:
	movl	(%esp), %eax
	movl	4(%esp), %edx
	addl	$2, %eax
	adcl	$0, %edx
	movl	%eax, (%esp)
	subl	$8, %esp
	.cfi_def_cfa_offset 72
	movl	%edx, 12(%esp)
	fildq	8(%esp)
	fstpl	(%esp)
	pushl	$-1074790400
	.cfi_def_cfa_offset 76
	pushl	$0
	.cfi_def_cfa_offset 80
	call	pow@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	%esi, (%esp)
	movl	%edi, 4(%esp)
	fstpl	32(%esp)
.L3:
	fildq	(%esp)
	addl	$1, %esi
	adcl	$0, %edi
	subl	$8, %esp
	.cfi_def_cfa_offset 72
	fstl	(%esp)
	fstpl	32(%esp)
	pushl	52(%esp)
	.cfi_def_cfa_offset 76
	pushl	52(%esp)
	.cfi_def_cfa_offset 80
	call	pow@PLT
	fmull	48(%esp)
	fldl	40(%esp)
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	16(%esp), %edx
	movl	20(%esp), %eax
	fdivrp	%st, %st(1)
	xorl	%esi, %edx
	xorl	%edi, %eax
	orl	%edx, %eax
	faddl	8(%esp)
	fstpl	8(%esp)
	jne	.L10
	fldl	8(%esp)
	addl	$48, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	fldz
	fstpl	8(%esp)
	fldl	8(%esp)
	addl	$48, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE23:
	.size	ln1p_series, .-ln1p_series
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"a"
.LC4:
	.string	"out.txt"
.LC5:
	.string	"Error opening file!"
.LC6:
	.string	"x in (-1 < x <= 1): "
.LC7:
	.string	"%lf"
.LC8:
	.string	"max N: %lld\n"
.LC9:
	.string	"count N (maximum: %lld): "
.LC10:
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
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	fopen@PLT
	addl	$16, %esp
	movl	%eax, -132(%ebp)
	testl	%eax, %eax
	je	.L35
	subl	$8, %esp
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	leal	-64(%ebp), %eax
	popl	%ecx
	popl	%esi
	pushl	%eax
	leal	.LC7@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	leal	.LC8@GOTOFF(%ebx), %eax
	pushl	$2147483647
	pushl	$-1
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$32, %esp
	leal	.LC9@GOTOFF(%ebx), %eax
	pushl	$2147483647
	pushl	$-1
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	popl	%edi
	popl	%eax
	leal	-56(%ebp), %eax
	pushl	%eax
	leal	.LC10@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	fld1
	fldl	-64(%ebp)
	addl	$16, %esp
	fcomi	%st(1), %st
	fstp	%st(1)
	ja	.L41
	fld1
	fchs
	fcomip	%st(1), %st
	fstp	%st(0)
	jnb	.L27
	xorl	%eax, %eax
	cmpl	-56(%ebp), %eax
	sbbl	-52(%ebp), %eax
	jge	.L36
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
	jle	.L37
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
	jle	.L19
	leal	.LC20@GOTOFF(%ebx), %edi
	movl	-68(%ebp), %eax
	movl	-56(%ebp), %edx
	movl	$0, -124(%ebp)
	movl	%edi, -128(%ebp)
	leal	.LC21@GOTOFF(%ebx), %edi
	movl	-52(%ebp), %ecx
	movl	%edi, -136(%ebp)
	.p2align 4,,10
	.p2align 3
.L23:
	movl	%eax, -80(%ebp)
	sarl	$31, %eax
	movl	$-1, %esi
	movl	$2147483647, %edi
	movl	%eax, -76(%ebp)
	subl	-80(%ebp), %esi
	sbbl	-76(%ebp), %edi
	cmpl	%edx, %esi
	movl	%edi, %eax
	sbbl	%ecx, %eax
	jl	.L38
	subl	$8, %esp
	leal	-44(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-56(%ebp), %eax
	xorl	%ecx, %ecx
	fldl	-64(%ebp)
	movl	-52(%ebp), %edx
	addl	$16, %esp
	cmpl	%eax, %ecx
	sbbl	%edx, %ecx
	fstpl	-120(%ebp)
	jge	.L26
	fld1
	addl	$1, %eax
	movl	$1, -80(%ebp)
	movl	-80(%ebp), %esi
	fstpl	-112(%ebp)
	adcl	$0, %edx
	fldz
	movl	$0, -76(%ebp)
	movl	-76(%ebp), %edi
	movl	%eax, -96(%ebp)
	movl	%edx, -92(%ebp)
	fstpl	-88(%ebp)
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L39:
	movl	-80(%ebp), %eax
	movl	-76(%ebp), %edx
	addl	$2, %eax
	adcl	$0, %edx
	movl	%eax, -80(%ebp)
	subl	$8, %esp
	movl	%edx, -76(%ebp)
	fildq	-80(%ebp)
	fstpl	(%esp)
	pushl	$-1074790400
	pushl	$0
	call	pow@PLT
	movl	%esi, -80(%ebp)
	addl	$16, %esp
	movl	%edi, -76(%ebp)
	fstpl	-112(%ebp)
.L22:
	fildq	-80(%ebp)
	addl	$1, %esi
	adcl	$0, %edi
	subl	$8, %esp
	fstl	(%esp)
	pushl	-116(%ebp)
	pushl	-120(%ebp)
	fstpl	-104(%ebp)
	call	pow@PLT
	fmull	-112(%ebp)
	fldl	-104(%ebp)
	addl	$16, %esp
	movl	-96(%ebp), %edx
	movl	-92(%ebp), %eax
	fdivrp	%st, %st(1)
	xorl	%esi, %edx
	xorl	%edi, %eax
	orl	%edx, %eax
	faddl	-88(%ebp)
	fstpl	-88(%ebp)
	jne	.L39
.L21:
	subl	$8, %esp
	leal	-36(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-32(%ebp), %eax
	subl	-40(%ebp), %eax
	movl	%eax, -80(%ebp)
	movl	-36(%ebp), %eax
	subl	-44(%ebp), %eax
	fildl	-80(%ebp)
	movl	%eax, -80(%ebp)
	fmull	.LC19@GOTOFF(%ebx)
	fildl	-80(%ebp)
	popl	%eax
	popl	%edx
	pushl	-84(%ebp)
	pushl	-88(%ebp)
	faddp	%st, %st(1)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	-128(%ebp)
	pushl	$1
	fstpl	-80(%ebp)
	call	__printf_chk@PLT
	addl	$32, %esp
	pushl	-76(%ebp)
	pushl	-80(%ebp)
	pushl	-136(%ebp)
	pushl	$1
	call	__printf_chk@PLT
	movl	-132(%ebp), %esi
	addl	$1, -124(%ebp)
	leal	.LC22@GOTOFF(%ebx), %eax
	movl	-124(%ebp), %edi
	pushl	%edi
	pushl	%eax
	pushl	$1
	pushl	%esi
	call	__fprintf_chk@PLT
	addl	$20, %esp
	leal	.LC23@GOTOFF(%ebx), %eax
	pushl	-52(%ebp)
	pushl	-56(%ebp)
	pushl	%eax
	pushl	$1
	pushl	%esi
	call	__fprintf_chk@PLT
	addl	$28, %esp
	pushl	-84(%ebp)
	pushl	-88(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	-128(%ebp)
	pushl	$1
	pushl	%esi
	call	__fprintf_chk@PLT
	addl	$20, %esp
	leal	.LC24@GOTOFF(%ebx), %eax
	pushl	-76(%ebp)
	pushl	-80(%ebp)
	pushl	%eax
	pushl	$1
	pushl	%esi
	call	__fprintf_chk@PLT
	movl	-68(%ebp), %eax
	movl	%eax, %ecx
	movl	%eax, %edx
	sarl	$31, %ecx
	addl	-56(%ebp), %edx
	adcl	-52(%ebp), %ecx
	addl	$32, %esp
	movl	%edx, -56(%ebp)
	movl	%ecx, -52(%ebp)
	cmpl	-72(%ebp), %edi
	jl	.L23
.L19:
	subl	$12, %esp
	pushl	-132(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	xorl	%eax, %eax
	jmp	.L11
.L41:
	fstp	%st(0)
.L27:
	subl	$12, %esp
	leal	.LC11@GOTOFF(%ebx), %eax
.L34:
	pushl	%eax
	call	puts@PLT
.L33:
	popl	%eax
	pushl	-132(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$1, %eax
.L11:
	movl	-28(%ebp), %edx
	subl	%gs:20, %edx
	jne	.L40
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
.L26:
	.cfi_restore_state
	fldz
	fstpl	-88(%ebp)
	jmp	.L21
.L36:
	leal	.LC12@GOTOFF(%ebx), %eax
	pushl	$2147483647
	pushl	$-1
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	jmp	.L33
.L38:
	subl	$12, %esp
	leal	.LC17@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	leal	.LC18@GOTOFF(%ebx), %eax
	pushl	-132(%ebp)
	pushl	$32
	pushl	$1
	pushl	%eax
	call	fwrite@PLT
	addl	$32, %esp
	jmp	.L19
.L37:
	subl	$12, %esp
	leal	.LC15@GOTOFF(%ebx), %eax
	jmp	.L34
.L40:
	call	__stack_chk_fail_local
.L35:
	subl	$12, %esp
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L11
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
