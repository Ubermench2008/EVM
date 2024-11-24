#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>
#include <stdint.h>

double* createZeroMatrix(int N) {
    double* matrix = (double*)calloc(N * N, sizeof(double));
    if (matrix == NULL) {
        exit(EXIT_FAILURE);
    }
    return matrix;
}

double* createIdentityMatrix(int N) {
    double* I = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        I[i * N + i] = 1.0;
    }
    return I;
}

double* transpose(const double* A, int N) {
    double* AT = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            AT[j * N + i] = A[i * N + j];
        }
    }
    return AT;
}

double* multiply(const double* A, const double* B, int N) {
    double* C = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        for (int k = 0; k < N; ++k) {
            double a_ik = A[i * N + k];
            for (int j = 0; j < N; ++j) {
                C[i * N + j] += a_ik * B[k * N + j];
            }
        }
    }
    return C;
}

double* add(const double* A, const double* B, int N) {
    double* C = createZeroMatrix(N);
    for (int i = 0; i < N * N; ++i) {
        C[i] = A[i] + B[i];
    }
    return C;
}

double* scalarMultiply(double scalar, const double* A, int N) {
    double* B = createZeroMatrix(N);
    for (int i = 0; i < N * N; ++i) {
        B[i] = scalar * A[i];
    }
    return B;
}

double norm1(const double* A, int N) {
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

double normInf(const double* A, int N) {
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

void printMatrix(const double* A, int N, const char* description) {
    printf("%s:\n", description);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            printf("%10.6lf ", A[i * N + j]);
        }
        printf("\n");
    }
}

double* generateRandomMatrix(int N, unsigned int seed) {
    double* A = createZeroMatrix(N);
    srand(seed);
    for (int i = 0; i < N * N; ++i) {
        A[i] = ((double)rand() / RAND_MAX) * 100.0;
    }
    return A;
}

int main(int argc, char* argv[]) {
    int N, M;
    int generate = 0;

    if (argc > 1) {
        generate = atoi(argv[1]);
    }

    printf("Введите N: ");
    if (scanf("%d", &N) != 1 || N <= 0) {
        fprintf(stderr, "Некорректный ввод N\n");
        return EXIT_FAILURE;
    }

    printf("Введите M: ");
    if (scanf("%d", &M) != 1 || M <= 0) {
        fprintf(stderr, "Некорректный ввод M\n");
        return EXIT_FAILURE;
    }

    double* A = NULL;

    if (generate == 1) {
        A = generateRandomMatrix(N, time(NULL));
        if (N <= 20){
            printMatrix(A, N, "Сгенерированная матрица A");
        }
    } else {
        A = createZeroMatrix(N);
        printf("Введите матрицу A (%d элементов):\n", N * N);
        for (int i = 0; i < N * N; ++i) {
            if (scanf("%lf", &A[i]) != 1) {
                free(A);
                return EXIT_FAILURE;
            }
        }
    }

    struct timespec start, end;
    if (clock_gettime(CLOCK_MONOTONIC, &start) == -1) {
        free(A);
        return EXIT_FAILURE;
    }

    double normA1 = norm1(A, N);
    double normAInf = normInf(A, N);
    double s = normA1 * normAInf;

    double* AT = transpose(A, N);
    double* B = scalarMultiply(1.0 / s, AT, N);
    free(AT);

    double* BA = multiply(B, A, N);
    double* I = createIdentityMatrix(N);
    double* BA_neg = scalarMultiply(-1.0, BA, N);
    free(BA);

    double* R = add(I, BA_neg, N);
    free(BA_neg);
    free(I);

    double* S = createIdentityMatrix(N);
    double* R_power = createIdentityMatrix(N);

    for (int k = 1; k < M; ++k) {
        double* temp = multiply(R_power, R, N);
        double* new_S = add(S, temp, N);
        free(S);
        free(temp);
        S = new_S;
    }
    free(R_power);

    double* A_inv = multiply(S, B, N);
    free(S);
    free(B);

    if (clock_gettime(CLOCK_MONOTONIC, &end) == -1) {
        free(A_inv);
        free(A);
        return EXIT_FAILURE;
    }

    double elapsed_time = (end.tv_sec - start.tv_sec) * 1000.0;
    elapsed_time += (end.tv_nsec - start.tv_nsec) / 1.0e6;

    if (N <= 20){
        printMatrix(A_inv, N, "A_inv");
    }

    printf("Время вычислений: %.3lf миллисекунд\n", elapsed_time);

    double* product = multiply(A_inv, A, N);

    if (N <= 20){
        printMatrix(product, N, "A_inv * A");
    }

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

    printf("Max модуль разности (A_inv * A) и I: %.6lf\n", maxDifference);
    printf("Ячейка: [%d, %d]\n", ind1, ind2);

    free(A);
    free(R);
    free(A_inv);
    free(product);
    free(Identity);

    return 0;
}
