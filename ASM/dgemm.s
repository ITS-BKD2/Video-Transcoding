	.file	"dgemm.c"
	.intel_syntax noprefix
	.text
	.globl	dgemm
	.type	dgemm, @function
dgemm:
.LFB5039:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	and	rsp, -32
	sub	rsp, 168
	mov	QWORD PTR -96[rsp], rdi
	mov	QWORD PTR -104[rsp], rsi
	mov	QWORD PTR -112[rsp], rdx
	mov	QWORD PTR -120[rsp], rcx
	mov	QWORD PTR -80[rsp], 0
	jmp	.L2
.L12:
	mov	QWORD PTR -72[rsp], 0
	jmp	.L3
.L11:
	mov	rax, QWORD PTR -72[rsp]
	imul	rax, QWORD PTR -96[rsp]
	mov	rdx, rax
	mov	rax, QWORD PTR -80[rsp]
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -120[rsp]
	add	rax, rdx
	mov	QWORD PTR -56[rsp], rax
	mov	rax, QWORD PTR -56[rsp]
	vmovapd	ymm0, YMMWORD PTR [rax]
	vmovapd	YMMWORD PTR -24[rsp], ymm0
	mov	QWORD PTR -64[rsp], 0
	jmp	.L5
.L10:
	mov	rax, QWORD PTR -72[rsp]
	imul	rax, QWORD PTR -96[rsp]
	mov	rdx, rax
	mov	rax, QWORD PTR -64[rsp]
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -112[rsp]
	add	rax, rdx
	mov	QWORD PTR -40[rsp], rax
	mov	rax, QWORD PTR -40[rsp]
	vbroadcastsd	ymm0, QWORD PTR [rax]
	nop
	mov	rax, QWORD PTR -64[rsp]
	imul	rax, QWORD PTR -96[rsp]
	mov	rdx, rax
	mov	rax, QWORD PTR -80[rsp]
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -104[rsp]
	add	rax, rdx
	mov	QWORD PTR -48[rsp], rax
	mov	rax, QWORD PTR -48[rsp]
	vmovapd	ymm1, YMMWORD PTR [rax]
	vmovapd	YMMWORD PTR 72[rsp], ymm1
	vmovapd	YMMWORD PTR 104[rsp], ymm0
	vmovapd	ymm0, YMMWORD PTR 72[rsp]
	vmulpd	ymm0, ymm0, YMMWORD PTR 104[rsp]
	vmovapd	ymm1, YMMWORD PTR -24[rsp]
	vmovapd	YMMWORD PTR 8[rsp], ymm1
	vmovapd	YMMWORD PTR 40[rsp], ymm0
	vmovapd	ymm0, YMMWORD PTR 8[rsp]
	vaddpd	ymm0, ymm0, YMMWORD PTR 40[rsp]
	vmovapd	YMMWORD PTR -24[rsp], ymm0
	add	QWORD PTR -64[rsp], 1
.L5:
	mov	rax, QWORD PTR -64[rsp]
	cmp	rax, QWORD PTR -96[rsp]
	jb	.L10
	mov	rax, QWORD PTR -72[rsp]
	imul	rax, QWORD PTR -96[rsp]
	mov	rdx, rax
	mov	rax, QWORD PTR -80[rsp]
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -120[rsp]
	add	rax, rdx
	mov	QWORD PTR -32[rsp], rax
	vmovapd	ymm0, YMMWORD PTR -24[rsp]
	vmovapd	YMMWORD PTR 136[rsp], ymm0
	mov	rax, QWORD PTR -32[rsp]
	vmovapd	ymm0, YMMWORD PTR 136[rsp]
	vmovapd	YMMWORD PTR [rax], ymm0
	nop
	add	QWORD PTR -72[rsp], 1
.L3:
	mov	rax, QWORD PTR -72[rsp]
	cmp	rax, QWORD PTR -96[rsp]
	jb	.L11
	add	QWORD PTR -80[rsp], 4
.L2:
	mov	rax, QWORD PTR -80[rsp]
	cmp	rax, QWORD PTR -96[rsp]
	jb	.L12
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5039:
	.size	dgemm, .-dgemm
	.globl	main
	.type	main, @function
main:
.LFB5040:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, 0
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5040:
	.size	main, .-main
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
