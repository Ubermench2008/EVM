#!/bin/bash

N=$1

if ! [[ "$N" =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <number_of_runs>"
    exit 1
fi

gcc main.c -o main -lm

for (( i=1; i<=N; i++ ))
do
    echo "Запуск $i..."
    ./main.c
done

echo "Succes! [$N]"
