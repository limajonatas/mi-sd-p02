.global matriz_soma_n


.global matriz_soma_n
/*
  * Equivale a:
  *   void matriz_soma_n(unsigned char *A, unsigned char *B, unsigned char *C, int N)
  * Soma elemento a elemento das matrizes A e B de tamanho NxN, armazena o resultado em C.
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
  * r6 para salvar dados, inclusive da soma
  * r7 apenas para salvar dado vindo da matriz B
  */

  matriz_soma_n:
    push    {r4-r7, lr}   //registradores r4 a r7 a seres usados, e lr (endereço de retorn)

    cmp     r3, #5     
    bgt     fim_n         //se r3 > 3

    mul     r4, r3, r3        // r4 = N*N (total de elementos)
    mov     r5, #0            // r5 = índice = 0

  loop_n:
    cmp     r5, r4            // Já somou N*N elementos?
    bge     fim_n             // Se sim, termina

    ldrb    r6, [r0, r5]      // r6 = A[i]
    ldrb    r7, [r1, r5]      // r7 = B[i]
    add     r6, r6, r7        // r6 = A[i] + B[i]
    strb    r6, [r2, r5]      // C[i] = r6

    add     r5, r5, #1        // índice++
    b       loop_n

  fim_n:
    pop     {r4-r7, pc}       // Restaura registradores e retorna

