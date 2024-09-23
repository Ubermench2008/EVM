	.file	"lab3.c"
	.text
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorps	%xmm2, %xmm2
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%xmm0, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$1, %ebx
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
.L2:
	cmpq	%rbp, %rbx
	jg	.L6
	leaq	1(%rbx), %r13
	movq	.LC1(%rip), %rax
	movsd	%xmm2, 24(%rsp)
	cvtsi2sdq	%r13, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	cvtsi2sdq	%rbx, %xmm1
	movq	%r13, %rbx
	movsd	%xmm0, 8(%rsp)
	movq	%r12, %xmm0
	movsd	%xmm1, 16(%rsp)
	call	pow@PLT
	mulsd	8(%rsp), %xmm0
	movsd	16(%rsp), %xmm1
	movsd	24(%rsp), %xmm2
	divsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm2
	jmp	.L2
.L6:
	addq	$40, %rsp
	.cfi_def_cfa_offset 40
	movaps	%xmm2, %xmm0
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
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
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	jne	.L8
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L23
.L8:
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	24(%rsp), %rsi
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rdi
	movabsq	$9223372036854775807, %r12
	call	__isoc99_scanf@PLT
	movq	%r12, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC7(%rip), %rsi
	call	__printf_chk@PLT
	movq	%r12, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC8(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	32(%rsp), %rsi
	leaq	.LC9(%rip), %rdi
	call	__isoc99_scanf@PLT
	movsd	24(%rsp), %xmm0
	movsd	.LC1(%rip), %xmm1
	comisd	%xmm0, %xmm1
	jnb	.L10
	comisd	.LC10(%rip), %xmm0
	jbe	.L20
.L10:
	leaq	.LC11(%rip), %rdi
	jmp	.L24
.L20:
	cmpq	$0, 32(%rsp)
	jg	.L13
	movq	%r12, %rdx
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L22
.L13:
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$0, 16(%rsp)
	leaq	.LC14(%rip), %r13
	movl	$0, 20(%rsp)
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	16(%rsp), %rsi
	movq	%r13, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$0, 16(%rsp)
	jg	.L14
	leaq	.LC15(%rip), %rdi
.L24:
	call	puts@PLT
.L22:
	movq	%rbp, %rdi
	call	fclose@PLT
.L23:
	movl	$1, %eax
	jmp	.L7
.L14:
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__printf_chk@PLT
	leaq	20(%rsp), %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
.L15:
	cmpl	%ebx, 16(%rsp)
	jle	.L17
	movslq	20(%rsp), %rdx
	movq	%r12, %rax
	subq	%rdx, %rax
	cmpq	32(%rsp), %rax
	jge	.L16
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	movq	%rbp, %rsi
	leaq	.LC18(%rip), %rdi
	call	fputs@PLT
	jmp	.L17
.L16:
	leaq	40(%rsp), %rsi
	movl	$4, %edi
	leaq	.LC20(%rip), %r13
	incl	%ebx
	call	clock_gettime@PLT
	movq	32(%rsp), %rdi
	movsd	24(%rsp), %xmm0
	call	ln1p_series
	leaq	56(%rsp), %rsi
	movl	$4, %edi
	movsd	%xmm0, 8(%rsp)
	call	clock_gettime@PLT
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	movq	%r13, %rsi
	cvtsi2sdq	%rax, %xmm0
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	movl	$1, %edi
	mulsd	.LC19(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm2
	movb	$2, %al
	movsd	8(%rsp), %xmm1
	addsd	%xmm2, %xmm0
	movq	%xmm0, %r14
	movsd	24(%rsp), %xmm0
	call	__printf_chk@PLT
	movq	%r14, %xmm0
	leaq	.LC21(%rip), %rsi
	movb	$1, %al
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	%ebx, %ecx
	leaq	.LC22(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%rbp, %rdi
	call	__fprintf_chk@PLT
	movq	32(%rsp), %rcx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movsd	8(%rsp), %xmm1
	movq	%r13, %rdx
	movb	$2, %al
	movsd	24(%rsp), %xmm0
	movl	$1, %esi
	movq	%rbp, %rdi
	call	__fprintf_chk@PLT
	movq	%r14, %xmm0
	movq	%rbp, %rdi
	movb	$1, %al
	leaq	.LC24(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movslq	20(%rsp), %rax
	addq	%rax, 32(%rsp)
	jmp	.L15
.L17:
	movq	%rbp, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
.L7:
	movq	72(%rsp), %rdx
	subq	%fs:40, %rdx
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	addq	$80, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	-1074790400
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.align 8
.LC19:
	.long	-400107883
	.long	1041313291
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
