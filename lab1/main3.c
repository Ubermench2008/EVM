#include <stdio.h>
#include <math.h>

// Структура для хранения результата rdtsc
union ticks {
    unsigned long long t64;
    struct {
        unsigned long th, tl;
    } t32;
};

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
    double cpu_Hz = 4000000000ULL; // Тактовая частота процессора (3 ГГц)
    union ticks start, end;

    // Ввод значений x и N
    printf("Enter X (-1 < x <= 1): ");
    scanf("%lf", &x);

    printf("Enter N count: ");
    scanf("%lld", &N);

    // Проверка ввода
    if (x <= -1 || x > 1) {
        printf("ERROR. x in: (-1, 1].\n");
        return 1;
    }

    if (N <= 0) {
        printf("ERROR. N must be greater than 0.\n");
        return 1;
    }

    int continuE = 1;
    while (continuE) {
        // Получаем количество тактов до начала работы
        asm volatile ("rdtsc" : "=a"(start.t32.th), "=d"(start.t32.tl));

        // Выполнение вычисления
        double result = ln1p_series(x, N);

        // Получаем количество тактов после выполнения работы
        asm volatile ("rdtsc" : "=a"(end.t32.th), "=d"(end.t32.tl));

        // Вычисляем количество тактов, затраченных на выполнение
        unsigned long long start_ticks = start.t64;
        unsigned long long end_ticks = end.t64;
        unsigned long long cycles_taken = end_ticks - start_ticks;

        // Вычисляем время выполнения в секундах
        double time_taken = (double)cycles_taken / cpu_Hz;

        // Вывод результата и времени выполнения
        printf("RES: ln(1 + %lf) ≈ %lf\n", x, result);
        printf("TIME: %lf SEC (measured with RDTSC)\n", time_taken);

        // Спрашиваем пользователя, хочет ли он продолжить
        printf("Enter 1 to continue or 0 to exit: ");
        scanf("%d", &continuE);
    }

    return 0;
}
