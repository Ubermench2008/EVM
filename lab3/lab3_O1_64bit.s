	.file	"lab3.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%lld"
	.section	.rodata.str1.8,"aMS",@progbits,1
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
.LFB23:
	.cfi_startproc
	endbr64
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	leaq	24(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	call	__isoc99_scanf@PLT
	leaq	32(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rdx
	testq	%rdx, %rdx
	jle	.L5
	addq	$1, %rdx
	movl	$1, %eax
	movsd	.LC0(%rip), %xmm2
	movsd	.LC1(%rip), %xmm1
	pxor	%xmm7, %xmm7
	movsd	%xmm7, (%rsp)
	movq	.LC4(%rip), %xmm5
	movapd	%xmm2, %xmm4
.L3:
	movapd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	pxor	%xmm3, %xmm3
	cvtsi2sdq	%rax, %xmm3
	divsd	%xmm3, %xmm0
	addsd	(%rsp), %xmm0
	movsd	%xmm0, (%rsp)
	xorpd	%xmm5, %xmm1
	mulsd	%xmm4, %xmm2
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L3
.L2:
	leaq	48(%rsp), %rsi
	movl	$4, %edi
	call	clock_gettime@PLT
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	mulsd	.LC5(%rip), %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	movsd	(%rsp), %xmm0
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm0
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	movl	$0, %eax
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	pxor	%xmm7, %xmm7
	movsd	%xmm7, (%rsp)
	jmp	.L2
.L8:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1071644672
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
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