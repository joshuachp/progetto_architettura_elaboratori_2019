/* ciao mamma */
    .type puts, @function

    .global stampaOpzioni
    .type stampaOpzioni, @function


    .data

STRINGA_OPZIONI:
    .string "horse"
    
    .text

stampaOpzioni: 
    push    %rbp /* salvo */
    mov     %rsp, %rbp /* salvo stack pointer */
    lea     STRINGA_OPZIONI(%rip), %rdi /*carico su rdi ind da stamapare*/
    xor     %rax, %rax
    call    puts
    mov     %rbp, %rsp /* ripristino stack pointer*/
    pop     %rbp /* ripristino base pointer*/
    ret


.global main
.type main, @function

main: 
    push    %rbp
    mov     %rsp, %rbp
    call    stampaOpzioni
    mov     %rbp, %rsp
    pop     %rbp
    xor     %rax, %rax
    ret
