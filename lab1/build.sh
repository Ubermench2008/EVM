#!/bin/bash

mkdir -p build

gcc -S -o build/main.s main.c -lm

gcc -o build/output main.c -lm

if [ $? -eq 0 ]; then
    echo "Компиляция завершена успешно."
else
    echo "Ошибка компиляции."
    exit 1
fi
