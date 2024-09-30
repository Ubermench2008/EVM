	.file	"lab3.c"
	.text
	.section	.rodata
.LC0:
	.string	"%lld"
	.align 8
.LC6:
	.string	"\320\227\320\275\320\260\321\207\320\265\320\275\320\270\320\265 ln(1 + x): %lf\n"
	.align 8
.LC7:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\262\321\213\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217: %lf \321\201\320\265\320\272\321\203\320\275\320\264\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	-64(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movq	$1, -72(%rbp)
	jmp	.L2
.L3:
	movsd	-88(%rbp), %xmm0
	mulsd	-80(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	-72(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-96(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	-88(%rbp), %xmm0
	movq	.LC4(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	-80(%rbp), %xmm0
	mulsd	-64(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	addq	$1, -72(%rbp)
.L2:
	movq	-104(%rbp), %rax
	cmpq	%rax, -72(%rbp)
	jle	.L3
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rax
	movq	-48(%rbp), %rdx
	subq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rdx
	subq	%rdx, %rax
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm2
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
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
.LC3:
	.long	0
	.long	1072693248
	.align 16
.LC4:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC5:
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
