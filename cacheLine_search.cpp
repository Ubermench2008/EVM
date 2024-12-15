#include <iostream>
#include <chrono>
#include <vector>
#include <cmath>

int main() {
    const size_t array_size = 64 * 1024 * 1024;
    const size_t num_iterations = 1000;

    std::vector<char> arr(array_size, 0);

    // 4,8,16,32,.... *каждый шаг - степень двойки
    size_t start_step = 4;
    size_t end_step = 1024; //Верхняя граница множества шагов (можно было сделать > 64, например 128, чтобы максимальная разница времени доступа обновилось)
    std::vector<size_t> steps;
    std::vector<double> times;

    for (size_t step = start_step; step <= end_step; step *= 2) {
        for (int warm = 0; warm < 10; ++warm) {
            for (size_t i = 0; i < array_size; i += step) {
                volatile char tmp = arr[i];
                (void)tmp;
            }
        }

        auto start = std::chrono::high_resolution_clock::now();
        for (int iter = 0; iter < num_iterations; ++iter) {
            for (size_t i = 0; i < array_size; i += step) {
                volatile char tmp = arr[i];
                (void)tmp;
            }
        }
        auto end = std::chrono::high_resolution_clock::now();
      
        std::chrono::duration<double> diff = end - start;
        double avg_time = diff.count() / (double(num_iterations) * (array_size / step));

        std::cout << "Step: " << step << " bytes, avg_time: " << avg_time << " s per access\n";

        steps.push_back(step);
        times.push_back(avg_time); //заполняем векторы
    }

    //Ищем резкие скачки во времени, выполняя проход по вектору times
    double max_ratio = 0.0;
    size_t line_size = steps.front(); // по умолчанию первый шаг
    for (size_t i = 1; i < times.size(); ++i) {
        double ratio = times[i] / times[i - 1];
        if (ratio > max_ratio) {
            max_ratio = ratio;
            line_size = steps[i - 1]; //предыдущий шаг и будет размером кеш линии
        }
    }

    std::cout << "Размер кеш-линии: " << line_size << " б\n";
    return 0;
}
