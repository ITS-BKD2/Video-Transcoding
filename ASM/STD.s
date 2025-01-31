	.file	"SexuallyTransmittedDiseaseLibrary.c"
	.intel_syntax noprefix
	.text
	.local	mem_pool
	.comm	mem_pool,1024,32
	.local	free_list
	.comm	free_list,8,8
	.globl	init_mem_pool
	.type	init_mem_pool, @function
init_mem_pool:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	lea	rax, mem_pool[rip]
	mov	QWORD PTR free_list[rip], rax
	mov	rax, QWORD PTR free_list[rip]
	mov	QWORD PTR 8[rax], 1008
	mov	rax, QWORD PTR free_list[rip]
	mov	QWORD PTR [rax], 0
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	init_mem_pool, .-init_mem_pool
	.globl	my_sbrk
	.type	my_sbrk, @function
my_sbrk:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR current_break.0[rip]
	test	rax, rax
	jne	.L3
	mov	edi, 0
	call	sbrk@PLT
	mov	QWORD PTR current_break.0[rip], rax
.L3:
	mov	rax, QWORD PTR current_break.0[rip]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	sbrk@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], -1
	jne	.L4
	mov	rax, -1
	jmp	.L5
.L4:
	mov	rdx, QWORD PTR current_break.0[rip]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	QWORD PTR current_break.0[rip], rax
	mov	rax, QWORD PTR -16[rbp]
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	my_sbrk, .-my_sbrk
	.globl	low_malloc
	.type	low_malloc, @function
low_malloc:
.LFB2:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	and	eax, 7
	test	rax, rax
	je	.L7
	mov	rax, QWORD PTR -24[rbp]
	and	rax, -8
	add	rax, 8
	mov	QWORD PTR -24[rbp], rax
.L7:
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 16
	mov	rdi, rax
	call	sbrk@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], -1
	jne	.L8
	mov	eax, 0
	jmp	.L9
.L8:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rax, 16
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	low_malloc, .-low_malloc
	.globl	low_free
	.type	low_free, @function
low_free:
.LFB3:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	cmp	QWORD PTR -24[rbp], 0
	je	.L13
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, 16
	mov	QWORD PTR -8[rbp], rax
	mov	rdx, QWORD PTR free_list[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR free_list[rip], rax
	jmp	.L10
.L13:
	nop
.L10:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	low_free, .-low_free
	.globl	my_malloc
	.type	my_malloc, @function
my_malloc:
.LFB4:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -40[rbp], rdi
	mov	rax, QWORD PTR free_list[rip]
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR -40[rbp]
	and	eax, 3
	test	rax, rax
	je	.L16
	mov	rax, QWORD PTR -40[rbp]
	and	rax, -4
	add	rax, 4
	mov	QWORD PTR -40[rbp], rax
	jmp	.L16
.L23:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	cmp	rax, QWORD PTR -40[rbp]
	jb	.L17
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, QWORD PTR -40[rbp]
	add	rdx, 16
	cmp	rdx, rax
	jnb	.L18
	mov	rax, QWORD PTR -40[rbp]
	lea	rdx, 16[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	sub	rax, QWORD PTR -40[rbp]
	lea	rdx, -16[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR [rax], 0
	cmp	QWORD PTR -16[rbp], 0
	je	.L19
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L20
.L19:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR free_list[rip], rax
	jmp	.L20
.L18:
	cmp	QWORD PTR -16[rbp], 0
	je	.L21
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L20
.L21:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR free_list[rip], rax
.L20:
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 16
	jmp	.L22
.L17:
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
.L16:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L23
	mov	eax, 0
.L22:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	my_malloc, .-my_malloc
	.globl	my_calloc
	.type	my_calloc, @function
my_calloc:
.LFB5:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -24[rbp]
	imul	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	my_malloc
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	je	.L25
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	memset@PLT
.L25:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	my_calloc, .-my_calloc
	.globl	my_realloc
	.type	my_realloc, @function
my_realloc:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	cmp	QWORD PTR -40[rbp], 0
	jne	.L28
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	my_malloc
	jmp	.L29
.L28:
	cmp	QWORD PTR -48[rbp], 0
	jne	.L30
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	my_free
	mov	eax, 0
	jmp	.L29
.L30:
	mov	rax, QWORD PTR -40[rbp]
	sub	rax, 16
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	cmp	QWORD PTR -16[rbp], rax
	jb	.L31
	mov	rax, QWORD PTR -40[rbp]
	jmp	.L29
.L31:
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	my_malloc
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	je	.L32
	mov	rdx, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcpy@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	my_free
.L32:
	mov	rax, QWORD PTR -8[rbp]
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	my_realloc, .-my_realloc
	.globl	my_free
	.type	my_free, @function
my_free:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -40[rbp], rdi
	cmp	QWORD PTR -40[rbp], 0
	je	.L43
	mov	rax, QWORD PTR -40[rbp]
	sub	rax, 16
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR free_list[rip]
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	jmp	.L36
.L38:
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
.L36:
	cmp	QWORD PTR -24[rbp], 0
	je	.L37
	mov	rax, QWORD PTR -24[rbp]
	cmp	rax, QWORD PTR -8[rbp]
	jb	.L38
.L37:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	lea	rdx, 16[rax]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	cmp	QWORD PTR -24[rbp], rax
	jne	.L39
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	add	rax, rdx
	lea	rdx, 16[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L40
.L39:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rax], rdx
.L40:
	cmp	QWORD PTR -16[rbp], 0
	je	.L41
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	lea	rdx, 16[rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	cmp	QWORD PTR -8[rbp], rax
	jne	.L41
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	add	rax, rdx
	lea	rdx, 16[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L33
.L41:
	cmp	QWORD PTR -16[rbp], 0
	je	.L42
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L33
.L42:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR free_list[rip], rax
	jmp	.L33
.L43:
	nop
.L33:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	my_free, .-my_free
	.section	.rodata
.LC0:
	.string	"Bella l\303\254!"
.LC1:
	.string	"NoFree"
.LC2:
	.string	"Un'altra stringa!"
.LC3:
	.string	"Altra stringa!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	eax, 0
	call	init_mem_pool
	mov	edi, 33
	call	my_malloc
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	je	.L45
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 0
	call	sprintf@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	puts@PLT
.L45:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	my_free
	mov	edi, 17
	call	my_malloc
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	je	.L46
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 0
	call	sprintf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	puts@PLT
.L46:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	my_free
	mov	edi, 49
	call	my_malloc
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	je	.L47
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 0
	call	sprintf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	puts@PLT
.L47:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	my_free
	mov	edi, 49
	call	my_malloc
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	je	.L48
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 0
	call	sprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	puts@PLT
.L48:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	my_free
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.local	current_break.0
	.comm	current_break.0,8,8
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
