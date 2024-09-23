	.file	"lab3.c"
	.text
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	8(%ebp), %eax
	movl	%eax, -48(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -44(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -56(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -52(%ebp)
	fldz
	fstpl	-32(%ebp)
	movl	$1, -24(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L2
.L3:
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	addl	$1, %eax
	adcl	$0, %edx
	movl	%eax, -64(%ebp)
	movl	%edx, -60(%ebp)
	fildq	-64(%ebp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	fld1
	fchs
	leal	-8(%esp), %esp
	fstpl	(%esp)
	call	pow@PLT
	addl	$16, %esp
	fstpl	-64(%ebp)
	fildq	-24(%ebp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	-44(%ebp)
	pushl	-48(%ebp)
	call	pow@PLT
	addl	$16, %esp
	fldl	-64(%ebp)
	fmulp	%st, %st(1)
	fildq	-24(%ebp)
	fdivrp	%st, %st(1)
	fstpl	-16(%ebp)
	fldl	-32(%ebp)
	faddl	-16(%ebp)
	fstpl	-32(%ebp)
	addl	$1, -24(%ebp)
	adcl	$0, -20(%ebp)
.L2:
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	-52(%ebp), %ecx
	cmpl	%eax, -56(%ebp)
	sbbl	%edx, %ecx
	jge	.L3
	fldl	-32(%ebp)
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	ln1p_series, .-ln1p_series
	.section	.rodata
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
	.align 4
.LC13:
	.string	"Enter how many times the program should run: "
.LC14:
	.string	"%d"
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
.LC21:
	.string	"TIME: %0.10lf sec\n"
.LC22:
	.string	"Run %d:\n"
.LC23:
	.string	"N = %lld\n"
	.align 4
.LC24:
	.string	"TIME: ~~~~~~~~~~[[%0.10lf sec]]~~~~~~~~~~\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
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
	subl	$104, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	subl	$8, %esp
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	fopen@PLT
	addl	$16, %esp
	movl	%eax, -84(%ebp)
	cmpl	$0, -84(%ebp)
	jne	.L6
	subl	$12, %esp
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L17
.L6:
	subl	$12, %esp
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$8, %esp
	leal	-80(%ebp), %eax
	pushl	%eax
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	subl	$4, %esp
	pushl	$2147483647
	pushl	$-1
	leal	.LC7@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$4, %esp
	pushl	$2147483647
	pushl	$-1
	leal	.LC8@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$8, %esp
	leal	-72(%ebp), %eax
	pushl	%eax
	leal	.LC9@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	fldl	-80(%ebp)
	fld1
	fchs
	fcomip	%st(1), %st
	fstp	%st(0)
	jnb	.L8
	fld1
	fldl	-80(%ebp)
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L19
.L8:
	subl	$12, %esp
	leal	.LC11@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	-84(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L17
.L19:
	movl	-72(%ebp), %eax
	movl	-68(%ebp), %edx
	movl	$0, %esi
	movl	$0, %ecx
	cmpl	%eax, %esi
	sbbl	%edx, %ecx
	jl	.L11
	subl	$4, %esp
	pushl	$2147483647
	pushl	$-1
	leal	.LC12@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	-84(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L17
.L11:
	movl	$0, -96(%ebp)
	movl	$0, -92(%ebp)
	subl	$12, %esp
	leal	.LC13@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$8, %esp
	leal	-96(%ebp), %eax
	pushl	%eax
	leal	.LC14@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	movl	-96(%ebp), %eax
	testl	%eax, %eax
	jg	.L12
	subl	$12, %esp
	leal	.LC15@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	-84(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L17
.L12:
	subl	$12, %esp
	leal	.LC16@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$8, %esp
	leal	-92(%ebp), %eax
	pushl	%eax
	leal	.LC14@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	movl	$0, -88(%ebp)
	jmp	.L13
.L16:
	movl	-92(%ebp), %eax
	movl	%eax, %esi
	movl	%eax, %edi
	sarl	$31, %edi
	movl	$-1, %eax
	movl	$2147483647, %edx
	subl	%esi, %eax
	sbbl	%edi, %edx
	movl	-72(%ebp), %esi
	movl	-68(%ebp), %edi
	cmpl	%esi, %eax
	movl	%edx, %eax
	sbbl	%edi, %eax
	jge	.L14
	subl	$12, %esp
	leal	.LC17@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	pushl	-84(%ebp)
	pushl	$32
	pushl	$1
	leal	.LC18@GOTOFF(%ebx), %eax
	pushl	%eax
	call	fwrite@PLT
	addl	$16, %esp
	jmp	.L15
.L14:
	subl	$8, %esp
	leal	-44(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	addl	$16, %esp
	movl	-72(%ebp), %eax
	movl	-68(%ebp), %edx
	fldl	-80(%ebp)
	pushl	%edx
	pushl	%eax
	leal	-8(%esp), %esp
	fstpl	(%esp)
	call	ln1p_series
	addl	$16, %esp
	fstpl	-64(%ebp)
	subl	$8, %esp
	leal	-36(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	addl	$16, %esp
	movl	-36(%ebp), %eax
	movl	-44(%ebp), %edx
	subl	%edx, %eax
	movl	%eax, -108(%ebp)
	fildl	-108(%ebp)
	movl	-32(%ebp), %eax
	movl	-40(%ebp), %edx
	subl	%edx, %eax
	movl	%eax, -108(%ebp)
	fildl	-108(%ebp)
	fldl	.LC19@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fstpl	-56(%ebp)
	fldl	-80(%ebp)
	subl	$12, %esp
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC20@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$32, %esp
	subl	$4, %esp
	pushl	-52(%ebp)
	pushl	-56(%ebp)
	leal	.LC21@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-88(%ebp), %eax
	addl	$1, %eax
	subl	$4, %esp
	pushl	%eax
	leal	.LC22@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	-84(%ebp)
	call	fprintf@PLT
	addl	$16, %esp
	movl	-72(%ebp), %eax
	movl	-68(%ebp), %edx
	pushl	%edx
	pushl	%eax
	leal	.LC23@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	-84(%ebp)
	call	fprintf@PLT
	addl	$16, %esp
	fldl	-80(%ebp)
	subl	$8, %esp
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC20@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	-84(%ebp)
	call	fprintf@PLT
	addl	$32, %esp
	pushl	-52(%ebp)
	pushl	-56(%ebp)
	leal	.LC24@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	-84(%ebp)
	call	fprintf@PLT
	addl	$16, %esp
	movl	-92(%ebp), %eax
	movl	%eax, %esi
	movl	%eax, %edi
	sarl	$31, %edi
	movl	-72(%ebp), %eax
	movl	-68(%ebp), %edx
	addl	%esi, %eax
	adcl	%edi, %edx
	movl	%eax, -72(%ebp)
	movl	%edx, -68(%ebp)
	addl	$1, -88(%ebp)
.L13:
	movl	-96(%ebp), %eax
	cmpl	%eax, -88(%ebp)
	jl	.L16
.L15:
	subl	$12, %esp
	pushl	-84(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$0, %eax
.L17:
	movl	-28(%ebp), %edx
	subl	%gs:20, %edx
	je	.L18
	call	__stack_chk_fail_local
.L18:
	leal	-16(%ebp), %esp
	popl	%ecx
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
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC19:
	.long	-400107883
	.long	1041313291
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB2:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE2:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
