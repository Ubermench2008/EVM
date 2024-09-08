#!/bin/bash

mkdir -p build

gcc -o build/output main.c other_file.c

if [ $? -eq 0 ]; then
    echo "Компиляция завершена успешно."
else
    echo "Ошибка компиляции."
    exit 1

