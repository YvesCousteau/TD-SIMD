	.file	"dotprod_double.c"
	.text
	.globl	dotprod_unroll2
	.type	dotprod_unroll2, @function
dotprod_unroll2:
.LFB0:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L4
	movl	$0, %eax
	pxor	%xmm2, %xmm2
	movapd	%xmm2, %xmm1
.L3:
	movsd	(%rdi,%rax,8), %xmm0
	mulsd	(%rsi,%rax,8), %xmm0
	addsd	%xmm0, %xmm1
	movsd	8(%rdi,%rax,8), %xmm0
	mulsd	8(%rsi,%rax,8), %xmm0
	addsd	%xmm0, %xmm2
	addq	$2, %rax
	cmpq	%rax, %rdx
	ja	.L3
.L2:
	addsd	%xmm2, %xmm1
	movapd	%xmm1, %xmm0
	ret
.L4:
	pxor	%xmm2, %xmm2
	movapd	%xmm2, %xmm1
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	dotprod_unroll2, .-dotprod_unroll2
	.ident	"GCC: (Ubuntu 10.2.0-13ubuntu1) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
