#!/bin/bash
for file in *.{c,js,py}; do
    # Пропускаем цикл, если файлы с таким расширением отсутствуют
    [ -e "$file" ] || { echo "Файл $file не найден"; continue; }

    first_line=$(head -n 1 "$file")

    # Регулярные выражения: проверка // или /* для C/JS и # для Python
    if [[ "$file" =~ \.(c|js)$ && ("$first_line" =~ ^// || "$first_line" =~ ^/\*) ]] || \
       [[ "$file" =~ \.py$ && "$first_line" =~ ^# ]]; then
        echo "[ОК] $file: Есть комментарий в первой строке"
    else
        echo "[Х]  $file: Комментарий в первой строке НЕ найден"
    fi
done
