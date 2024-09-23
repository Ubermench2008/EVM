	.file	"lab3.c"
	.text
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	.cfi_offset 7, -12
	xorl	%edi, %edi
	pushl	%esi
	.cfi_offset 6, -16
	movl	$1, %esi
	pushl	%ebx
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$60, %esp
	fldl	8(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -52(%ebp)
	movl	20(%ebp), %eax
	fstpl	-48(%ebp)
	fldz
.L2:
	cmpl	%esi, -52(%ebp)
	movl	%eax, %ecx
	sbbl	%edi, %ecx
	jl	.L6
	movl	%eax, -56(%ebp)
	movl	%esi, %eax
	movl	%edi, %edx
	addl	$1, %eax
	fstpl	-72(%ebp)
	adcl	$0, %edx
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	fildq	-32(%ebp)
	pushl	%eax
	pushl	%eax
	fstpl	(%esp)
	pushl	$-1074790400
	pushl	$0
	call	pow@PLT
	movl	%esi, -64(%ebp)
	movl	%edi, -60(%ebp)
	pushl	%edx
	fstpl	-40(%ebp)
	fildq	-64(%ebp)
	pushl	%edx
	fstl	(%esp)
	pushl	-44(%ebp)
	pushl	-48(%ebp)
	fstpl	-64(%ebp)
	call	pow@PLT
	fmull	-40(%ebp)
	fldl	-64(%ebp)
	addl	$32, %esp
	movl	-32(%ebp), %esi
	movl	-28(%ebp), %edi
	movl	-56(%ebp), %eax
	fdivrp	%st, %st(1)
	fldl	-72(%ebp)
	faddp	%st, %st(1)
	jmp	.L2
.L6:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
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
.LC13:
	.string	"Enter how many times the program should run: "
.LC14:
	.string	"%d"
.LC15:
	.string	"Error: The number of runs should be a positive integer."
.LC16:
	.string	"Should it increase N? If yes, enter the number by which to increase the parameter N. If not, enter 0: "
.LC17:
	.string	"Error: N exceeds maximum limit."
.LC18:
	.string	"Error: N exceeds maximum limit.\n"
.LC20:
	.string	"RES: ln(1 + %0.10lf) \342\211\210 %0.10lf\n"
.LC21:
	.string	"TIME: %0.10lf sec\n"
.LC22:
	.string	"Run %d:\n"
.LC23:
	.string	"N = %lld\n"
.LC24:
	.string	"TIME: ~~~~~~~~~~[[%0.10lf sec]]~~~~~~~~~~\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB14:
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
	subl	$96, %esp
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	fopen@PLT
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L8
	subl	$12, %esp
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	jmp	.L23
.L8:
	movl	%eax, %esi
	pushl	%eax
	pushl	%eax
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	popl	%eax
	leal	-64(%ebp), %eax
	popl	%edx
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
	leal	-56(%ebp), %eax
	popl	%ecx
	popl	%edi
	pushl	%eax
	leal	.LC9@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	fldl	-64(%ebp)
	addl	$16, %esp
	fld1
	fchs
	fcomip	%st(1), %st
	jnb	.L25
	fld1
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L20
	jmp	.L10
.L25:
	fstp	%st(0)
.L10:
	subl	$12, %esp
	leal	.LC11@GOTOFF(%ebx), %eax
	jmp	.L24
.L20:
	xorl	%eax, %eax
	cmpl	-56(%ebp), %eax
	sbbl	-52(%ebp), %eax
	jl	.L13
	leal	.LC12@GOTOFF(%ebx), %eax
	pushl	$2147483647
	pushl	$-1
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	jmp	.L22
.L13:
	leal	.LC13@GOTOFF(%ebx), %eax
	pushl	%ecx
	pushl	%ecx
	pushl	%eax
	pushl	$1
	movl	$0, -72(%ebp)
	movl	$0, -68(%ebp)
	call	__printf_chk@PLT
	popl	%edi
	leal	.LC14@GOTOFF(%ebx), %edi
	popl	%eax
	leal	-72(%ebp), %eax
	pushl	%eax
	pushl	%edi
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	cmpl	$0, -72(%ebp)
	jg	.L14
	subl	$12, %esp
	leal	.LC15@GOTOFF(%ebx), %eax
.L24:
	pushl	%eax
	call	puts@PLT
.L22:
	movl	%esi, (%esp)
	call	fclose@PLT
.L23:
	addl	$16, %esp
	movl	$1, %eax
	jmp	.L7
.L14:
	pushl	%eax
	pushl	%eax
	leal	.LC16@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	call	__printf_chk@PLT
	popl	%eax
	leal	-68(%ebp), %eax
	popl	%edx
	pushl	%eax
	pushl	%edi
	xorl	%edi, %edi
	call	__isoc99_scanf@PLT
	leal	.LC20@GOTOFF(%ebx), %eax
	addl	$16, %esp
	movl	%eax, -92(%ebp)
	leal	.LC21@GOTOFF(%ebx), %eax
	movl	%eax, -96(%ebp)
.L15:
	cmpl	%edi, -72(%ebp)
	jle	.L17
	movl	-68(%ebp), %ecx
	orl	$-1, %eax
	movl	$2147483647, %edx
	movl	%ecx, -80(%ebp)
	sarl	$31, %ecx
	subl	-80(%ebp), %eax
	movl	%ecx, -76(%ebp)
	sbbl	-76(%ebp), %edx
	cmpl	-56(%ebp), %eax
	movl	%edx, %eax
	sbbl	-52(%ebp), %eax
	jge	.L16
	subl	$12, %esp
	leal	.LC17@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	popl	%edi
	popl	%eax
	leal	.LC18@GOTOFF(%ebx), %eax
	pushl	%esi
	pushl	%eax
	call	fputs@PLT
	addl	$16, %esp
	jmp	.L17
.L16:
	pushl	%eax
	incl	%edi
	pushl	%eax
	leal	-44(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime@PLT
	pushl	-52(%ebp)
	pushl	-56(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	call	ln1p_series
	addl	$24, %esp
	leal	-36(%ebp), %eax
	pushl	%eax
	pushl	$4
	fstpl	-80(%ebp)
	call	clock_gettime@PLT
	fldl	.LC19@GOTOFF(%ebx)
	movl	-32(%ebp), %eax
	subl	-40(%ebp), %eax
	popl	%edx
	movl	%eax, -88(%ebp)
	movl	-36(%ebp), %eax
	subl	-44(%ebp), %eax
	popl	%ecx
	pushl	-76(%ebp)
	fimull	-88(%ebp)
	movl	%eax, -88(%ebp)
	fiaddl	-88(%ebp)
	pushl	-80(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	-92(%ebp)
	pushl	$1
	fstpl	-88(%ebp)
	call	__printf_chk@PLT
	addl	$32, %esp
	pushl	-84(%ebp)
	pushl	-88(%ebp)
	pushl	-96(%ebp)
	pushl	$1
	call	__printf_chk@PLT
	leal	.LC22@GOTOFF(%ebx), %eax
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
	pushl	-76(%ebp)
	pushl	-80(%ebp)
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	-92(%ebp)
	pushl	$1
	pushl	%esi
	call	__fprintf_chk@PLT
	addl	$20, %esp
	leal	.LC24@GOTOFF(%ebx), %eax
	pushl	-84(%ebp)
	pushl	-88(%ebp)
	pushl	%eax
	pushl	$1
	pushl	%esi
	call	__fprintf_chk@PLT
	movl	-68(%ebp), %eax
	cltd
	addl	%eax, -56(%ebp)
	adcl	%edx, -52(%ebp)
	addl	$32, %esp
	jmp	.L15
.L17:
	subl	$12, %esp
	pushl	%esi
	call	fclose@PLT
	addl	$16, %esp
	xorl	%eax, %eax
.L7:
	movl	-28(%ebp), %edx
	subl	%gs:20, %edx
	je	.L19
	call	__stack_chk_fail_local
.L19:
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
.LFE14:
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
.LFB15:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE15:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
