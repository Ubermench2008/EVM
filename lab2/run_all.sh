#!/bin/bash

# Удаление старого файла out.txt, если вы хотите начать с чистого файла
# Если хотите сохранить предыдущие данные, закомментируйте следующую строку
rm -f out.txt

# Компиляция программы с разными уровнями оптимизации
gcc -O0 -o lab2_O0 lab2.c -lm -DOPT_LEVEL=\"-O0\"
gcc -O1 -o lab2_O1 lab2.c -lm -DOPT_LEVEL=\"-O1\"
gcc -O2 -o lab2_O2 lab2.c -lm -DOPT_LEVEL=\"-O2\"
gcc -O3 -o lab2_O3 lab2.c -lm -DOPT_LEVEL=\"-O3\"
gcc -Os -o lab2_Os lab2.c -lm -DOPT_LEVEL=\"-Os\"
gcc -Ofast -o lab2_Ofast lab2.c -lm -DOPT_LEVEL=\"-Ofast\"
gcc -Og -o lab2_Og lab2.c -lm -DOPT_LEVEL=\"-Og\"

# Массив уровней оптимизации и соответствующих исполняемых файлов
OPTIMIZATIONS=("O0" "O1" "O2" "O3" "Os" "Ofast" "Og")
EXECUTABLES=("lab2_O0" "lab2_O1" "lab2_O2" "lab2_O3" "lab2_Os" "lab2_Ofast" "lab2_Og")

# Значения для ввода в программу
X_VALUE=0.5           # Значение x в диапазоне (-1, 1]
N_VALUE=1100000000     # Начальное значение N
K_VALUE=1             # Количество запусков программы
NGROW_VALUE=0    # Увеличение N при каждом запуске

# Цикл по уровням оптимизации
for ((i=0; i<${#OPTIMIZATIONS[@]}; i++)); do
    OPT_LEVEL=${OPTIMIZATIONS[$i]}
    EXE_FILE=${EXECUTABLES[$i]}

    # Запись информации об уровне оптимизации в файл out.txt
    echo "==============================" >> out.txt
    echo "Уровень оптимизации: -${OPT_LEVEL}" >> out.txt
    echo "==============================" >> out.txt

    echo "=============================="
    echo "Уровень оптимизации: -${OPT_LEVEL}"
    echo "=============================="

    # Автоматический ввод данных в программу с помощью here-document
    ./$EXE_FILE << EOF
$X_VALUE
$N_VALUE
$K_VALUE
$NGROW_VALUE
EOF

    echo
done
