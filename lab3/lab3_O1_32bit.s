	.file	"lab3.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%lld"
	.section	.rodata.str1.4,"aMS",@progbits,1
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
.LFB23:
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
	subl	$80, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	leal	-56(%ebp), %eax
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$8, %esp
	leal	-44(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-56(%ebp), %esi
	movl	-52(%ebp), %edi
	addl	$16, %esp
	movl	$0, %eax
	cmpl	%esi, %eax
	sbbl	%edi, %eax
	jge	.L5
	addl	$1, %esi
	adcl	$0, %edi
	movl	%esi, -80(%ebp)
	movl	%edi, -76(%ebp)
	movl	$1, %eax
	movl	$0, %edx
	flds	.LC0@GOTOFF(%ebx)
	fld1
	fldz
	fstpl	-64(%ebp)
	flds	.LC0@GOTOFF(%ebx)
	jmp	.L3
.L9:
	fxch	%st(2)
	fxch	%st(1)
.L3:
	fld	%st(1)
	fmul	%st(3), %st
	movl	%eax, -72(%ebp)
	movl	%edx, -68(%ebp)
	fildq	-72(%ebp)
	fdivrp	%st, %st(1)
	faddl	-64(%ebp)
	fstpl	-64(%ebp)
	fxch	%st(1)
	fchs
	fxch	%st(2)
	fmul	%st(1), %st
	addl	$1, %eax
	adcl	$0, %edx
	movl	-80(%ebp), %esi
	movl	-76(%ebp), %edi
	movl	%esi, %ecx
	xorl	%eax, %ecx
	movl	%edi, %esi
	xorl	%edx, %esi
	orl	%esi, %ecx
	jne	.L9
	fstp	%st(0)
	fstp	%st(0)
	fstp	%st(0)
.L2:
	subl	$8, %esp
	leal	-36(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-32(%ebp), %eax
	subl	-40(%ebp), %eax
	movl	%eax, -72(%ebp)
	fildl	-72(%ebp)
	fmull	.LC4@GOTOFF(%ebx)
	movl	-36(%ebp), %eax
	subl	-44(%ebp), %eax
	movl	%eax, -72(%ebp)
	fildl	-72(%ebp)
	faddp	%st, %st(1)
	fstpl	-72(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$32, %esp
	pushl	-68(%ebp)
	pushl	-72(%ebp)
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$16, %esp
	movl	-28(%ebp), %eax
	subl	%gs:20, %eax
	jne	.L8
	movl	$0, %eax
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
.L5:
	.cfi_restore_state
	fldz
	fstpl	-64(%ebp)
	jmp	.L2
.L8:
	call	__stack_chk_fail_local
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1056964608
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	-400107883
	.long	1041313291
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB24:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE24:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
