	.file	"lab3.c"
	.text
	.p2align 4
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	testq	%rdi, %rdi
	jle	.L4
	movsd	.LC0(%rip), %xmm4
	pxor	%xmm5, %xmm5
	movq	%xmm0, %r14
	leaq	1(%rdi), %r12
	movl	$1, %ebx
	movsd	%xmm5, 8(%rsp)
	movsd	%xmm4, 24(%rsp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L7:
	addq	$2, %rbx
	pxor	%xmm1, %xmm1
	movq	.LC2(%rip), %rax
	cvtsi2sdq	%rbx, %xmm1
	movq	%rbp, %rbx
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, 24(%rsp)
.L3:
	pxor	%xmm1, %xmm1
	movq	%r14, %xmm0
	leaq	1(%rbx), %rbp
	cvtsi2sdq	%rbx, %xmm1
	movsd	%xmm1, 16(%rsp)
	call	pow@PLT
	mulsd	24(%rsp), %xmm0
	movsd	16(%rsp), %xmm1
	divsd	%xmm1, %xmm0
	addsd	8(%rsp), %xmm0
	movsd	%xmm0, 8(%rsp)
	cmpq	%r12, %rbp
	jne	.L7
.L1:
	movsd	8(%rsp), %xmm0
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	pxor	%xmm6, %xmm6
	movsd	%xmm6, 8(%rsp)
	jmp	.L1
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
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L27
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %r12
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	48(%rsp), %rsi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movabsq	$9223372036854775807, %rdx
	call	__printf_chk@PLT
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movabsq	$9223372036854775807, %rdx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	56(%rsp), %rsi
	leaq	.LC10(%rip), %rdi
	call	__isoc99_scanf@PLT
	movsd	48(%rsp), %xmm0
	comisd	.LC0(%rip), %xmm0
	ja	.L24
	movsd	.LC2(%rip), %xmm7
	comisd	%xmm0, %xmm7
	jnb	.L24
	cmpq	$0, 56(%rsp)
	jle	.L28
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$0, 40(%rsp)
	leaq	.LC14(%rip), %rbp
	movl	$0, 44(%rsp)
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	40(%rsp), %rsi
	movq	%rbp, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$0, 40(%rsp)
	jle	.L29
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	44(%rsp), %rsi
	movq	%rbp, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$0, 40(%rsp)
	jle	.L16
	movq	56(%rsp), %rdx
	movslq	44(%rsp), %rax
	xorl	%r13d, %r13d
	leaq	.LC20(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L20:
	movabsq	$9223372036854775807, %rcx
	subq	%rax, %rcx
	cmpq	%rdx, %rcx
	jl	.L30
	leaq	64(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movsd	48(%rsp), %xmm5
	movq	56(%rsp), %rbp
	movsd	%xmm5, 24(%rsp)
	testq	%rbp, %rbp
	jle	.L23
	movq	.LC0(%rip), %rax
	pxor	%xmm6, %xmm6
	addq	$1, %rbp
	movl	$1, %r14d
	movsd	%xmm6, (%rsp)
	movq	%rax, 16(%rsp)
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L31:
	leaq	2(%r14), %rax
	pxor	%xmm1, %xmm1
	movq	%rbx, %r14
	cvtsi2sdq	%rax, %xmm1
	movq	.LC2(%rip), %rax
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, 16(%rsp)
.L19:
	pxor	%xmm1, %xmm1
	movsd	24(%rsp), %xmm0
	leaq	1(%r14), %rbx
	cvtsi2sdq	%r14, %xmm1
	movsd	%xmm1, 8(%rsp)
	call	pow@PLT
	mulsd	16(%rsp), %xmm0
	movsd	8(%rsp), %xmm1
	divsd	%xmm1, %xmm0
	addsd	(%rsp), %xmm0
	movsd	%xmm0, (%rsp)
	cmpq	%rbp, %rbx
	jne	.L31
.L18:
	leaq	80(%rsp), %rsi
	movl	$4, %edi
	addl	$1, %r13d
	call	clock_gettime@PLT
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	movq	%r15, %rsi
	movq	88(%rsp), %rax
	subq	72(%rsp), %rax
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm2
	movq	80(%rsp), %rax
	subq	64(%rsp), %rax
	mulsd	.LC19(%rip), %xmm2
	cvtsi2sdq	%rax, %xmm0
	movsd	(%rsp), %xmm1
	movl	$2, %eax
	addsd	%xmm0, %xmm2
	movsd	48(%rsp), %xmm0
	movsd	%xmm2, 8(%rsp)
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm2
	movl	$1, %edi
	leaq	.LC21(%rip), %rsi
	movl	$1, %eax
	movapd	%xmm2, %xmm0
	call	__printf_chk@PLT
	movl	%r13d, %ecx
	movl	$1, %esi
	movq	%r12, %rdi
	leaq	.LC22(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	56(%rsp), %rcx
	movq	%r12, %rdi
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movsd	(%rsp), %xmm1
	movq	%r15, %rdx
	movq	%r12, %rdi
	movsd	48(%rsp), %xmm0
	movl	$1, %esi
	movl	$2, %eax
	call	__fprintf_chk@PLT
	movsd	8(%rsp), %xmm2
	movl	$1, %esi
	movq	%r12, %rdi
	leaq	.LC24(%rip), %rdx
	movl	$1, %eax
	movapd	%xmm2, %xmm0
	call	__fprintf_chk@PLT
	movq	56(%rsp), %rdx
	movslq	44(%rsp), %rax
	addq	%rax, %rdx
	movq	%rdx, 56(%rsp)
	cmpl	40(%rsp), %r13d
	jl	.L20
.L16:
	movq	%r12, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
	jmp	.L8
.L24:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	movq	%r12, %rdi
	call	fclose@PLT
	movl	$1, %eax
.L8:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L32
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	pxor	%xmm7, %xmm7
	movsd	%xmm7, (%rsp)
	jmp	.L18
.L28:
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movabsq	$9223372036854775807, %rdx
	call	__printf_chk@PLT
	movq	%r12, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L8
.L30:
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	movq	%r12, %rcx
	movl	$32, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	fwrite@PLT
	jmp	.L16
.L29:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movq	%r12, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L8
.L32:
	call	__stack_chk_fail@PLT
.L27:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L8
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	-1074790400
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
