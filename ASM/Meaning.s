	.file	"Meaning.c"
	.intel_syntax noprefix
	.text
	.globl	block
	.bss
	.align 4
	.type	block, @object
	.size	block, 4
block:
	.zero	4
	.globl	mutex
	.align 32
	.type	mutex, @object
	.size	mutex, 40
mutex:
	.zero	40
	.section	.rodata
.LC0:
	.string	"msr %llx\n"
	.text
	.globl	thrd_func
	.type	thrd_func, @function
thrd_func:
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
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	print_msg
#APP
# 28 "Meaning.c" 1
	rdtsc
	shl $32, %rdx
	or %rdx, rax
# 0 "" 2
#NO_APP
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 8
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR [rax], rdx
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	pthread_exit@PLT
	.cfi_endproc
.LFE6:
	.size	thrd_func, .-thrd_func
	.section	.rodata
.LC1:
	.string	"Thread 0"
.LC2:
	.string	"Thread 1"
.LC3:
	.string	"Thread 2"
.LC4:
	.string	"Diff 0 e 1: %llu\n"
.LC5:
	.string	"Diff 1 e 2: %llu\n"
.LC6:
	.string	"Diff 0 e 2: %llu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 144
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC1[rip]
	mov	QWORD PTR -80[rbp], rax
	lea	rax, .LC2[rip]
	mov	QWORD PTR -72[rbp], rax
	lea	rax, .LC3[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rdx, QWORD PTR -80[rbp]
	lea	rax, -128[rbp]
	mov	rcx, rdx
	lea	rdx, thrd_func[rip]
	mov	esi, 0
	mov	rdi, rax
	call	pthread_create@PLT
	mov	rdx, QWORD PTR -72[rbp]
	lea	rax, -120[rbp]
	mov	rcx, rdx
	lea	rdx, thrd_func[rip]
	mov	esi, 0
	mov	rdi, rax
	call	pthread_create@PLT
	mov	rdx, QWORD PTR -64[rbp]
	lea	rax, -112[rbp]
	mov	rcx, rdx
	lea	rdx, thrd_func[rip]
	mov	esi, 0
	mov	rdi, rax
	call	pthread_create@PLT
	mov	rax, QWORD PTR -128[rbp]
	lea	rdx, -104[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	pthread_join@PLT
	mov	rax, QWORD PTR -120[rbp]
	lea	rdx, -96[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	pthread_join@PLT
	mov	rax, QWORD PTR -112[rbp]
	lea	rdx, -88[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	pthread_join@PLT
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -96[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -88[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -48[rbp]
	cmp	QWORD PTR -56[rbp], rax
	jnb	.L3
	mov	rax, QWORD PTR -48[rbp]
	sub	rax, QWORD PTR -56[rbp]
	jmp	.L4
.L3:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR -48[rbp]
.L4:
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	cmp	QWORD PTR -48[rbp], rax
	jnb	.L5
	mov	rax, QWORD PTR -40[rbp]
	sub	rax, QWORD PTR -48[rbp]
	jmp	.L6
.L5:
	mov	rax, QWORD PTR -48[rbp]
	sub	rax, QWORD PTR -40[rbp]
.L6:
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	cmp	QWORD PTR -56[rbp], rax
	jnb	.L7
	mov	rax, QWORD PTR -40[rbp]
	sub	rax, QWORD PTR -56[rbp]
	jmp	.L8
.L7:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR -40[rbp]
.L8:
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, eax
	movsx	rax, ecx
	imul	rax, rax, 715827883
	shr	rax, 32
	mov	rdx, rax
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	DWORD PTR -132[rbp], edx
	mov	eax, DWORD PTR -132[rbp]
	mov	rdi, rax
	call	Better_Pointer
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.globl	print_msg
	.type	print_msg, @function
print_msg:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	print_msg, .-print_msg
	.globl	Good_Pointer
	.type	Good_Pointer, @function
Good_Pointer:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, 0
	mov	BYTE PTR [rax], 0
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Good_Pointer, .-Good_Pointer
	.section	.rodata
.LC7:
	.string	"BP: %d\n"
.LC8:
	.string	"YOU DONE GOOFED NOW!"
.LC9:
	.string	"BP2: %d\n"
	.text
	.globl	Better_Pointer
	.type	Better_Pointer, @function
Better_Pointer:
.LFB10:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 1056
	mov	QWORD PTR -1048[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rdx, -1040[rbp]
	mov	rax, QWORD PTR -1048[rbp]
	mov	BYTE PTR [rdx], al
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	cmp	QWORD PTR -1048[rbp], 0
	jne	.L16
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rdx, QWORD PTR -1048[rbp]
	mov	rax, QWORD PTR -1048[rbp]
	mov	BYTE PTR [rdx], al
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L16:
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	Better_Pointer, .-Better_Pointer
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
