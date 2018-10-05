	.file	"dms.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "---Latitude/Longitude DD-to-DMS Converter---\12\0"
	.align 4
LC1:
	.ascii "Enter coordinates in decimal form:\0"
LC2:
	.ascii "Latitude: \0"
LC3:
	.ascii "%lf\0"
LC4:
	.ascii "Longitude: \0"
	.align 4
LC8:
	.ascii "Latitude in DMS: %.0f degrees, %.0f minutes, %.6f seconds %c\12\0"
	.align 4
LC9:
	.ascii "Bounds error on latitude... must be [-90,90]\0"
	.align 4
LC12:
	.ascii "Longitude in DMS: %.0f degrees, %.0f minutes, %.6f seconds %c\12\0"
	.align 4
LC13:
	.ascii "Bounds error on longitude... must be [-180,180]\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$80, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_puts
	movl	$LC2, (%esp)
	call	_printf
	leal	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	$LC4, (%esp)
	call	_printf
	leal	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	$10, (%esp)
	call	_putchar
	fldl	64(%esp)
	fldl	LC5
	fucompp
	fnstsw	%ax
	sahf
	jb	L2
	fldl	64(%esp)
	fldl	LC6
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L2
	fldl	64(%esp)
	leal	32(%esp), %eax
	movl	%eax, 16(%esp)
	leal	40(%esp), %eax
	movl	%eax, 12(%esp)
	leal	48(%esp), %eax
	movl	%eax, 8(%esp)
	fstpl	(%esp)
	call	_convertToDMS
	fldl	48(%esp)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L23
	movl	$78, %eax
	jmp	L7
L23:
	movl	$83, %eax
L7:
	movb	%al, 79(%esp)
	movsbl	79(%esp), %eax
	fldl	32(%esp)
	fldl	40(%esp)
	fldl	48(%esp)
	fabs
	fxch	%st(2)
	movl	%eax, 28(%esp)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	jmp	L8
L2:
	movl	$LC9, (%esp)
	call	_puts
L8:
	fldl	56(%esp)
	fldl	LC10
	fucompp
	fnstsw	%ax
	sahf
	jb	L9
	fldl	56(%esp)
	fldl	LC11
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L9
	fldl	56(%esp)
	leal	32(%esp), %eax
	movl	%eax, 16(%esp)
	leal	40(%esp), %eax
	movl	%eax, 12(%esp)
	leal	48(%esp), %eax
	movl	%eax, 8(%esp)
	fstpl	(%esp)
	call	_convertToDMS
	fldl	48(%esp)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L24
	movl	$69, %eax
	jmp	L14
L24:
	movl	$87, %eax
L14:
	movb	%al, 79(%esp)
	movsbl	79(%esp), %eax
	fldl	32(%esp)
	fldl	40(%esp)
	fldl	48(%esp)
	fabs
	fxch	%st(2)
	movl	%eax, 28(%esp)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	jmp	L15
L9:
	movl	$LC13, (%esp)
	call	_puts
L15:
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_convertToDMS
	.def	_convertToDMS;	.scl	2;	.type	32;	.endef
_convertToDMS:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	8(%ebp), %eax
	movl	%eax, -48(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -44(%ebp)
	fldl	-48(%ebp)
	fstpl	(%esp)
	call	_trunc
	fstpl	-16(%ebp)
	fldl	-48(%ebp)
	fsubl	-16(%ebp)
	fabs
	fstpl	-24(%ebp)
	fldl	-24(%ebp)
	fldl	LC15
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_trunc
	fstpl	-32(%ebp)
	fldl	-24(%ebp)
	fldl	LC15
	fmulp	%st, %st(1)
	fsubl	-32(%ebp)
	fldl	LC15
	fmulp	%st, %st(1)
	fstpl	-40(%ebp)
	movl	16(%ebp), %eax
	fldl	-16(%ebp)
	fstpl	(%eax)
	movl	20(%ebp), %eax
	fldl	-32(%ebp)
	fstpl	(%eax)
	movl	24(%ebp), %eax
	fldl	-40(%ebp)
	fstpl	(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.section .rdata,"dr"
	.align 8
LC5:
	.long	0
	.long	1079410688
	.align 8
LC6:
	.long	0
	.long	-1068072960
	.align 8
LC10:
	.long	0
	.long	1080459264
	.align 8
LC11:
	.long	0
	.long	-1067024384
	.align 8
LC15:
	.long	0
	.long	1078853632
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_trunc;	.scl	2;	.type	32;	.endef
