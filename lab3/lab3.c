#include <stdio.h>
#include <time.h>

int main(){
    long long N;
    scanf("%lld", &N);   

    double x = 0.5;        
    double s = 0.0;        
    double sign = 1.0; 
    double xn = x; 

    struct timespec a, b;

    clock_gettime(CLOCK_MONOTONIC_RAW, &a);

    for(long long n = 1; n <= N; n++){
        s += sign * xn / n;  
        sign *= -1.0;      
        xn *= x;
    }

    clock_gettime(CLOCK_MONOTONIC_RAW, &b);

    double ts = (double)(b.tv_sec - a.tv_sec) + 1e-9 * (double)(b.tv_nsec - a.tv_nsec);

    printf("%lf\n", s);
    printf("%lf\n", ts);

    return 0;              
}
