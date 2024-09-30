	.file	"lab3.c"
	.text
	.section	.rodata
.LC0:
	.string	"%lld"
	.align 4
.LC5:
	.string	"\320\227\320\275\320\260\321\207\320\265\320\275\320\270\320\265 ln(1 + x): %lf\n"
	.align 4
.LC6:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\262\321\213\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217: %lf \321\201\320\265\320\272\321\203\320\275\320\264\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$96, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	subl	$8, %esp
	leal	-88(%ebp), %eax
	pushl	%eax
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	fldl	.LC1@GOTOFF(%ebx)
	fstpl	-48(%ebp)
	fldz
	fstpl	-80(%ebp)
	fld1
	fstpl	-72(%ebp)
	fldl	-48(%ebp)
	fstpl	-64(%ebp)
	subl	$8, %esp
	leal	-28(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	addl	$16, %esp
	movl	$1, -56(%ebp)
	movl	$0, -52(%ebp)
	jmp	.L2
.L3:
	fldl	-72(%ebp)
	fmull	-64(%ebp)
	fildq	-56(%ebp)
	fdivrp	%st, %st(1)
	fldl	-80(%ebp)
	faddp	%st, %st(1)
	fstpl	-80(%ebp)
	fldl	-72(%ebp)
	fchs
	fstpl	-72(%ebp)
	fldl	-64(%ebp)
	fmull	-48(%ebp)
	fstpl	-64(%ebp)
	addl	$1, -56(%ebp)
	adcl	$0, -52(%ebp)
.L2:
	movl	-88(%ebp), %eax
	movl	-84(%ebp), %edx
	cmpl	-56(%ebp), %eax
	movl	%edx, %eax
	sbbl	-52(%ebp), %eax
	jge	.L3
	subl	$8, %esp
	leal	-20(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	addl	$16, %esp
	movl	-20(%ebp), %eax
	movl	-28(%ebp), %edx
	subl	%edx, %eax
	movl	%eax, -92(%ebp)
	fildl	-92(%ebp)
	movl	-16(%ebp), %eax
	movl	-24(%ebp), %edx
	subl	%edx, %eax
	movl	%eax, -92(%ebp)
	fildl	-92(%ebp)
	fldl	.LC4@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fstpl	-40(%ebp)
	subl	$4, %esp
	pushl	-76(%ebp)
	pushl	-80(%ebp)
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$4, %esp
	pushl	-36(%ebp)
	pushl	-40(%ebp)
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	$0, %eax
	movl	-12(%ebp), %edx
	subl	%gs:20, %edx
	je	.L5
	call	__stack_chk_fail_local
.L5:
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC4:
	.long	-400107883
	.long	1041313291
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB1:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE1:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
