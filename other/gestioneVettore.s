	.file	"gestioneVettore.c"
	.text
	.comm	vettore,40,32
	.section	.rodata
	.align 4
.LC0:
	.string	"Inserimento dei %i interi che compongono il vettore...\n"
	.align 4
.LC1:
	.string	"Inserire l'intero in posizione %i: "
.LC2:
	.string	"%i"
	.align 4
.LC3:
	.string	"\nInserire valore operazione (0 uscita, -1 ristampa menu'): "
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$20, %esp
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	subl	$8, %esp
	pushl	$10
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	movl	$0, -16(%ebp)
	jmp	.L2
.L3:
	movl	-16(%ebp), %eax
	addl	$1, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	movl	-16(%ebp), %eax
	sall	$2, %eax
	addl	$vettore, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	__isoc99_scanf
	addl	$16, %esp
	addl	$1, -16(%ebp)
.L2:
	cmpl	$9, -16(%ebp)
	jle	.L3
	call	stampaOpzioni
.L4:
	subl	$12, %esp
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	subl	$8, %esp
	leal	-20(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	call	__isoc99_scanf
	addl	$16, %esp
	movl	-20(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	eseguiOpzione
	addl	$16, %esp
	movl	-20(%ebp), %eax
	testl	%eax, %eax
	jne	.L4
	movl	$0, %eax
	movl	-12(%ebp), %edx
	xorl	%gs:20, %edx
	je	.L6
	call	__stack_chk_fail
.L6:
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC4:
	.string	"\nOPERAZIONI DISPONIBILI"
.LC5:
	.string	"----------------------"
	.align 4
.LC6:
	.string	"1) stampa a video del vettore inserito"
	.align 4
.LC7:
	.string	"2) stampa a video del vettore inserito in ordine inverso"
	.align 4
.LC8:
	.string	"3) stampa il numero di valori pari e dispari inseriti"
	.align 4
.LC9:
	.string	"4) stampa la posizione di un valore inserito dall'utente"
	.align 4
.LC10:
	.string	"5) stampa il massimo valore inserito"
	.align 4
.LC11:
	.string	"6) stampa la posizione del massimo valore inserito"
	.align 4
.LC12:
	.string	"7) stampa il minimo valore inserito"
	.align 4
.LC13:
	.string	"8) stampa la posizione del minimo valore inserito"
	.align 4
.LC14:
	.string	"9) stampa il valore inserito con maggior frequenza"
	.align 4
.LC15:
	.string	"10) stampa la media intera dei valori inseriti"
	.text
	.globl	stampaOpzioni
	.type	stampaOpzioni, @function
stampaOpzioni:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	subl	$12, %esp
	pushl	$.LC4
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC5
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC6
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC7
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC8
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC9
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC10
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC11
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC12
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC13
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC14
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC15
	call	puts
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	stampaOpzioni, .-stampaOpzioni
	.section	.rodata
.LC16:
	.string	"Uscita dall'applicazione..."
	.align 4
.LC17:
	.string	"Numero di valori pari inseriti: %i\n"
	.align 4
.LC18:
	.string	"Numero di valori dispari inseriti: %i\n"
	.align 4
.LC19:
	.string	"Inserire l'intero da cercare: "
.LC20:
	.string	"Posizione del valore %i: %i\n"
.LC21:
	.string	"Valore %i non trovato\n"
.LC22:
	.string	"Massimo valore inserito: %i\n"
	.align 4
.LC23:
	.string	"Posizione del massimo valore inserito: %i\n"
.LC24:
	.string	"Minimo valore inserito: %i\n"
	.align 4
.LC25:
	.string	"Posizione del minimo valore inserito: %i\n"
	.align 4
.LC26:
	.string	"Valore inserito con maggior frequenza: %i\n"
.LC27:
	.string	"Media valori: %i\n"
	.align 4
.LC28:
	.string	"Opzione non supportata dall'applicazione!"
	.text
	.globl	eseguiOpzione
	.type	eseguiOpzione, @function
eseguiOpzione:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movb	$1, -53(%ebp)
	subl	$12, %esp
	pushl	$10
	call	putchar
	addl	$16, %esp
	movl	8(%ebp), %eax
	addl	$1, %eax
	cmpl	$11, %eax
	ja	.L9
	movl	.L11(,%eax,4), %eax
	jmp	*%eax
	.section	.rodata
	.align 4
	.align 4
.L11:
	.long	.L22
	.long	.L21
	.long	.L20
	.long	.L19
	.long	.L18
	.long	.L17
	.long	.L16
	.long	.L15
	.long	.L14
	.long	.L13
	.long	.L12
	.long	.L10
	.text
.L21:
	subl	$12, %esp
	pushl	$.LC16
	call	puts
	addl	$16, %esp
	jmp	.L23
.L20:
	movb	$0, -53(%ebp)
.L19:
	movzbl	-53(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	stampaVettore
	addl	$16, %esp
	jmp	.L23
.L18:
	call	numeroPari
	movl	%eax, -48(%ebp)
	movl	$10, %eax
	subl	-48(%ebp), %eax
	movl	%eax, -44(%ebp)
	subl	$8, %esp
	pushl	-48(%ebp)
	pushl	$.LC17
	call	printf
	addl	$16, %esp
	subl	$8, %esp
	pushl	-44(%ebp)
	pushl	$.LC18
	call	printf
	addl	$16, %esp
	jmp	.L23
.L17:
	subl	$12, %esp
	pushl	$.LC19
	call	printf
	addl	$16, %esp
	subl	$8, %esp
	leal	-52(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	call	__isoc99_scanf
	addl	$16, %esp
	movl	-52(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	cercaValore
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	js	.L24
	movl	-40(%ebp), %eax
	leal	1(%eax), %edx
	movl	-52(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	pushl	$.LC20
	call	printf
	addl	$16, %esp
	jmp	.L23
.L24:
	movl	-52(%ebp), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC21
	call	printf
	addl	$16, %esp
	jmp	.L23
.L16:
	call	calcolaMax
	movl	%eax, -36(%ebp)
	subl	$8, %esp
	pushl	-36(%ebp)
	pushl	$.LC22
	call	printf
	addl	$16, %esp
	jmp	.L23
.L15:
	call	posizioneMax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	subl	$8, %esp
	pushl	-32(%ebp)
	pushl	$.LC23
	call	printf
	addl	$16, %esp
	jmp	.L23
.L14:
	call	calcolaMin
	movl	%eax, -28(%ebp)
	subl	$8, %esp
	pushl	-28(%ebp)
	pushl	$.LC24
	call	printf
	addl	$16, %esp
	jmp	.L23
.L13:
	call	posizioneMin
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	subl	$8, %esp
	pushl	-24(%ebp)
	pushl	$.LC25
	call	printf
	addl	$16, %esp
	jmp	.L23
.L12:
	call	valoreFrequente
	movl	%eax, -20(%ebp)
	subl	$8, %esp
	pushl	-20(%ebp)
	pushl	$.LC26
	call	printf
	addl	$16, %esp
	jmp	.L23
.L10:
	call	calcolaMediaIntera
	movl	%eax, -16(%ebp)
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	$.LC27
	call	printf
	addl	$16, %esp
	jmp	.L23
.L9:
	subl	$12, %esp
	pushl	$.LC28
	call	puts
	addl	$16, %esp
.L22:
	call	stampaOpzioni
	nop
.L23:
	nop
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L26
	call	__stack_chk_fail
.L26:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	eseguiOpzione, .-eseguiOpzione
	.section	.rodata
.LC29:
	.string	"Valori inseriti:"
.LC30:
	.string	"Valore %i: %i\n"
	.align 4
.LC31:
	.string	"Valori inseriti (ordine di inserimento invertito):"
	.text
	.globl	stampaVettore
	.type	stampaVettore, @function
stampaVettore:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movb	%al, -28(%ebp)
	movzbl	-28(%ebp), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L28
	subl	$12, %esp
	pushl	$.LC29
	call	puts
	addl	$16, %esp
	movl	$0, -12(%ebp)
	jmp	.L29
.L30:
	movl	-12(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	movl	-12(%ebp), %edx
	addl	$1, %edx
	subl	$4, %esp
	pushl	%eax
	pushl	%edx
	pushl	$.LC30
	call	printf
	addl	$16, %esp
	addl	$1, -12(%ebp)
.L29:
	cmpl	$9, -12(%ebp)
	jle	.L30
	jmp	.L34
.L28:
	subl	$12, %esp
	pushl	$.LC31
	call	puts
	addl	$16, %esp
	movl	$9, -12(%ebp)
	jmp	.L32
.L33:
	movl	-12(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	movl	-12(%ebp), %edx
	addl	$1, %edx
	subl	$4, %esp
	pushl	%eax
	pushl	%edx
	pushl	$.LC30
	call	printf
	addl	$16, %esp
	subl	$1, -12(%ebp)
.L32:
	cmpl	$0, -12(%ebp)
	jns	.L33
.L34:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	stampaVettore, .-stampaVettore
	.globl	numeroPari
	.type	numeroPari, @function
numeroPari:
.LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L36
.L38:
	movl	-8(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L37
	addl	$1, -4(%ebp)
.L37:
	addl	$1, -8(%ebp)
.L36:
	cmpl	$9, -8(%ebp)
	jle	.L38
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	numeroPari, .-numeroPari
	.globl	cercaValore
	.type	cercaValore, @function
cercaValore:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$-1, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L41
.L44:
	movl	-8(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	cmpl	%eax, 8(%ebp)
	jne	.L42
	movl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L43
.L42:
	addl	$1, -8(%ebp)
.L41:
	cmpl	$9, -8(%ebp)
	jle	.L44
.L43:
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	cercaValore, .-cercaValore
	.globl	calcolaMax
	.type	calcolaMax, @function
calcolaMax:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	vettore, %eax
	movl	%eax, -4(%ebp)
	movl	$1, -8(%ebp)
	jmp	.L47
.L49:
	movl	-8(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	cmpl	%eax, -4(%ebp)
	jge	.L48
	movl	-8(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	movl	%eax, -4(%ebp)
.L48:
	addl	$1, -8(%ebp)
.L47:
	cmpl	$9, -8(%ebp)
	jle	.L49
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	calcolaMax, .-calcolaMax
	.globl	posizioneMax
	.type	posizioneMax, @function
posizioneMax:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	calcolaMax
	pushl	%eax
	call	cercaValore
	addl	$4, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	posizioneMax, .-posizioneMax
	.globl	calcolaMin
	.type	calcolaMin, @function
calcolaMin:
.LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	vettore, %eax
	movl	%eax, -4(%ebp)
	movl	$1, -8(%ebp)
	jmp	.L54
.L56:
	movl	-8(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	cmpl	%eax, -4(%ebp)
	jle	.L55
	movl	-8(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	movl	%eax, -4(%ebp)
.L55:
	addl	$1, -8(%ebp)
.L54:
	cmpl	$9, -8(%ebp)
	jle	.L56
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	calcolaMin, .-calcolaMin
	.globl	posizioneMin
	.type	posizioneMin, @function
posizioneMin:
.LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	calcolaMin
	pushl	%eax
	call	cercaValore
	addl	$4, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	posizioneMin, .-posizioneMin
	.globl	valoreFrequente
	.type	valoreFrequente, @function
valoreFrequente:
.LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	$-1, -12(%ebp)
	movl	$0, -8(%ebp)
	movl	$0, -4(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L61
.L66:
	movl	$0, -16(%ebp)
	jmp	.L62
.L64:
	movl	-20(%ebp), %eax
	movl	vettore(,%eax,4), %edx
	movl	-16(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	cmpl	%eax, %edx
	jne	.L63
	addl	$1, -8(%ebp)
.L63:
	addl	$1, -16(%ebp)
.L62:
	cmpl	$9, -16(%ebp)
	jle	.L64
	movl	-8(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jle	.L65
	movl	-8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-20(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	movl	%eax, -4(%ebp)
.L65:
	movl	$0, -8(%ebp)
	addl	$1, -20(%ebp)
.L61:
	cmpl	$9, -20(%ebp)
	jle	.L66
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	valoreFrequente, .-valoreFrequente
	.globl	calcolaMediaIntera
	.type	calcolaMediaIntera, @function
calcolaMediaIntera:
.LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -12(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L69
.L70:
	movl	-8(%ebp), %eax
	movl	vettore(,%eax,4), %eax
	addl	%eax, -12(%ebp)
	addl	$1, -8(%ebp)
.L69:
	cmpl	$9, -8(%ebp)
	jle	.L70
	movl	-12(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	calcolaMediaIntera, .-calcolaMediaIntera
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
