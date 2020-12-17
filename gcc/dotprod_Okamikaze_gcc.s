	.file	"dotprod.c"
	.text
	.p2align 4
	.globl	dotprod
	.type	dotprod, @function
dotprod:
.LFB0:
	.cfi_startproc
	endbr64
	movq	%rdx, %rcx
	testq	%rdx, %rdx
	je	.L7
	leaq	-1(%rdx), %rax
	cmpq	$2, %rax
	jbe	.L8
	movq	%rdx, %r8
	shrq	$2, %r8
	salq	$5, %r8
	leaq	-32(%r8), %rdx
	shrq	$5, %rdx
	incq	%rdx
	xorl	%r9d, %r9d
	vxorpd	%xmm0, %xmm0, %xmm0
	andl	$7, %edx
	je	.L4
	cmpq	$1, %rdx
	je	.L31
	cmpq	$2, %rdx
	je	.L32
	cmpq	$3, %rdx
	je	.L33
	cmpq	$4, %rdx
	je	.L34
	cmpq	$5, %rdx
	je	.L35
	cmpq	$6, %rdx
	jne	.L48
.L36:
	vmovupd	(%rdi,%r9), %ymm3
	vfmadd231pd	(%rsi,%r9), %ymm3, %ymm0
	addq	$32, %r9
.L35:
	vmovupd	(%rdi,%r9), %ymm4
	vfmadd231pd	(%rsi,%r9), %ymm4, %ymm0
	addq	$32, %r9
.L34:
	vmovupd	(%rdi,%r9), %ymm5
	vfmadd231pd	(%rsi,%r9), %ymm5, %ymm0
	addq	$32, %r9
.L33:
	vmovupd	(%rdi,%r9), %ymm6
	vfmadd231pd	(%rsi,%r9), %ymm6, %ymm0
	addq	$32, %r9
.L32:
	vmovupd	(%rdi,%r9), %ymm1
	vfmadd231pd	(%rsi,%r9), %ymm1, %ymm0
	addq	$32, %r9
.L31:
	vmovupd	(%rdi,%r9), %ymm7
	vfmadd231pd	(%rsi,%r9), %ymm7, %ymm0
	addq	$32, %r9
	cmpq	%r8, %r9
	je	.L45
.L4:
	vmovupd	(%rdi,%r9), %ymm8
	vmovupd	32(%rdi,%r9), %ymm9
	vfmadd231pd	(%rsi,%r9), %ymm8, %ymm0
	vmovupd	64(%rdi,%r9), %ymm10
	vmovupd	96(%rdi,%r9), %ymm11
	vmovupd	128(%rdi,%r9), %ymm12
	vmovupd	160(%rdi,%r9), %ymm13
	vfmadd231pd	32(%rsi,%r9), %ymm9, %ymm0
	vmovupd	192(%rdi,%r9), %ymm14
	vmovupd	224(%rdi,%r9), %ymm15
	vfmadd231pd	64(%rsi,%r9), %ymm10, %ymm0
	vfmadd231pd	96(%rsi,%r9), %ymm11, %ymm0
	vfmadd231pd	128(%rsi,%r9), %ymm12, %ymm0
	vfmadd231pd	160(%rsi,%r9), %ymm13, %ymm0
	vfmadd231pd	192(%rsi,%r9), %ymm14, %ymm0
	vfmadd231pd	224(%rsi,%r9), %ymm15, %ymm0
	addq	$256, %r9
	cmpq	%r8, %r9
	jne	.L4
.L45:
	vextractf128	$0x1, %ymm0, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm3
	movq	%rcx, %r10
	andq	$-4, %r10
	vunpckhpd	%xmm3, %xmm3, %xmm0
	vaddpd	%xmm3, %xmm0, %xmm0
	testb	$3, %cl
	je	.L49
	vzeroupper
.L3:
	vmovsd	(%rdi,%r10,8), %xmm4
	leaq	1(%r10), %r11
	vfmadd231sd	(%rsi,%r10,8), %xmm4, %xmm0
	cmpq	%r11, %rcx
	jbe	.L1
	vmovsd	(%rdi,%r11,8), %xmm5
	addq	$2, %r10
	vfmadd231sd	(%rsi,%r11,8), %xmm5, %xmm0
	cmpq	%r10, %rcx
	jbe	.L1
	vmovsd	(%rsi,%r10,8), %xmm6
	vfmadd231sd	(%rdi,%r10,8), %xmm6, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	vxorpd	%xmm0, %xmm0, %xmm0
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L49:
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	vmovupd	(%rdi), %ymm2
	movl	$32, %r9d
	vfmadd231pd	(%rsi), %ymm2, %ymm0
	jmp	.L36
.L8:
	xorl	%r10d, %r10d
	vxorpd	%xmm0, %xmm0, %xmm0
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
