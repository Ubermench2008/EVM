	.file	"lab3.c"
	.text
	.p2align 4
	.globl	ln1p_series
	.type	ln1p_series, @function
ln1p_series:
.LFB23:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	jle	.L4
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pxor	%xmm2, %xmm2
	movq	%xmm0, %r14
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	1(%rdi), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$1, %ebx
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbx, %rbp
	pxor	%xmm1, %xmm1
	addq	$1, %rbx
	movq	.LC1(%rip), %rax
	cvtsi2sdq	%rbx, %xmm1
	movsd	%xmm2, 24(%rsp)
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rbp, %xmm1
	movsd	%xmm0, 8(%rsp)
	movq	%r14, %xmm0
	movsd	%xmm1, 16(%rsp)
	call	pow@PLT
	mulsd	8(%rsp), %xmm0
	movsd	16(%rsp), %xmm1
	movsd	24(%rsp), %xmm2
	divsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm2
	cmpq	%r12, %rbx
	jne	.L3
	addq	$40, %rsp
	.cfi_def_cfa_offset 40
	movapd	%xmm2, %xmm0
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
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 14
	pxor	%xmm2, %xmm2
	movapd	%xmm2, %xmm0
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
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
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
	je	.L32
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	48(%rsp), %rsi
	leaq	.LC6(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movabsq	$9223372036854775807, %rdx
	call	__printf_chk@PLT
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movabsq	$9223372036854775807, %rdx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	56(%rsp), %rsi
	leaq	.LC9(%rip), %rdi
	call	__isoc99_scanf@PLT
	movsd	48(%rsp), %xmm0
	movsd	.LC1(%rip), %xmm7
	comisd	%xmm0, %xmm7
	jnb	.L14
	comisd	.LC10(%rip), %xmm0
	ja	.L14
	cmpq	$0, 56(%rsp)
	jle	.L33
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$0, 40(%rsp)
	leaq	.LC14(%rip), %r12
	movl	$0, 44(%rsp)
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	40(%rsp), %rsi
	movq	%r12, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$0, 40(%rsp)
	jle	.L34
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	44(%rsp), %rsi
	movq	%r12, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$0, 40(%rsp)
	jle	.L20
	movq	56(%rsp), %rdx
	movslq	44(%rsp), %rax
	xorl	%r12d, %r12d
	leaq	.LC20(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L24:
	movabsq	$9223372036854775807, %rcx
	subq	%rax, %rcx
	cmpq	%rdx, %rcx
	jl	.L35
	leaq	64(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movsd	48(%rsp), %xmm5
	movq	56(%rsp), %rbx
	movsd	%xmm5, 24(%rsp)
	testq	%rbx, %rbx
	jle	.L27
	pxor	%xmm6, %xmm6
	addq	$1, %rbx
	movl	$1, %r15d
	movsd	%xmm6, (%rsp)
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%r15, %r13
	pxor	%xmm1, %xmm1
	addq	$1, %r15
	movq	.LC1(%rip), %rax
	cvtsi2sdq	%r15, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%r13, %xmm1
	movsd	%xmm0, 8(%rsp)
	movsd	24(%rsp), %xmm0
	movsd	%xmm1, 16(%rsp)
	call	pow@PLT
	mulsd	8(%rsp), %xmm0
	movsd	16(%rsp), %xmm1
	divsd	%xmm1, %xmm0
	addsd	(%rsp), %xmm0
	movsd	%xmm0, (%rsp)
	cmpq	%rbx, %r15
	jne	.L23
.L22:
	leaq	80(%rsp), %rsi
	movl	$4, %edi
	addl	$1, %r12d
	call	clock_gettime@PLT
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	movq	%r14, %rsi
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
	movl	%r12d, %ecx
	movl	$1, %esi
	movq	%rbp, %rdi
	leaq	.LC22(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	56(%rsp), %rcx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movsd	(%rsp), %xmm1
	movq	%r14, %rdx
	movq	%rbp, %rdi
	movsd	48(%rsp), %xmm0
	movl	$1, %esi
	movl	$2, %eax
	call	__fprintf_chk@PLT
	movsd	8(%rsp), %xmm2
	movl	$1, %esi
	movq	%rbp, %rdi
	leaq	.LC24(%rip), %rdx
	movl	$1, %eax
	movapd	%xmm2, %xmm0
	call	__fprintf_chk@PLT
	movq	56(%rsp), %rdx
	movslq	44(%rsp), %rax
	addq	%rax, %rdx
	movq	%rdx, 56(%rsp)
	cmpl	40(%rsp), %r12d
	jl	.L24
.L20:
	movq	%rbp, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
	jmp	.L11
.L14:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movl	$1, %eax
.L11:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L36
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
.L27:
	.cfi_restore_state
	pxor	%xmm7, %xmm7
	movsd	%xmm7, (%rsp)
	jmp	.L22
.L33:
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movabsq	$9223372036854775807, %rdx
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L11
.L35:
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	movq	%rbp, %rcx
	movl	$32, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	fwrite@PLT
	jmp	.L20
.L34:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L11
.L36:
	call	__stack_chk_fail@PLT
.L32:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L11
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
