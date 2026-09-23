#!/bin/bash
if [ -z "$1" ]; then
    echo "Использование: $0 <расширение_без_точки>"
    exit 1
fi

EXT="$1"

if ! ls *."$EXT" &>/dev/null; then
    echo "Файлы с расширением .$EXT не найдены."
    exit 1
fi

tar -cvf "archive.tar" *."$EXT"
echo "Успешно упаковано в archive.tar"
