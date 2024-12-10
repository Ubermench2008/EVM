#include <iostream>
#include <vector>
#include <x86intrin.h>
#include <cstdlib>
#include <cstdint>

using namespace std;

class CacheLatencyTester {
private:
    size_t cache_size_L1;
    size_t cache_size_L2;
    size_t cache_size_L3;
    size_t max_fragments;
    size_t trials;
    size_t offset;

    static uint64_t rdtsc() {
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

public:
    CacheLatencyTester(
        size_t cL1 = 32 * 1024,
        size_t cL2 = 1 * 1024 * 1024,
        size_t cL3 = 16 * 1024 * 1024,
        size_t mFragments = 32,
        size_t t = 1000000
    ) : cache_size_L1(cL1),
        cache_size_L2(cL2),
        cache_size_L3(cL3),
        max_fragments(mFragments),
        trials(t) 
    {
        offset = 16 * 1024 * 1024; 
    }

    void run() {
        cout << "Фрагменты;Среднее время доступа (такты)" << endl;

        size_t fragment_size = offset / sizeof(int);

        for (size_t num_fragments = 1; num_fragments <= max_fragments; num_fragments++) {
            size_t array_size = num_fragments * fragment_size;
            vector<int> array(array_size, 0);

            for (size_t i = 0; i < array_size; i++) {
                size_t current_fragment = i / fragment_size;
                size_t next_fragment = (current_fragment + 1) % num_fragments;
                size_t offset_within_fragment = i % fragment_size;

                size_t next_index = next_fragment * fragment_size + offset_within_fragment;
                if (next_index >= array_size)
                    next_index = 0;
                array[i] = static_cast<int>(next_index);
            }

            int current = 0;

            for (size_t i = 0; i < array_size; i++) {
                current = array[current];
            }

            uint64_t start_cycles = rdtsc();
            for (size_t trial = 0; trial < trials; trial++) {
                current = array[current];
            }
            uint64_t end_cycles = rdtsc();

            double avg_cycles = static_cast<double>(end_cycles - start_cycles) / trials;
            cout << num_fragments << ";" << avg_cycles << endl;
        }
    }
};

int main() {
    CacheLatencyTester tester;
    tester.run();
    return 0;
}
