	.file	"dotprod.c"
	.text
	.p2align 4
	.globl	dotprod
	.type	dotprod, @function
dotprod:
.LFB0:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L7
	cmpq	$1, %rdx
	je	.L8
	movq	%rdx, %rcx
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	shrq	%rcx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movupd	(%rdi,%rax), %xmm0
	movupd	(%rsi,%rax), %xmm3
	addq	$16, %rax
	mulpd	%xmm3, %xmm0
	addsd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%rax, %rcx
	jne	.L4
	movq	%rdx, %rax
	andq	$-2, %rax
	andl	$1, %edx
	je	.L1
.L3:
	movsd	(%rsi,%rax,8), %xmm0
	mulsd	(%rdi,%rax,8), %xmm0
	addsd	%xmm0, %xmm1
.L1:
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
.L8:
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	dotprod, .-dotprod
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
