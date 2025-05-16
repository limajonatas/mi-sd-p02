.global matriz_soma

/*
  * void matriz_soma(unsigned char *A, unsigned char *B, unsigned char *C)
  * Soma elemento a elemento de matrizes de 5x5, 
  * e seus elementos de 8 bits (total 25 elementos).
  *
  * Argumentos:
  *   r0: ponteiro para matriz A
  *   r1: ponteiro para matriz B
  *   r2: ponteiro para matriz C
  *  
  * Registradores
  *  r3 salva o índice (i)
  *  r4 salvar temporariamente os valores
  *  r5 salvar temporariamente demais valores
  */

matriz_soma:
  push    {r4, lr}       // registrador a ser usado e o lr (endereço de retorno)
  mov     r3, #0         // i = 0

loop:
  cmp     r3, #25
  bge     fim            // i >= 25

  ldrb    r4, [r0, r3]   // r4 recebe de r0 no índice r3 (r4 = A[i])
  ldrb    r5, [r1, r3]   // r5 recebe de r1 no índice r3 (r5 = B[i])
  add     r4, r4, r5     // r4 recebe a soma entre ele e r5 (r4 = A[i] + B[i])
  strb    r4, [r2, r3]   // o resultado de r4 é escrito em r2 no índice r3 (C[i])

  add     r3, r3, #1     // i++
  b       loop           // continua

fim:
  pop     {r4, pc}      // restaura r4 e o endereço de retorno de pc

.section .note.GNU-stack,"",%progbits
