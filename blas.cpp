#include <iostream>
#include <vector>
#include <cmath>
#include <iomanip>
#include <cblas.h>
#include <chrono> 
#include <random>
#include <cstring>

using namespace std;
using namespace std::chrono;

typedef vector<double> Matrix;

Matrix createZeroMatrix(int N) {
    return Matrix(N * N, 0.0);
}

Matrix createIdentityMatrix(int N) {
    Matrix I = createZeroMatrix(N);
    for (int i = 0; i < N; ++i) {
        I[i * N + i] = 1.0;
    }
    return I;
}

Matrix transpose(const Matrix& A, int N) {
    Matrix AT(N * N);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            AT[j * N + i] = A[i * N + j];
        }
    }
    return AT;
}

Matrix multiply(const Matrix& A, const Matrix& B, int N) {
    Matrix C(N * N, 0.0);
    const double alpha = 1.0;
    const double beta = 0.0;
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                N, N, N, alpha,
                A.data(), N,
                B.data(), N,
                beta,
                C.data(), N);
    return C;
}

Matrix add(const Matrix& A, const Matrix& B, int N) {
    Matrix C(N * N);
    // A copy в C
    cblas_dcopy(N * N, A.data(), 1, C.data(), 1);
    // C = C + B
    cblas_daxpy(N * N, 1.0, B.data(), 1, C.data(), 1);
    return C;
}

Matrix scalarMultiply(double scalar, const Matrix& A, int N) {
    Matrix B(N * N);
    // A copy в B
    cblas_dcopy(N * N, A.data(), 1, B.data(), 1);
    // B * lambda
    cblas_dscal(N * N, scalar, B.data(), 1);
    return B;
}

Matrix generateRandomMatrix(int N) {
    Matrix A = createZeroMatrix(N);
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> dis(0.0, 100.0);
    for (int i = 0; i < N * N; ++i) {
        A[i] = dis(gen);
    }
    return A;
}

double norm1(const Matrix& A, int N) {
    double maxSum = 0.0;
    for (int j = 0; j < N; ++j) {
        double columnSum = 0.0;
        for (int i = 0; i < N; ++i) {
            columnSum += fabs(A[i * N + j]);
        }
        if (columnSum > maxSum) {
            maxSum = columnSum;
        }
    }
    return maxSum;
}

double normInf(const Matrix& A, int N) {
    double maxSum = 0.0;
    for (int i = 0; i < N; ++i) {
        double rowSum = 0.0;
        for (int j = 0; j < N; ++j) {
            rowSum += fabs(A[i * N + j]);
        }
        if (rowSum > maxSum) {
            maxSum = rowSum;
        }
    }
    return maxSum;
}

void printMatrix(const Matrix& A, int N) {
    cout << fixed << setprecision(6);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            cout << setw(10) << A[i * N + j] << " ";
        }
        cout << endl;
    }
}

int main(int argc, char* argv[]) {
    int N, M;
    bool generate = false;

    if (argc > 1 && strcmp(argv[1], "1") == 0) {
        generate = true;
    }

    cout << "Введите размер матрицы N: ";
    cin >> N;
    cout << "Введите число членов ряда M: ";
    cin >> M;

    Matrix A;

    if (generate) {
        A = generateRandomMatrix(N);
        cout << "Сгенерированная матрица A:" << endl;
        if (N <= 20){
            printMatrix(A, N);
        } else{
            cout << "Матрица слишком большая(" << endl;
        }
    } else {
        A = createZeroMatrix(N);
        cout << "Введите элементы матрицы A (" << N * N << " элементов):" << endl;
        for (int i = 0; i < N * N; ++i) {
            cin >> A[i];
        }
    }

    auto program_start = high_resolution_clock::now();

    // norms:
    double normA1 = norm1(A, N);
    double normAInf = normInf(A, N);
    double s = normA1 * normAInf;

    //B = (1/s) * A^T
    Matrix AT = transpose(A, N);
    Matrix B = scalarMultiply(1.0 / s, AT, N);

    //R = I - B * A
    Matrix BA = multiply(B, A, N);
    Matrix I = createIdentityMatrix(N);
    Matrix BA_neg = scalarMultiply(-1.0, BA, N);
    Matrix R = add(I, BA_neg, N);

    //R_norminf
    double normR = normInf(R, N);
    cout << "Норма матрицы R(inf): " << normR << endl;


    //Сумма ряда
    Matrix S = createIdentityMatrix(N);
    Matrix R_power = R;

    for (int k = 1; k < M; ++k) {
        //S = S + R_power
        Matrix temp = add(S, R_power, N);
        S = temp;
        // R_power *= R
        R_power = multiply(R_power, R, N);
    }

    //A_inv = S * B
    Matrix A_inv = multiply(S, B, N);

    auto program_end = high_resolution_clock::now();
    duration<double, milli> program_elapsed = program_end - program_start;

    cout << "Обратная матрица A_inv:" << endl;
    if (N <= 20){
        printMatrix(A_inv, N);
    } else{
        cout << "Матрица слишком большая(" << endl;
    }

    cout << "Время вычислений: " << fixed << setprecision(3) << program_elapsed.count() << " миллисекунд" << endl;

    //A_inv * A
    Matrix product = multiply(A_inv, A, N);

    Matrix Identity = createIdentityMatrix(N);

    // maxdiff abs
    double maxDifference = 0.0;
    int ind1 = 0, ind2 = 0;
    for (int i = 0; i < N * N; ++i) {
        double diff = fabs(product[i] - Identity[i]);
        if (diff > maxDifference) {
            maxDifference = diff;
            ind1 = i / N;
            ind2 = i % N;
        }
    }

    cout << "Максимальный модуль разности между (A_inv * A) и единичной матрицей: " 
         << fixed << setprecision(6) << maxDifference << endl;
    cout << "В ячейке: [" << ind1 << "][" << ind2 << "]" << endl;

    return 0;
}
