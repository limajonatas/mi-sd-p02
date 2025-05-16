#include <stdio.h>
#include "matrix_ops.h"

int main()
{
  unsigned char A[25] = {
      1, 2, 3, 4, 5,
      6, 7, 8, 9, 10,
      11, 12, 13, 14, 15,
      16, 17, 18, 19, 20,
      21, 22, 23, 24, 25};
  unsigned char B[25] = {
      10, 20, 30, 40, 50,
      60, 70, 80, 90, 100,
      110, 120, 130, 140, 150,
      160, 170, 180, 190, 200,
      210, 220, 230, 240, 250};
  unsigned char C[25];

  matriz_soma(A, B, C); // chama a função em Assembly

  printf("Resultado da soma das matrizes:\n");
  for (int i = 0; i < 25; i++)
  {
    printf("%3d ", C[i]);
    if ((i + 1) % 5 == 0)
      printf("\n");
  }

  return 0;
}
