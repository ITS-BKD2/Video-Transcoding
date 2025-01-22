	.file	"ciclodouble.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Pre-random"
.LC1:
	.string	"%d\n"
.LC2:
	.string	"Quot"
.LC3:
	.string	"remainder"
.LC4:
	.string	"fine"
.LC5:
	.string	"%ld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$10, %edx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC2(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	call	strtol@PLT
	xorl	%edi, %edi
	movl	%eax, %ebp
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	call	rand@PLT
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	movl	%eax, %ebx
	cltq
	imulq	$1759218605, %rax, %rax
	movl	%ebx, %edx
	sarl	$31, %edx
	sarq	$44, %rax
	subl	%edx, %eax
	imull	$10000, %eax, %ecx
	xorl	%eax, %eax
	subl	%ecx, %ebx
	movl	%ebx, %edx
	movl	%ebx, %r15d
	call	__printf_chk@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	negl	%r15d
	vcvtsi2sdl	%ebp, %xmm3, %xmm0
	cmovns	%r15d, %ebx
	leaq	.LC3(%rip), %rbp
	leaq	a.0(%rip), %r15
	movl	%ebx, 28(%rsp)
	xorl	%ebx, %ebx
	vmovsd	%xmm0, (%rsp)
.L2:
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r12, %rdi
	call	puts@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%r12, %rdi
	vcvtsi2sdq	%r13, %xmm2, %xmm1
	vdivsd	(%rsp), %xmm1, %xmm4
	vmovq	%xmm4, %r14
	vmovsd	%xmm1, 16(%rsp)
	call	puts@PLT
	vmovq	%r14, %xmm5
	movq	%rbp, %rdi
	leaq	1(%r13), %r14
	vroundsd	$11, %xmm5, %xmm5, %xmm6
	vmovsd	%xmm6, 8(%rsp)
	call	puts@PLT
	vmovsd	8(%rsp), %xmm7
	vmovsd	16(%rsp), %xmm8
	movq	%rbp, %rdi
	vfnmadd231sd	(%rsp), %xmm7, %xmm8
	vmovsd	%xmm8, 8(%rsp)
	call	puts@PLT
	vmovsd	8(%rsp), %xmm9
	movl	(%r15,%rbx,4), %esi
	vcvttsd2sil	%xmm9, %edi
	addl	%esi, %edi
	movl	%edi, (%r15,%rbx,4)
	movq	%r12, %rdi
	call	puts@PLT
	vxorpd	%xmm10, %xmm10, %xmm10
	movq	%r12, %rdi
	vcvtsi2sdq	%r14, %xmm10, %xmm11
	vdivsd	(%rsp), %xmm11, %xmm12
	vmovq	%xmm12, %r14
	vmovsd	%xmm11, 16(%rsp)
	call	puts@PLT
	vmovq	%r14, %xmm13
	movq	%rbp, %rdi
	leaq	2(%r13), %r14
	vroundsd	$11, %xmm13, %xmm13, %xmm14
	vmovsd	%xmm14, 8(%rsp)
	call	puts@PLT
	vmovsd	8(%rsp), %xmm15
	vmovsd	16(%rsp), %xmm3
	movq	%rbp, %rdi
	vfnmadd231sd	(%rsp), %xmm15, %xmm3
	vmovsd	%xmm3, 8(%rsp)
	call	puts@PLT
	vmovsd	8(%rsp), %xmm0
	movl	(%r15,%rbx,4), %r8d
	movq	%r12, %rdi
	vcvttsd2sil	%xmm0, %r9d
	addl	%r8d, %r9d
	movl	%r9d, (%r15,%rbx,4)
	call	puts@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%r12, %rdi
	vcvtsi2sdq	%r14, %xmm2, %xmm1
	vdivsd	(%rsp), %xmm1, %xmm4
	vmovq	%xmm4, %r14
	vmovsd	%xmm1, 16(%rsp)
	call	puts@PLT
	vmovq	%r14, %xmm5
	movq	%rbp, %rdi
	leaq	3(%r13), %r14
	vroundsd	$11, %xmm5, %xmm5, %xmm6
	vmovsd	%xmm6, 8(%rsp)
	addq	$4, %r13
	call	puts@PLT
	vmovsd	8(%rsp), %xmm7
	vmovsd	16(%rsp), %xmm8
	movq	%rbp, %rdi
	vfnmadd231sd	(%rsp), %xmm7, %xmm8
	vmovsd	%xmm8, 8(%rsp)
	call	puts@PLT
	vmovsd	8(%rsp), %xmm9
	movl	(%r15,%rbx,4), %r10d
	movq	%r12, %rdi
	vcvttsd2sil	%xmm9, %r11d
	addl	%r10d, %r11d
	movl	%r11d, (%r15,%rbx,4)
	call	puts@PLT
	vxorpd	%xmm10, %xmm10, %xmm10
	movq	%r12, %rdi
	vcvtsi2sdq	%r14, %xmm10, %xmm11
	vdivsd	(%rsp), %xmm11, %xmm12
	vmovq	%xmm12, %r14
	vmovsd	%xmm11, 16(%rsp)
	call	puts@PLT
	vmovq	%r14, %xmm13
	movq	%rbp, %rdi
	vroundsd	$11, %xmm13, %xmm13, %xmm14
	vmovsd	%xmm14, 8(%rsp)
	call	puts@PLT
	vmovsd	8(%rsp), %xmm15
	vmovsd	16(%rsp), %xmm3
	movq	%rbp, %rdi
	vfnmadd231sd	(%rsp), %xmm15, %xmm3
	vmovsd	%xmm3, 8(%rsp)
	call	puts@PLT
	vmovsd	8(%rsp), %xmm0
	movl	(%r15,%rbx,4), %edx
	vcvttsd2sil	%xmm0, %eax
	addl	%edx, %eax
	cmpq	$100000, %r13
	movl	%eax, (%r15,%rbx,4)
	jne	.L3
	movl	(%r15,%rbx,4), %ecx
	movl	28(%rsp), %r13d
	addl	%r13d, %ecx
	movl	%ecx, (%r15,%rbx,4)
	addq	$1, %rbx
	cmpq	$10000, %rbx
	jne	.L2
	leaq	.LC4(%rip), %rdi
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	call	puts@PLT
.L5:
	movslq	(%r15,%rbx,4), %r12
	leaq	1(%rbx), %rsi
	leaq	2(%rbx), %r8
	movslq	(%r15,%rsi,4), %rdi
	leaq	3(%rbx), %r10
	movslq	(%r15,%r8,4), %r9
	leaq	4(%rbx), %r14
	addq	%r12, %rbp
	movslq	(%r15,%r10,4), %r11
	leaq	5(%rbx), %rax
	movslq	(%r15,%r14,4), %rdx
	addq	%rdi, %rbp
	movslq	(%r15,%rax,4), %rcx
	leaq	6(%rbx), %r13
	leaq	7(%rbx), %rsi
	addq	%r9, %rbp
	movslq	(%r15,%r13,4), %r12
	movslq	(%r15,%rsi,4), %rdi
	addq	$8, %rbx
	addq	%r11, %rbp
	addq	%rdx, %rbp
	addq	%rcx, %rbp
	addq	%r12, %rbp
	addq	%rdi, %rbp
	cmpq	$10000, %rbx
	jne	.L5
	movq	%rbp, %rdx
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.local	a.0
	.comm	a.0,40000,32
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
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
