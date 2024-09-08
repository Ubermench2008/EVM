#include <stdio.h>
#include <math.h>
#include <time.h>
#include <limits.h>  // Для использования LLONG_MAX

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
    double x;
    long long N;
    clock_t start, end;  // Переменные для измерения времени

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
        return 1;
    }

    // Проверка на максимальное значение N
    if (N <= 0 || N > LLONG_MAX) {
        printf("error. n <= %lld.\n", LLONG_MAX);
        return 1;
    }

    // Измерение времени начала работы
    start = clock();

    // Вычисление результата
    double result = ln1p_series(x, N);

    // Измерение времени окончания работы
    end = clock();

    // Вычисление времени работы в секундах
    double time_spent = (double)(end - start) / CLOCKS_PER_SEC;

    // Вывод результата и времени работы
    printf("RES: ln(1 + %lf) ≈ %lf\n", x, result);
    printf("TIME: %lf sec\n", time_spent);

    return 0;
}
