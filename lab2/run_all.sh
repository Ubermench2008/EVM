#!/bin/bash


rm -f out.txt

gcc -O0 -o lab2_O0 lab2.c -lm -DOPT_LEVEL=\"-O0\"
gcc -O1 -o lab2_O1 lab2.c -lm -DOPT_LEVEL=\"-O1\"
gcc -O2 -o lab2_O2 lab2.c -lm -DOPT_LEVEL=\"-O2\"
gcc -O3 -o lab2_O3 lab2.c -lm -DOPT_LEVEL=\"-O3\"
gcc -Os -o lab2_Os lab2.c -lm -DOPT_LEVEL=\"-Os\"
gcc -Ofast -o lab2_Ofast lab2.c -lm -DOPT_LEVEL=\"-Ofast\"
gcc -Og -o lab2_Og lab2.c -lm -DOPT_LEVEL=\"-Og\"

OPTIMIZATIONS=("O0" "O1" "O2" "O3" "Os" "Ofast" "Og")
EXECUTABLES=("lab2_O0" "lab2_O1" "lab2_O2" "lab2_O3" "lab2_Os" "lab2_Ofast" "lab2_Og")

X_VALUE=0.5
N_VALUE=1100000000
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
