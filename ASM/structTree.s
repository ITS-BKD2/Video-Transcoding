	.file	"structTree.c"
	.text
	.p2align 4
	.globl	addtree
	.type	addtree, @function
addtree:
.LFB56:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	je	.L13
	movq	(%rdi), %rsi
	movq	%rdi, %rbx
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L14
	js	.L15
	movq	24(%rbx), %rdi
	movq	%rbp, %rsi
	call	addtree
	movq	%rax, 24(%rbx)
.L1:
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
	addl	$1, 8(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	movq	16(%rbx), %rdi
	movq	%rbp, %rsi
	call	addtree
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	.cfi_restore_state
	movl	$32, %edi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	strlen@PLT
	leaq	1(%rax), %r12
	movq	%r12, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L3
	movq	%r12, %rcx
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	__memcpy_chk@PLT
	movq	%rax, %rdi
.L3:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rdi, (%rbx)
	movl	$1, 8(%rbx)
	vmovdqu	%xmm0, 16(%rbx)
	jmp	.L1
	.cfi_endproc
.LFE56:
	.size	addtree, .-addtree
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%4d %s\n"
	.text
	.p2align 4
	.globl	treeprint
	.type	treeprint, @function
treeprint:
.LFB57:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	testq	%rdi, %rdi
	movq	%rdi, 16(%rsp)
	je	.L71
	leaq	.LC0(%rip), %rbp
.L34:
	movq	16(%rsp), %rax
	movq	16(%rax), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 8(%rsp)
	je	.L18
.L33:
	movq	8(%rsp), %rcx
	movq	16(%rcx), %r14
	testq	%r14, %r14
	je	.L19
.L32:
	movq	16(%r14), %r15
	testq	%r15, %r15
	je	.L20
.L31:
	movq	16(%r15), %rbx
	testq	%rbx, %rbx
	je	.L21
.L30:
	movq	16(%rbx), %r12
	testq	%r12, %r12
	je	.L22
.L29:
	movq	16(%r12), %r13
	testq	%r13, %r13
	je	.L23
.L28:
	movq	16(%r13), %rdi
	testq	%rdi, %rdi
	je	.L24
.L27:
	movq	16(%rdi), %r9
	testq	%r9, %r9
	je	.L25
.L26:
	movq	%rdi, 24(%rsp)
	movq	16(%r9), %rdi
	movq	%r9, (%rsp)
	call	treeprint
	movq	(%rsp), %r10
	movq	%rbp, %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	movq	(%r10), %rcx
	movl	8(%r10), %edx
	call	__printf_chk@PLT
	movq	(%rsp), %rsi
	movq	24(%rsp), %rdi
	movq	24(%rsi), %r9
	testq	%r9, %r9
	jne	.L26
.L25:
	movq	(%rdi), %rcx
	movl	8(%rdi), %edx
	movq	%rdi, (%rsp)
	xorl	%eax, %eax
	movl	$2, %edi
	movq	%rbp, %rsi
	call	__printf_chk@PLT
	movq	(%rsp), %r8
	movq	24(%r8), %rdi
	testq	%rdi, %rdi
	jne	.L27
.L24:
	movq	0(%r13), %rcx
	movl	8(%r13), %edx
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	24(%r13), %r13
	testq	%r13, %r13
	jne	.L28
.L23:
	movq	(%r12), %rcx
	movl	8(%r12), %edx
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	24(%r12), %r12
	testq	%r12, %r12
	jne	.L29
.L22:
	movq	(%rbx), %rcx
	movl	8(%rbx), %edx
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	24(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L30
.L21:
	movq	(%r15), %rcx
	movl	8(%r15), %edx
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	24(%r15), %r15
	testq	%r15, %r15
	jne	.L31
.L20:
	movq	(%r14), %rcx
	movl	8(%r14), %edx
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	24(%r14), %r14
	testq	%r14, %r14
	jne	.L32
.L19:
	movq	8(%rsp), %r13
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$2, %edi
	movq	0(%r13), %rcx
	movl	8(%r13), %edx
	call	__printf_chk@PLT
	movq	24(%r13), %r11
	testq	%r11, %r11
	movq	%r11, 8(%rsp)
	jne	.L33
.L18:
	movq	16(%rsp), %r12
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$2, %edi
	movq	(%r12), %rcx
	movl	8(%r12), %edx
	call	__printf_chk@PLT
	movq	24(%r12), %rax
	testq	%rax, %rax
	movq	%rax, 16(%rsp)
	jne	.L34
.L71:
	addq	$40, %rsp
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
	.cfi_endproc
.LFE57:
	.size	treeprint, .-treeprint
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	leaq	-1(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L76:
	movq	stdin(%rip), %rdx
	movl	$50, %esi
	movq	%rbx, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L82
	call	__ctype_b_loc@PLT
	movq	(%rax), %rsi
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L75:
	movsbq	(%r12,%rax), %rdx
	movq	%rax, %rcx
	addq	$1, %rax
	testb	$4, 1(%rsi,%rdx,2)
	jne	.L75
	movslq	%ecx, %rdi
	cmpb	$0, (%rsp,%rdi)
	jne	.L76
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	call	addtree
	movq	%rax, %rbp
	jmp	.L76
.L82:
	movq	%rbp, %rdi
	call	treeprint
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L83
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L83:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE55:
	.size	main, .-main
	.text
	.p2align 4
	.globl	mytalloc
	.type	mytalloc, @function
mytalloc:
.LFB58:
	.cfi_startproc
	endbr64
	movl	$32, %edi
	jmp	malloc@PLT
	.cfi_endproc
.LFE58:
	.size	mytalloc, .-mytalloc
	.p2align 4
	.globl	mystrdup
	.type	mystrdup, @function
mystrdup:
.LFB59:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	strlen@PLT
	leaq	1(%rax), %rbx
	movq	%rbx, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, %r8
	je	.L85
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	__memcpy_chk@PLT
	movq	%rax, %r8
.L85:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%r8, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE59:
	.size	mystrdup, .-mystrdup
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
