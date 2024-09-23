	.file	"lab3.c"
	.text
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
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
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%xmm0, %r12
	movq	%rdi, %rbp
	movl	$1, %r13d
	pxor	%xmm5, %xmm5
	movsd	%xmm5, (%rsp)
	jmp	.L2
.L3:
	leaq	1(%r13), %rbx
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rbx, %xmm1
	movsd	.LC1(%rip), %xmm0
	call	pow@PLT
	movq	%xmm0, %r14
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%r13, %xmm2
	movsd	%xmm2, 8(%rsp)
	movapd	%xmm2, %xmm1
	movq	%r12, %xmm0
	call	pow@PLT
	movq	%r14, %xmm3
	mulsd	%xmm3, %xmm0
	divsd	8(%rsp), %xmm0
	addsd	(%rsp), %xmm0
	movsd	%xmm0, (%rsp)
	movq	%rbx, %r13
.L2:
	cmpq	%rbp, %r13
	jle	.L3
	movsd	(%rsp), %xmm0
	addq	$16, %rsp
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC13:
	.string	"Enter how many times the program should run: "
	.section	.rodata.str1.1
.LC14:
	.string	"%d"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Error: The number of runs should be a positive integer."
	.align 8
.LC16:
	.string	"Should it increase N? If yes, enter the number by which to increase the parameter N. If not, enter 0: "
	.align 8
.LC17:
	.string	"Error: N exceeds maximum limit."
	.align 8
.LC18:
	.string	"Error: N exceeds maximum limit.\n"
	.align 8
.LC20:
	.string	"RES: ln(1 + %0.10lf) \342\211\210 %0.10lf\n"
	.section	.rodata.str1.1
.LC21:
	.string	"TIME: %0.10lf sec\n"
.LC22:
	.string	"Run %d:\n"
.LC23:
	.string	"N = %lld\n"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"TIME: ~~~~~~~~~~[[%0.10lf sec]]~~~~~~~~~~\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L20
	movq	%rax, %rbx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	32(%rsp), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movabsq	$9223372036854775807, %rbp
	movq	%rbp, %rdx
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rdx
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	40(%rsp), %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movsd	32(%rsp), %xmm0
	movsd	.LC1(%rip), %xmm1
	comisd	%xmm0, %xmm1
	jnb	.L8
	comisd	.LC10(%rip), %xmm0
	ja	.L8
	cmpq	$0, 40(%rsp)
	jle	.L21
	movl	$0, 24(%rsp)
	movl	$0, 28(%rsp)
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	24(%rsp), %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$0, 24(%rsp)
	jle	.L22
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	28(%rsp), %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, %r12d
	jmp	.L13
.L20:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L5
.L8:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	$1, %eax
.L5:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L23
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L21:
	.cfi_restore_state
	movabsq	$9223372036854775807, %rdx
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L5
.L22:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L5
.L14:
	leaq	48(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rdi
	movsd	32(%rsp), %xmm0
	call	ln1p_series
	movq	%xmm0, %rbp
	leaq	64(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	mulsd	.LC19(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)
	movq	%rbp, %xmm1
	movsd	32(%rsp), %xmm0
	leaq	.LC20(%rip), %r13
	movq	%r13, %rsi
	movl	$1, %edi
	movl	$2, %eax
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm0
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	addl	$1, %r12d
	movl	%r12d, %ecx
	leaq	.LC22(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movq	40(%rsp), %rcx
	leaq	.LC23(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movq	%rbp, %xmm1
	movsd	32(%rsp), %xmm0
	movq	%r13, %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	movl	$2, %eax
	call	__fprintf_chk@PLT
	movsd	8(%rsp), %xmm0
	leaq	.LC24(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	movl	$1, %eax
	call	__fprintf_chk@PLT
	movslq	28(%rsp), %rax
	addq	%rax, 40(%rsp)
.L13:
	cmpl	%r12d, 24(%rsp)
	jle	.L15
	movslq	28(%rsp), %rdx
	movabsq	$9223372036854775807, %rax
	subq	%rdx, %rax
	cmpq	40(%rsp), %rax
	jge	.L14
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rcx
	movl	$32, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	fwrite@PLT
.L15:
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	$0, %eax
	jmp	.L5
.L23:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
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
