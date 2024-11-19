#include <iostream>
#include <vector>
#include <cmath>
#include <iomanip>
#include <chrono>
#include <random>
#include <cstdlib>

using namespace std;
using namespace std::chrono;

typedef vector<vector<double>> Matrix;

Matrix createZeroMatrix(int N) {
    return Matrix(N, vector<double>(N, 0.0));
}

Matrix createIdentityMatrix(int N) {
    Matrix I = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        I[i][i] = 1.0;
    }
    return I;
}

Matrix transpose(const Matrix& A) {
    int N = A.size();
    Matrix AT = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            AT[j][i] = A[i][j];
        }
    }
    return AT;
}

Matrix multiply(const Matrix& A, const Matrix& B) {
    int N = A.size();
    Matrix C = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            for (int k = 0; k < N; ++k) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
    return C;
}

Matrix add(const Matrix& A, const Matrix& B) {
    int N = A.size();
    Matrix C = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            C[i][j] = A[i][j] + B[i][j];
        }
    }
    return C;
}

Matrix scalarMultiply(double scalar, const Matrix& A) {
    int N = A.size();
    Matrix B = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            B[i][j] = scalar * A[i][j];
        }
    }
    return B;
}

//||A||_1
double norm1(const Matrix& A) {
    int N = A.size();
    double maxSum = 0.0;
    for (int j = 0; j < N; ++j) {
        double columnSum = 0.0;
        for (int i = 0; i < N; ++i) {
            columnSum += fabs(A[i][j]);
        }
        if (columnSum > maxSum) {
            maxSum = columnSum;
        }
    }
    return maxSum;
}

//|A||_inf
double normInf(const Matrix& A) {
    int N = A.size();
    double maxSum = 0.0;
    for (int i = 0; i < N; ++i) {
        double rowSum = 0.0;
        for (int j = 0; j < N; ++j) {
            rowSum += fabs(A[i][j]);
        }
        if (rowSum > maxSum) {
            maxSum = rowSum;
        }
    }
    return maxSum;
}

void printMatrix(const Matrix& A) {
    int N = A.size();
    cout << fixed << setprecision(6);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            cout << A[i][j] << " ";
        }
        cout << endl;
    }
}

Matrix generateRandomMatrix(int N, int seed = 0) {
    Matrix A = createZeroMatrix(N);
    mt19937 rng(seed);
    uniform_real_distribution<double> dist(0.0, 100.0);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            A[i][j] = dist(rng);
        }
    }
    return A;
}

int main(int argc, char* argv[]) {
    int N, M;
    
    bool generateMatrix = false;
    if (argc > 1 && atoi(argv[1]) == 1) {
        generateMatrix = true;
    }

    cout << "Введите размер матрицы N: ";
    cin >> N;
    cout << "Введите число членов ряда M: ";
    cin >> M;

    Matrix A = createZeroMatrix(N);

    if (generateMatrix) {
        A = generateRandomMatrix(N, time(NULL));
        cout << "Сгенерированная матрица A:" << endl;

        if (N <= 20){
            printMatrix(A);
        } else{
            cout << "Матрица слишком большая(.. " << endl;
        }   
    } else {
        cout << "Введите элементы матрицы A (" << N * N << " элементов):" << endl;
        for (int i = 0; i < N; ++i) {
            for (int j = 0; j < N; ++j) {
                cin >> A[i][j];
            }
        }
    }

    auto start = high_resolution_clock::now();

    double normA1 = norm1(A);
    double normAInf = normInf(A);
    double s = normA1 * normAInf;

    //B = (1/s) * A^T
    Matrix AT = transpose(A);
    Matrix B = scalarMultiply(1.0 / s, AT);

    //R = I - B * A
    Matrix BA = multiply(B, A);
    Matrix I = createIdentityMatrix(N);
    Matrix R = add(I, scalarMultiply(-1.0, BA));

    //S = I + R + R^2 + ... + R^(M-1)
    Matrix S = createIdentityMatrix(N);
    Matrix R_power = createIdentityMatrix(N);

    for (int k = 1; k < M; ++k) {
        R_power = multiply(R_power, R); //R_power = R^k
        S = add(S, R_power); //S += R_power
    }

    //A_inv = S * B
    Matrix A_inv = multiply(S, B);

    auto end = high_resolution_clock::now();
    auto duration = duration_cast<milliseconds>(end - start);

    cout << "A_inv:" << endl;

    if (N <= 20){
        printMatrix(A_inv);
    } else{
        cout << "Матрица слишком большая(.. " << endl;
    }

    cout << "Время вычислений: " << duration.count() << " миллисекунд" << endl;

    Matrix product = multiply(A_inv, A);

    if (N <= 20){
        printMatrix(product);
    } else{
        cout << "Матрица слишком большая(.. " << endl;
    }

    
    Matrix Identity = createIdentityMatrix(N);

    int ind1 = 0;
    int ind2 = 0;
    double maxDifference = 0.0;
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            double diff = fabs(product[i][j] - Identity[i][j]);
            if (diff > maxDifference) {
                maxDifference = diff;
                ind1 = i;
                ind2 = j;
            }
        }
    }

    cout << "Максимальный модуль разности между (A_inv * A) и единичной матрицей: " << fixed << setprecision(6) << maxDifference << endl;
    cout << "Ячейка: [" << ind1 << ',' << ind2 << "]" << endl;

    return 0;
}
