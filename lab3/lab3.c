#include <stdio.h>
#include <math.h>
#include <time.h>
#include <limits.h>

double ln1p_series(double x, long long N) {
    double sum = 0.0;
    for (long long n = 1; n <= N; n++) {
        double term = pow(-1, n + 1) * pow(x, n) / n;
        sum += term;
    }
    return sum;
}

int main() {
    FILE *fp = fopen("out.txt", "a");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    double x;
    long long N;
    struct timespec start, end;

    printf("x in (-1 < x <= 1): ");
    scanf("%lf", &x);

    printf("max N: %lld\n", LLONG_MAX);

    printf("count N (maximum: %lld): ", LLONG_MAX);
    scanf("%lld", &N);

    if (x <= -1 || x > 1) {
        printf("error. x in (-1, 1].\n");
        fclose(fp);
        return 1;
    }

    if (N <= 0 || N > LLONG_MAX) {
        printf("error. n <= %lld.\n", LLONG_MAX);
        fclose(fp);
        return 1;
    }

    int k = 0;
    int nGrow = 0;

    printf("Enter how many times the program should run: ");
    scanf("%d", &k);

    if (k <= 0) {
        printf("Error: The number of runs should be a positive integer.\n");
        fclose(fp);
        return 1;
    }

    printf("Should it increase N? If yes, enter the number by which to increase the parameter N. If not, enter 0: ");
    scanf("%d", &nGrow);

    for (int i = 0; i < k; i++) {
        if (N > LLONG_MAX - nGrow) {
            printf("Error: N exceeds maximum limit.\n");
            fprintf(fp, "Error: N exceeds maximum limit.\n");
            break;
        }

        clock_gettime(CLOCK_MONOTONIC_RAW, &start);

        double result = ln1p_series(x, N);

        clock_gettime(CLOCK_MONOTONIC_RAW, &end);

        double time_spent = (end.tv_sec - start.tv_sec) +
                            0.000000001 * (end.tv_nsec - start.tv_nsec);

        printf("RES: ln(1 + %0.10lf) ≈ %0.10lf\n", x, result);
        printf("TIME: %0.10lf sec\n", time_spent);

        fprintf(fp, "Run %d:\n", i + 1);
        fprintf(fp, "N = %lld\n", N);
        fprintf(fp, "RES: ln(1 + %0.10lf) ≈ %0.10lf\n", x, result);
        fprintf(fp, "TIME: ~~~~~~~~~~[[%0.10lf sec]]~~~~~~~~~~\n", time_spent);

        N += nGrow;
    }

    fclose(fp);

    return 0;
}
