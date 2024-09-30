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
	.section	.text.startup,"ax",@progbits
	.p2align 4
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
	pushl	%esi
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	call	__x86.get_pc_thunk.si
	addl	$_GLOBAL_OFFSET_TABLE_, %esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$68, %esp
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	leal	-56(%ebp), %eax
	pushl	%eax
	leal	.LC3@GOTOFF(%esi), %eax
	movl	%esi, %ebx
	pushl	%eax
	call	__isoc99_scanf@PLT
	popl	%eax
	leal	-44(%ebp), %eax
	popl	%edx
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-56(%ebp), %ecx
	xorl	%eax, %eax
	movl	-52(%ebp), %ebx
	addl	$16, %esp
	cmpl	%ecx, %eax
	sbbl	%ebx, %eax
	jge	.L5
	flds	.LC0@GOTOFF(%esi)
	addl	$1, %ecx
	movl	$1, %eax
	adcl	$0, %ebx
	movl	%ecx, -64(%ebp)
	xorl	%edx, %edx
	movl	%ebx, -60(%ebp)
	fld	%st(0)
	fld1
	fldz
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L10:
	fxch	%st(2)
	fxch	%st(1)
.L3:
	fld	%st(1)
	movl	-64(%ebp), %ecx
	movl	-60(%ebp), %ebx
	movl	%eax, -72(%ebp)
	fmul	%st(3), %st
	movl	%edx, -68(%ebp)
	fildq	-72(%ebp)
	addl	$1, %eax
	adcl	$0, %edx
	xorl	%eax, %ecx
	xorl	%edx, %ebx
	fdivrp	%st, %st(1)
	orl	%ebx, %ecx
	faddp	%st, %st(1)
	fxch	%st(1)
	fchs
	fxch	%st(2)
	fmul	%st(3), %st
	jne	.L10
	fstp	%st(0)
	fstp	%st(1)
	fstp	%st(1)
.L2:
	subl	$8, %esp
	leal	-36(%ebp), %eax
	movl	%esi, %ebx
	fstpl	-72(%ebp)
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	movl	-32(%ebp), %eax
	subl	-40(%ebp), %eax
	subl	$8, %esp
	movl	%eax, -64(%ebp)
	movl	-36(%ebp), %eax
	subl	-44(%ebp), %eax
	fildl	-64(%ebp)
	movl	%eax, -64(%ebp)
	fmull	.LC4@GOTOFF(%esi)
	leal	.LC5@GOTOFF(%esi), %eax
	fildl	-64(%ebp)
	faddp	%st, %st(1)
	fstpl	-64(%ebp)
	fldl	-72(%ebp)
	fstpl	(%esp)
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	fldl	-64(%ebp)
	addl	$24, %esp
	leal	.LC6@GOTOFF(%esi), %eax
	fstpl	(%esp)
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	addl	$16, %esp
	movl	-28(%ebp), %eax
	subl	%gs:20, %eax
	jne	.L9
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
	popl	%ecx
	.cfi_remember_state
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
.L5:
	.cfi_restore_state
	fldz
	jmp	.L2
.L9:
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
	.section	.text.__x86.get_pc_thunk.si,"axG",@progbits,__x86.get_pc_thunk.si,comdat
	.globl	__x86.get_pc_thunk.si
	.hidden	__x86.get_pc_thunk.si
	.type	__x86.get_pc_thunk.si, @function
__x86.get_pc_thunk.si:
.LFB24:
	.cfi_startproc
	movl	(%esp), %esi
	ret
	.cfi_endproc
.LFE24:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
