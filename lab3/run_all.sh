#!/bin/bash


rm -f out.txt

gcc -O0 -o lab3_O0 lab3.c -lm
gcc -O1 -o lab3_O1 lab3.c -lm
gcc -O2 -o lab3_O2 lab3.c -lm
gcc -O3 -o lab3_O3 lab3.c -lm
gcc -Os -o lab3_Os lab3.c -lm
gcc -Ofast -o lab3_Ofast lab3.c -lm
gcc -Og -o lab3_Og lab3.c -lm

OPTIMIZATIONS=("O0" "O1" "O2" "O3" "Os" "Ofast" "Og")
EXECUTABLES=("lab3_O0" "lab3_O1" "lab3_O2" "lab3_O3" "lab3_Os" "lab3_Ofast" "lab3_Og")

X_VALUE=0.5
N_VALUE=11000000
K_VALUE=1
NGROW_VALUE=0

for ((i=0; i<${#OPTIMIZATIONS[@]}; i++)); do
    OPT_LEVEL=${OPTIMIZATIONS[$i]}
    EXE_FILE=${EXECUTABLES[$i]}

    echo "==============================" >> out.txt
    echo "Уровень оптимизации: -${OPT_LEVEL}" >> out.txt
    echo "==============================" >> out.txt

    echo "=============================="
    echo "Уровень оптимизации: -${OPT_LEVEL}"
    echo "=============================="

    ./$EXE_FILE << EOF
$X_VALUE
$N_VALUE
$K_VALUE
$NGROW_VALUE
EOF

    echo
done
