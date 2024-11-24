#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <cblas.h>
#include <time.h>
#include <sys/time.h>
#include <stdbool.h>
#include <stdint.h>
#include <inttypes.h>

double get_time_in_ms() {
    struct timeval time_now;
    gettimeofday(&time_now, NULL);
    return (double)(time_now.tv_sec) * 1000.0 + (double)(time_now.tv_usec) / 1000.0;
}

double* createZeroMatrix(int N) {
    double* matrix = (double*)calloc(N * N, sizeof(double));
    if (!matrix) {
        fprintf(stderr, "Ошибка выделения памяти для матрицы.\n");
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
    const double alpha = 1.0;
    const double beta = 0.0;
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                N, N, N, alpha,
                A, N,
                B, N,
                beta,
                C, N);
    return C;
}

double* add(const double* A, const double* B, int N) {
    double* C = createZeroMatrix(N);
    cblas_dcopy(N * N, A, 1, C, 1);
    cblas_daxpy(N * N, 1.0, B, 1, C, 1);
    return C;
}

double* scalarMultiply(double scalar, const double* A, int N) {
    double* B = createZeroMatrix(N);
    cblas_dcopy(N * N, A, 1, B, 1);
    cblas_dscal(N * N, scalar, B, 1);
    return B;
}

double* generateRandomMatrix(int N) {
    double* A = createZeroMatrix(N);
    srand(time(NULL));
    for (int i = 0; i < N * N; ++i) {
        A[i] = ((double)rand() / RAND_MAX) * 100.0;
    }
    return A;
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

void printMatrix(const double* A, int N) {
    printf("%.*s", 0, "");
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            printf("%10.6lf ", A[i * N + j]);
        }
        printf("\n");
    }
}

int main(int argc, char* argv[]) {
    int N, M;
    bool generate = false;

    if (argc > 1 && strcmp(argv[1], "1") == 0) {
        generate = true;
    }

    printf("Введите размер матрицы N: ");
    if (scanf("%d", &N) != 1 || N <= 0) {
        fprintf(stderr, "Некорректный размер матрицы.\n");
        return EXIT_FAILURE;
    }

    printf("Введите число членов ряда M: ");
    if (scanf("%d", &M) != 1 || M <= 0) {
        fprintf(stderr, "Некорректное число членов ряда.\n");
        return EXIT_FAILURE;
    }

    double* A = NULL;

    if (generate) {
        A = generateRandomMatrix(N);
        printf("Сгенерированная матрица A:\n");
        if (N <= 20){
            printMatrix(A, N);
        } else{
            printf("Матрица слишком большая для отображения.\n");
        }
    } else {
        A = createZeroMatrix(N);
        printf("Введите элементы матрицы A (%d элементов):\n", N * N);
        for (int i = 0; i < N * N; ++i) {
            if (scanf("%lf", &A[i]) != 1) {
                fprintf(stderr, "Ошибка ввода элемента матрицы.\n");
                free(A);
                return EXIT_FAILURE;
            }
        }
    }

    double program_start = get_time_in_ms();

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

    double normR = normInf(R, N);
    printf("Норма матрицы R(inf): %.6lf\n", normR);

    double* S = createIdentityMatrix(N);
    double* R_power = createZeroMatrix(N);
    memcpy(R_power, R, sizeof(double) * N * N);

    for (int k = 1; k < M; ++k) {
        double* temp = add(S, R_power, N);
        free(S);
        S = temp;

        double* new_R_power = multiply(R_power, R, N);
        free(R_power);
        R_power = new_R_power;
    }
    free(R);

    double* A_inv = multiply(S, B, N);
    free(S);
    free(B);

    double program_end = get_time_in_ms();
    double program_elapsed = program_end - program_start;

    printf("Обратная матрица A_inv:\n");
    if (N <= 20){
        printMatrix(A_inv, N);
    } else{
        printf("Матрица слишком большая для отображения.\n");
    }

    printf("Время вычислений: %.3lf миллисекунд\n", program_elapsed);

    double* product = multiply(A_inv, A, N);
    double* Identity = createIdentityMatrix(N);
    double maxDifference = 0.0;
    int ind1 = 0, ind2 = 0;
    for (int i = 0; i < N * N; ++i) {
        double diff = fabs(product[i] - Identity[i]);
        if (diff > maxDifference) {
            maxDifference = diff;
            ind1 = i / N;
            ind2 = i % N;
        }
    }

    printf("Максимальный модуль разности между (A_inv * A) и единичной матрицей: %.6lf\n", maxDifference);
    printf("В ячейке: [%d][%d]\n", ind1, ind2);

    free(A);
    free(A_inv);
    free(product);
    free(Identity);

    return 0;
}
