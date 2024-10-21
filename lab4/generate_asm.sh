#!/bin/bash

OPTIMIZATIONS=("O0" "O1" "O2" "O3" "Os" "Ofast" "Og")
ARCHS=("m32" "m64")

for ARCH in "${ARCHS[@]}"; do
    for OPT in "${OPTIMIZATIONS[@]}"; do
        OUTPUT_FILE="lab3_${OPT}_${ARCH}.s"
        gcc -$OPT -$ARCH -S lab3.c -o $OUTPUT_FILE
    done
done
