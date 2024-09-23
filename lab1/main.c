#include <stdio.h>
#include <math.h>
#include <time.h>
#include <limits.h>

// Функция для вычисления ln(1 + x) с использованием ряда Тейлора
double ln1p_series(double x, long long N) {
    double sum = 0.0;
    for (long long n = 1; n <= N; n++) {
        double term = pow(-1, n + 1) * pow(x, n) / n;
        sum += term;
    }
    return sum;
}

int main() {
    // Открытие файла для записи
    FILE *fp = fopen("out.txt", "w");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    double x;
    long long N;
    struct timespec start, end;  // Переменные для измерения времени

    // Ввод значения x
    printf("x in (-1 < x <= 1): ");
    scanf("%lf", &x);
    
    printf("max N: %lld\n", LLONG_MAX);
    
    // Ввод значения N
    printf("count N (maximum: %lld): ", LLONG_MAX);
    scanf("%lld", &N);

    // Проверка области сходимости
    if (x <= -1 || x > 1) {
        printf("error. x in (-1, 1].\n");
        fclose(fp);
        return 1;
    }

    // Проверка на максимальное значение N
    if (N <= 0 || N > LLONG_MAX) {
        printf("error. n <= %lld.\n", LLONG_MAX);
        fclose(fp); 
        return 1;
    }

    int k = 0;
    int nGrow = 0;

    // Ввод количества запусков программы
    printf("Enter how many times the program should run: ");
    scanf("%d", &k);

    if (k <= 0) {
        printf("Error: The number of runs should be a positive integer.\n");
        fclose(fp);
        return 1;
    }

    // Ввод увеличения параметра N
    printf("Should it increase N? If yes, enter the number by which to increase the parameter N. If not, enter 0: ");
    scanf("%d", &nGrow);

    for(int i = 0; i < k; i++){
        // Проверка на переполнение N при увеличении
        if (N > LLONG_MAX - nGrow) {
            printf("Error: N exceeds maximum limit.\n");
            fprintf(fp, "Error: N exceeds maximum limit.\n");
            break;
        }

        // Измерение времени начала работы
        clock_gettime(CLOCK_MONOTONIC_RAW, &start);

        // Вычисление результата
        double result = ln1p_series(x, N);

        // Увеличение N, если нужно
        N += nGrow;

        // Измерение времени окончания работы
        clock_gettime(CLOCK_MONOTONIC_RAW, &end);

        // Вычисление времени работы в секундах
        double time_spent = (end.tv_sec - start.tv_sec) +
                            0.000000001 * (end.tv_nsec - start.tv_nsec);

        // Вывод результата и времени работы на экран с точностью до 10 знаков
        printf("RES: ln(1 + %0.10lf) ≈ %0.10lf\n", x, result);
        printf("TIME: %0.10lf sec\n", time_spent);

        // Запись результата и времени в файл с точностью до 10 знаков
        fprintf(fp, "RES: ln(1 + %0.10lf) ≈ %0.10lf\n", x, result);
        fprintf(fp, "TIME: %0.10lf sec\n", time_spent);
    }

    // Закрытие файла
    fclose(fp);

    return 0;
}
