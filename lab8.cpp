#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdint>
#include <x86intrin.h>
#include <ctime>
#include <cstdlib>
#include <cmath>
#include <random>

using namespace std;

enum TraversalMethod { Forward = 0, Reverse = 1, Random = 2 };

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
    return (static_cast<uint64_t>(hi) << 32) | lo;
}

void init_forward(int *x, size_t N) {
    for (size_t i = 0; i < N - 1; i++) {
        x[i] = static_cast<int>(i + 1);
    }
    x[N - 1] = 0;
}

void init_reverse(int *x, size_t N) {
    for (size_t i = 1; i < N; i++) {
        x[i] = static_cast<int>(i - 1);
    }
    x[0] = static_cast<int>(N - 1);
}

void init_random(int *x, size_t N) {
    vector<size_t> indices(N);
    for (size_t i = 0; i < N; i++) {
        indices[i] = i;
    }
    random_device rd;
    mt19937 g(rd());
    shuffle(indices.begin(), indices.end(), g);
    for (size_t i = 0; i < N - 1; i++) {
        x[indices[i]] = static_cast<int>(indices[i + 1]);
    }
    x[indices[N - 1]] = static_cast<int>(indices[0]);
}

int main() {
    size_t Nmin = 256;
    size_t Nmax = 8 * 1024 * 1024;
    int num_trials = 5;
    size_t K = 1000;

    size_t L2_cache_size = 6 * 1024 * 1024;
    size_t N_L2 = L2_cache_size / sizeof(int);

    vector<size_t> Ns;

    for (size_t N = Nmin; N < N_L2 - (256 * 1024 / sizeof(int)); N = static_cast<size_t>(N * 1.5)) {
        Ns.push_back(N);
    }

    for (size_t N = N_L2 - (256 * 1024 / sizeof(int)); N <= N_L2 + (256 * 1024 / sizeof(int)); N += 8192) {
        Ns.push_back(N);
    }

    for (size_t N = N_L2 + (256 * 1024 / sizeof(int)); N <= Nmax; N = static_cast<size_t>(N * 1.5)) {
        Ns.push_back(N);
    }

    cout << "N;Forward;Reverse;Random" << endl;

    for (size_t N : Ns) {
        vector<int> x;
        x.reserve(N);
        x.resize(N);

        double times[3] = {0.0, 0.0, 0.0};
        for (int method = 0; method < 3; method++) {
            double min_time = 1e20;
            for (int trial = 0; trial < num_trials; trial++) {
                TraversalMethod traversal = static_cast<TraversalMethod>(method);
                switch (traversal) {
                    case TraversalMethod::Forward:
                        init_forward(x.data(), N);
                        break;
                    case TraversalMethod::Reverse:
                        init_reverse(x.data(), N);
                        break;
                    case TraversalMethod::Random:
                        init_random(x.data(), N);
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
                double avg_time = static_cast<double>(total_cycles) / (N * K);
                if (avg_time < min_time) {
                    min_time = avg_time;
                }
            }
            times[method] = min_time;
        }

        cout << N << ";" << times[0] << ";" << times[1] << ";" << times[2] << endl;
    }

    return 0;
}
