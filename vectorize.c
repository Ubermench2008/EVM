#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>

typedef double v2df __attribute__ ((vector_size (16)));

double* createZeroMatrix(int N) {
    double* matrix = (double*)calloc(N * N, sizeof(double));
    return matrix;
}

double* createIdentityMatrix(int N) {
    double* I = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        I[i * N + i] = 1.0;
    }
    return I;
}

void transpose(double* A, double* AT, int N) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            AT[j * N + i] = A[i * N + j];
        }
    }
}

void multiply(double* A, double* B, double* C, int N) {
    memset(C, 0, N * N * sizeof(double));
    for (int i = 0; i < N; ++i) {
        for (int k = 0; k < N; ++k) {
            double a = A[i * N + k];
            v2df a_vec = {a, a};
            int j = 0;
            for (; j <= N - 2; j += 2) {
                v2df b_vec = {B[k * N + j], B[k * N + j + 1]};
                v2df c_vec = {C[i * N + j], C[i * N + j + 1]};
                c_vec += a_vec * b_vec;
                C[i * N + j] = c_vec[0];
                C[i * N + j + 1] = c_vec[1];
            }
            for (; j < N; ++j) {
                C[i * N + j] += a * B[k * N + j];
            }
        }
    }
}

void add(double* A, double* B, double* C, int N) {
    int size = N * N;
    int i = 0;
    for (; i <= size - 2; i += 2) {
        v2df a_vec = {A[i], A[i + 1]};
        v2df b_vec = {B[i], B[i + 1]};
        v2df c_vec = a_vec + b_vec;
        C[i] = c_vec[0];
        C[i + 1] = c_vec[1];
    }
    for (; i < size; ++i) {
        C[i] = A[i] + B[i];
    }
}

void scalarMultiply(double scalar, double* A, double* B, int N) {
    int size = N * N;
    int i = 0;
    v2df scalar_vec = {scalar, scalar};
    for (; i <= size - 2; i += 2) {
        v2df a_vec = {A[i], A[i + 1]};
        v2df b_vec = scalar_vec * a_vec;
        B[i] = b_vec[0];
        B[i + 1] = b_vec[1];
    }
    for (; i < size; ++i) {
        B[i] = scalar * A[i];
    }
}

double* generateRandomMatrix(int N) {
    double* A = createZeroMatrix(N);
    for (int i = 0; i < N * N; ++i) {
        A[i] = ((double)rand() / RAND_MAX) * 100.0;
    }
    return A;
}

//||A||_1
double norm1(double* A, int N) {
    double maxSum = 0.0;
    for (int j = 0; j < N; ++j) {
        double columnSum = 0.0;
        for (int i = 0; i < N; ++i) {
            columnSum += fabs(A[i * N + j]);
        }
        if (columnSum > maxSum) {
            maxSum = columnSum;
        }
    }
    return maxSum;
}

//||A||_inf
double normInf(double* A, int N) {
    double maxSum = 0.0;
    for (int i = 0; i < N; ++i) {
        double rowSum = 0.0;
        for (int j = 0; j < N; ++j) {
            rowSum += fabs(A[i * N + j]);
        }
        if (rowSum > maxSum) {
            maxSum = rowSum;
        }
    }
    return maxSum;
}

void printMatrix(double* A, int N) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            printf("%10.6f ", A[i * N + j]);
        }
        printf("\n");
    }
}

int main(int argc, char* argv[]) {
    int N, M;
    int generate = 0;

    if (argc > 1) {
        generate = atoi(argv[1]);
    }

    printf("Введите размер матрицы N: ");
    if (scanf("%d", &N) != 1 || N <= 0) {
        return EXIT_FAILURE;
    }

    printf("Введите число членов ряда M: ");
    if (scanf("%d", &M) != 1 || M <= 0) {
        return EXIT_FAILURE;
    }

    double* A = NULL;

    if (generate == 1) {
        srand(time(NULL));
        A = generateRandomMatrix(N);
        printf("A:\n");
        if (N <= 20){
            printMatrix(A, N);
        } else{
            printf("Матрица слишком большая(..\n");
        }
    } else {
        A = createZeroMatrix(N);
        printf("Введите элементы матрицы A (%d элементов):\n", N * N);
        for (int i = 0; i < N * N; ++i) {
            if (scanf("%lf", &A[i]) != 1) {
                free(A);
                return EXIT_FAILURE;
            }
        }
    }

    struct timespec start, end;

    clock_gettime(CLOCK_MONOTONIC, &start);

    double normA1 = norm1(A, N);
    double normAInf = normInf(A, N);
    double s = normA1 * normAInf;

    //B = (1/s) * A^T
    double* AT = createZeroMatrix(N);
    transpose(A, AT, N);
    double* B = createZeroMatrix(N);
    scalarMultiply(1.0 / s, AT, B, N);

    //R = I - B * A
    double* BA = createZeroMatrix(N);
    multiply(B, A, BA, N);
    double* I = createIdentityMatrix(N);
    double* BA_neg = createZeroMatrix(N);
    scalarMultiply(-1.0, BA, BA_neg, N);
    double* R = createZeroMatrix(N);
    add(I, BA_neg, R, N);

    double normR = normInf(R, N);
    printf("Норма матрицы R: %f\n", normR);

    //S = I + R + R^2 + ... + R^(M-1)
    double* S = createIdentityMatrix(N);
    double* R_power = createZeroMatrix(N);
    memcpy(R_power, R, N * N * sizeof(double));
    double* temp = createZeroMatrix(N);

    for (int k = 1; k < M; ++k) {
        //S = S + R_power
        add(S, R_power, temp, N);
        memcpy(S, temp, N * N * sizeof(double));
        //R_power = R_power * R
        multiply(R_power, R, temp, N);
        memcpy(R_power, temp, N * N * sizeof(double));
    }

    //A_inv = S * B
    double* A_inv = createZeroMatrix(N);
    multiply(S, B, A_inv, N);

    clock_gettime(CLOCK_MONOTONIC, &end);

    double elapsed_sec = end.tv_sec - start.tv_sec;
    double elapsed_nsec = end.tv_nsec - start.tv_nsec;
    double elapsed_time = elapsed_sec * 1000.0 + elapsed_nsec / 1.0e6;

    printf("Обратная матрица A_inv:\n");
    if (N <= 20){
        printMatrix(A_inv, N);
    } else{
        printf("Матрица слишком большая(..\n");
    }

    printf("Время вычислений: %.3f миллисекунд\n", elapsed_time);

    double* product = createZeroMatrix(N);
    multiply(A_inv, A, product, N);

    double* Identity = createIdentityMatrix(N);

    int ind1 = 0;
    int ind2 = 0;
    double maxDifference = 0.0;

    for (int i = 0; i < N * N; ++i) {
        double diff = fabs(product[i] - Identity[i]);
        if (diff > maxDifference) {
            maxDifference = diff;
            ind1 = i / N;   
            ind2 = i % N;
        }
    }

    printf("Максимальный модуль разности между (A_inv * A) и I: %.6f\nВ Ячейке: [%d, %d]\n", maxDifference, ind1, ind2);

    free(A);
    free(AT);
    free(B);
    free(BA);
    free(I);
    free(BA_neg);
    free(R);
    free(S);
    free(R_power);
    free(temp);
    free(A_inv);
    free(product);
    free(Identity);

    return 0;
}
