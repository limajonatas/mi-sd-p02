.global matriz_sub_n

/*
 * void matriz_sub_n(unsigned char *A, unsigned char *B, unsigned char *C, int N)
 * Subtrai elemento a elemento de matrizes NxN (máx N=5),
 * elementos 8 bits (total N*N).
 *
 * Argumentos:
 *   r0: ponteiro para matriz A
 *   r1: ponteiro para matriz B
 *   r2: ponteiro para matriz C
 *   r3: N (tamanho da matriz)
 *
 * Registradores usados:
 *   r4: total de elementos (N*N)
 *   r5: índice (i)
 *   r6: temporário para valor A[i] - B[i]
 *   r7: temporário para valor B[i]
 */

matriz_sub_n:
  push {r4-r7, lr}      // salva registradores e lr

  cmp r3, #5
  bgt fim_sub           // se N > 5, sai (pode alterar para tratar erro)

  mul r4, r3, r3        // total elementos = N*N
  mov r5, #0            // índice i = 0

loop_sub:
  cmp r5, r4
  bge fim_sub           // terminou

  ldrb r6, [r0, r5]     // r6 = A[i]
  ldrb r7, [r1, r5]     // r7 = B[i]
  subs r6, r6, r7       // r6 = A[i] - B[i] (subs atualiza flags)
  strb r6, [r2, r5]     // salva resultado em C[i]

  add r5, r5, #1
  b loop_sub

fim_sub:
  pop {r4-r7, pc}       // restaura e retorna
