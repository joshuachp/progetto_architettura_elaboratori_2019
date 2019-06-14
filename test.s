	.file	"gestioneVettore.c"
	.text
	.comm	vettore,40,32
	.section	.rodata
	.align 8
.LC0:
	.string	"Inserimento dei %i interi che compongono il vettore...\n"
	.align 8
.LC1:
	.string	"Inserire l'intero in posizione %i: "
.LC2:
	.string	"%i"
	.align 8
.LC3:
	.string	"\nInserire valore operazione (0 uscita, -1 ristampa menu'): "
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$10, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -12(%rbp)
	jmp	.L2
.L3:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -12(%rbp)
.L2:
	cmpl	$9, -12(%rbp)
	jle	.L3
	call	stampaOpzioni
.L4:
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	eseguiOpzione
	movl	-16(%rbp), %eax
	testl	%eax, %eax
	jne	.L4
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC4:
	.string	"\nOPERAZIONI DISPONIBILI"
.LC5:
	.string	"----------------------"
	.align 8
.LC6:
	.string	"1) stampa a video del vettore inserito"
	.align 8
.LC7:
	.string	"2) stampa a video del vettore inserito in ordine inverso"
	.align 8
.LC8:
	.string	"3) stampa il numero di valori pari e dispari inseriti"
	.align 8
.LC9:
	.string	"4) stampa la posizione di un valore inserito dall'utente"
	.align 8
.LC10:
	.string	"5) stampa il massimo valore inserito"
	.align 8
.LC11:
	.string	"6) stampa la posizione del massimo valore inserito"
	.align 8
.LC12:
	.string	"7) stampa il minimo valore inserito"
	.align 8
.LC13:
	.string	"8) stampa la posizione del minimo valore inserito"
	.align 8
.LC14:
	.string	"9) stampa il valore inserito con maggior frequenza"
	.align 8
.LC15:
	.string	"10) stampa la media intera dei valori inseriti"
	.text
	.globl	stampaOpzioni
	.type	stampaOpzioni, @function
stampaOpzioni:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	stampaOpzioni, .-stampaOpzioni
	.section	.rodata
.LC16:
	.string	"Uscita dall'applicazione..."
	.align 8
.LC17:
	.string	"Numero di valori pari inseriti: %i\n"
	.align 8
.LC18:
	.string	"Numero di valori dispari inseriti: %i\n"
	.align 8
.LC19:
	.string	"Inserire l'intero da cercare: "
.LC20:
	.string	"Posizione del valore %i: %i\n"
.LC21:
	.string	"Valore %i non trovato\n"
.LC22:
	.string	"Massimo valore inserito: %i\n"
	.align 8
.LC23:
	.string	"Posizione del massimo valore inserito: %i\n"
.LC24:
	.string	"Minimo valore inserito: %i\n"
	.align 8
.LC25:
	.string	"Posizione del minimo valore inserito: %i\n"
	.align 8
.LC26:
	.string	"Valore inserito con maggior frequenza: %i\n"
.LC27:
	.string	"Media valori: %i\n"
	.align 8
.LC28:
	.string	"Opzione non supportata dall'applicazione!"
	.text
	.globl	eseguiOpzione
	.type	eseguiOpzione, @function
eseguiOpzione:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movb	$1, -49(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	movl	-68(%rbp), %eax
	addl	$1, %eax
	cmpl	$11, %eax
	ja	.L9
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L11(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L11(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L11:
	.long	.L22-.L11
	.long	.L21-.L11
	.long	.L20-.L11
	.long	.L19-.L11
	.long	.L18-.L11
	.long	.L17-.L11
	.long	.L16-.L11
	.long	.L15-.L11
	.long	.L14-.L11
	.long	.L13-.L11
	.long	.L12-.L11
	.long	.L10-.L11
	.text
.L21:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	jmp	.L23
.L20:
	movb	$0, -49(%rbp)
.L19:
	movzbl	-49(%rbp), %eax
	movl	%eax, %edi
	call	stampaVettore
	jmp	.L23
.L18:
	call	numeroPari
	movl	%eax, -44(%rbp)
	movl	$10, %eax
	subl	-44(%rbp), %eax
	movl	%eax, -40(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC18(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L17:
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-48(%rbp), %eax
	movl	%eax, %edi
	call	cercaValore
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	js	.L24
	movl	-36(%rbp), %eax
	leal	1(%rax), %edx
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC20(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L24:
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC21(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L16:
	call	calcolaMax
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC22(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L15:
	call	posizioneMax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L14:
	call	calcolaMin
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L13:
	call	posizioneMin
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L12:
	call	valoreFrequente
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L10:
	call	calcolaMediaIntera
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC27(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L9:
	leaq	.LC28(%rip), %rdi
	call	puts@PLT
.L22:
	call	stampaOpzioni
	nop
.L23:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	eseguiOpzione, .-eseguiOpzione
	.section	.rodata
.LC29:
	.string	"Valori inseriti:"
.LC30:
	.string	"Valore %i: %i\n"
	.align 8
.LC31:
	.string	"Valori inseriti (ordine di inserimento invertito):"
	.text
	.globl	stampaVettore
	.type	stampaVettore, @function
stampaVettore:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	movzbl	-20(%rbp), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L28
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	jmp	.L29
.L30:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	-4(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L29:
	cmpl	$9, -4(%rbp)
	jle	.L30
	jmp	.L34
.L28:
	leaq	.LC31(%rip), %rdi
	call	puts@PLT
	movl	$9, -4(%rbp)
	jmp	.L32
.L33:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	-4(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	subl	$1, -4(%rbp)
.L32:
	cmpl	$0, -4(%rbp)
	jns	.L33
.L34:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	stampaVettore, .-stampaVettore
	.globl	numeroPari
	.type	numeroPari, @function
numeroPari:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L36
.L38:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L37
	addl	$1, -4(%rbp)
.L37:
	addl	$1, -8(%rbp)
.L36:
	cmpl	$9, -8(%rbp)
	jle	.L38
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	numeroPari, .-numeroPari
	.globl	cercaValore
	.type	cercaValore, @function
cercaValore:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$-1, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L41
.L44:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -20(%rbp)
	jne	.L42
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L43
.L42:
	addl	$1, -8(%rbp)
.L41:
	cmpl	$9, -8(%rbp)
	jle	.L44
.L43:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	cercaValore, .-cercaValore
	.globl	calcolaMax
	.type	calcolaMax, @function
calcolaMax:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	vettore(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L47
.L49:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -4(%rbp)
	jge	.L48
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -4(%rbp)
.L48:
	addl	$1, -8(%rbp)
.L47:
	cmpl	$9, -8(%rbp)
	jle	.L49
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	calcolaMax, .-calcolaMax
	.globl	posizioneMax
	.type	posizioneMax, @function
posizioneMax:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	calcolaMax
	movl	%eax, %edi
	call	cercaValore
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	posizioneMax, .-posizioneMax
	.globl	calcolaMin
	.type	calcolaMin, @function
calcolaMin:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	vettore(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L54
.L56:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L55
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -4(%rbp)
.L55:
	addl	$1, -8(%rbp)
.L54:
	cmpl	$9, -8(%rbp)
	jle	.L56
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	calcolaMin, .-calcolaMin
	.globl	posizioneMin
	.type	posizioneMin, @function
posizioneMin:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	calcolaMin
	movl	%eax, %edi
	call	cercaValore
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	posizioneMin, .-posizioneMin
	.globl	valoreFrequente
	.type	valoreFrequente, @function
valoreFrequente:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$-1, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L61
.L66:
	movl	$0, -16(%rbp)
	jmp	.L62
.L64:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	vettore(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jne	.L63
	addl	$1, -8(%rbp)
.L63:
	addl	$1, -16(%rbp)
.L62:
	cmpl	$9, -16(%rbp)
	jle	.L64
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L65
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -4(%rbp)
.L65:
	movl	$0, -8(%rbp)
	addl	$1, -20(%rbp)
.L61:
	cmpl	$9, -20(%rbp)
	jle	.L66
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	valoreFrequente, .-valoreFrequente
	.globl	calcolaMediaIntera
	.type	calcolaMediaIntera, @function
calcolaMediaIntera:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L69
.L70:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	vettore(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	%eax, -12(%rbp)
	addl	$1, -8(%rbp)
.L69:
	cmpl	$9, -8(%rbp)
	jle	.L70
	movl	-12(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	calcolaMediaIntera, .-calcolaMediaIntera
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
