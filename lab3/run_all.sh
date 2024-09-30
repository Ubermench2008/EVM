#!/bin/bash

rm -f out.txt

OPTIMIZATIONS=("O0" "O1" "Ofast")
ARCHITECTURES=("32" "64")

N_VALUE=1000000000

for OPT in "${OPTIMIZATIONS[@]}"; do
    for ARCH in "${ARCHITECTURES[@]}"; do
        SUFFIX="${OPT}_${ARCH}bit"
        EXE_FILE="lab3_${SUFFIX}"
        
        ASM_FILE="lab3_${SUFFIX}.s"
        
        if [ "$ARCH" == "32" ]; then
            ARCH_FLAG="-m32"
        else
            ARCH_FLAG="-m64"
        fi
        
        gcc -$OPT $ARCH_FLAG -o $EXE_FILE lab3.c -lm
        
        gcc -$OPT $ARCH_FLAG -S -o $ASM_FILE lab3.c
        
        echo "==============================" >> out.txt
        echo "Уровень оптимизации: -${OPT}, Архитектура: ${ARCH}-бит" >> out.txt
        echo "==============================" >> out.txt
        
        echo "=============================="
        echo "Уровень оптимизации: -${OPT}, Архитектура: ${ARCH}-бит"
        echo "=============================="
        
        ./$EXE_FILE << EOF >> out.txt
$N_VALUE
EOF
        echo "" >> out.txt
        echo
    done
done