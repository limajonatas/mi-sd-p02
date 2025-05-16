.global matriz_sub_n
/*
  * void matriz_sub_n(unsigned char *A, unsigned char *B, unsigned char *C, int N)
  * Subtrai elemento a elemento das matrizes A e B de tamanho NxN, armazena o resultado em C.
  * N não pode exceder 5 (NxN <= 25).
  *
  * Argumentos:
  *   r0: ponteiro para matriz A
  *   r1: ponteiro para matriz B
  *   r2: ponteiro para matriz C
  *   r3: N (tamanho da matriz)
  * 
  * Registradores usados:
  * r4 salvar para o total de elementos na matriz
  * r5 como índice (i)
  * r6 para salvar dados, inclusive da subtração
  * r7 para salvar dado vindo da matriz B
  */

matriz_sub_n:
    push    {r4-r7, lr}   // salva registradores e lr

    cmp     r3, #5     
    bgt     fim_sub         // se r3 > 5, termina

    mul     r4, r3, r3        // r4 = N*N
    mov     r5, #0            // índice i = 0

loop_sub:
    cmp     r5, r4
    bge     fim_sub

    ldrb    r6, [r0, r5]      // r6 = A[i]
    ldrb    r7, [r1, r5]      // r7 = B[i]
    subs    r6, r6, r7        // r6 = A[i] - B[i], subs para atualizar flags
    strb    r6, [r2, r5]      // C[i] = r6 (resultado)

    add     r5, r5, #1
    b       loop_sub

fim_sub:
    pop     {r4-r7, pc}       // restaura e retorna
