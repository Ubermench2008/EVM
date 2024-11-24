#include <iostream>
#include <vector>
#include <algorithm>
#include <stdint.h>
#include <x86intrin.h>
#include <ctime>
#include <cstdlib>
#include <cmath>

using namespace std;

uint64_t rdtsc() {
    unsigned int lo, hi;
    __asm__ __volatile__ (
        "cpuid\n\t"
        "rdtsc\n\t"
        "mov %%edx, %0\n\t"
        "mov %%eax, %1\n\t"
        : "=r" (hi), "=r" (lo)
        :: "%rax", "%rbx", "%rcx", "%rdx"
    );
    return ((uint64_t)hi << 32) | lo;
}

void init_forward(int *x, size_t N) {
    for (size_t i = 0; i < N - 1; i++) {
        x[i] = i + 1;
    }
    x[N - 1] = 0;
}

void init_reverse(int *x, size_t N) {
    for (size_t i = 1; i < N; i++) {
        x[i] = i - 1;
    }
    x[0] = N - 1;
}

void init_random(int *x, size_t N) {
    vector<size_t> indices(N);
    for (size_t i = 0; i < N; i++) {
        indices[i] = i;
    }
    random_shuffle(indices.begin(), indices.end());
    for (size_t i = 0; i < N - 1; i++) {
        x[indices[i]] = indices[i + 1];
    }
    x[indices[N - 1]] = indices[0];
}

int main() {
    size_t Nmin = 256;
    size_t Nmax = 8 * 1024 * 1024;
    int steps = 20;
    int num_trials = 5;
    size_t K = 1000;

    cout << "N;Forward;Reverse;Random" << endl;

    for (int s = 0; s <= steps; s++) {
        size_t N = static_cast<size_t>(Nmin * pow(1.5, s));
        if (N > Nmax) {
            break;
        }
      
        int *x = (int *)malloc(N * sizeof(int));
      
        double times[3] = {0.0, 0.0, 0.0};
        for (int method = 0; method < 3; method++) {
            double min_time = 1e20;
            for (int trial = 0; trial < num_trials; trial++) {
              switch (method) {
                case 0:
                  init_forward(x, N);
                  break;
                case 1:
                  init_reverse(x, N);
                  break;
                case 2:
                  init_random(x, N);
                  break;
                default:
                  break;
              }
              volatile int k = 0;
              for (size_t i = 0; i < N; i++) {
                  k = x[k];
              }
              k = 0;
              uint64_t start = rdtsc();
              for (size_t i = 0; i < N * K; i++) {
                  k = x[k];
              }
              
              uint64_t end = rdtsc();
              
              uint64_t total_cycles = end - start;
              double avg_time = (double)total_cycles / (N * K);
              if (avg_time < min_time) {
                  min_time = avg_time;
              }
          }
          
          times[method] = min_time;
        }

      cout << N << ";" << times[0] << ";" << times[1] << ";" << times[2] << endl;
      free(x);
    }

    return 0;
}
