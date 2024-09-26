#include <stdio.h>
#include <time.h>

int main(){
    long long N;
    scanf("%lld", &N);
    double s=0, t=1.0;
    struct timespec a, b;
    clock_gettime(CLOCK_MONOTONIC_RAW, &a);
    for(long long n=1; n<=N; n++){
        s += t / n;
        t *= -1.0;
    }
    clock_gettime(CLOCK_MONOTONIC_RAW, &b);
    double ts = (b.tv_sec - a.tv_sec) + 1e-9 * (b.tv_nsec - a.tv_nsec);
    printf("%lf\n", ts);
}
