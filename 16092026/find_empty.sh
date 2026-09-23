#!/bin/bash
if [ -z "$1" ]; then
    echo "Использование: $0 <путь_к_директории>"
    exit 1
fi

DIR="$1"

if [ ! -d "$DIR" ]; then
    echo "Ошибка: Директория '$DIR' не существует."
    exit 1
fi

# -empty находит файлы размером 0 байт, -printf "%f\n" выводит только имена без путей
find "$DIR" -maxdepth 1 -type f -empty -name "*.txt" -printf "%f\n"
