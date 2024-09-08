#include <stdio.h>
#include <math.h>
#include <time.h>
#include <limits.h>
#include <sys/times.h>  // Для times
#include <unistd.h>     // Для sysconf

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
    struct tms start, end;  // Для хранения времени
    long ticks_per_sec = sysconf(_SC_CLK_TCK);  // Количество тиков в секунду

    printf("Enter X (-1 < x <= 1): ");
    scanf("%lf", &x);
        
    printf("Enter N count (MAX: %lld): ", LLONG_MAX);
    scanf("%lld", &N);

    if (x <= -1 || x > 1) {
        printf("ERROR. x in: (-1, 1].\n");
        return 1;
    }

    if (N <= 0 || N > LLONG_MAX) {
        printf("ERROR. <= 1 %lld.\n", LLONG_MAX);
        return 1;
    }

    int continuE = 1;
    while (continuE) {
        // Измерение времени до выполнения работы
        times(&start);

        // Выполнение вычисления
        double result = ln1p_series(x, N);

        // Измерение времени после выполнения работы
        times(&end);

        // Вычисляем время, потраченное на выполнение работы в пользовательском режиме
        double user_time_taken = (double)(end.tms_utime - start.tms_utime) / ticks_per_sec;

        // Вывод результата и времени
        printf("RES: ln(1 + %lf) ≈ %lf\n", x, result);
        printf("TIME: %lf SEC (User mode)\n", user_time_taken);

        // Спрашиваем пользователя, хочет ли он продолжить
        printf("Enter 1 to continue or 0 to exit: ");
        scanf("%d", &continuE);
    }

    return 0;
}
