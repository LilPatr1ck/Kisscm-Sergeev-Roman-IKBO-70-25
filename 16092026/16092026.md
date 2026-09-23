задание 1

grep -Eo "^[^:]+" /etc/passwd | sort

задание 2

awk '!/^#/ && NF {print $2, $1}' /etc/protocols | sort -rn | head -n 5


задание 3

# Проверяем, передана ли строка
if [ -z "${1}" ]; then
    echo "Использование: $0 \"Ваш текст\""
    exit 1
fi

text="${1}"
# Считаем длину строки
length=${#text}

# Формируем горизонтальную линию из дефисов нужной длины
printf -v border '%*s' "$((length + 2))" ''
border=${border// /-}

# Выводим баннер
echo "+${border}+"
echo "| ${text} |"
echo "+${border}+"

задание 4

#!/bin/bash
if [ -z "$1" ]; then
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

grep -oE '[a-zA-Z_][a-zA-Z0-9_]*' "$1" | sort -u | tr '\n' ' '
echo ""

задание 5
#!/bin/bash
if [ -z "$1" ]; then
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Ошибка: файл '$FILE' не найден."
    exit 1
fi

chmod 755 "$FILE"
sudo cp "$FILE" /usr/local/bin/

if [ $? -eq 0 ]; then
    echo "Программа '$(basename "$FILE")' успешно зарегистрирована"
else
    echo "Ошибка при копировании файла."
fi

задание 6

#!/bin/bash
for file in *.{c,js,py}; do
    # Пропускаем цикл, если файлы с таким расширением отсутствуют
    [ -e "$file" ] || continue

    first_line=$(head -n 1 "$file")

    # Регулярные выражения: проверка // или /* для C/JS и # для Python
    if [[ "$file" =~ \.(c|js)$ && ("$first_line" =~ ^// || "$first_line" =~ ^/\*) ]] || \
       [[ "$file" =~ \.py$ && "$first_line" =~ ^# ]]; then
        echo "[ОК] $file: Есть комментарий в первой строке"
    else
        echo "[Х]  $file: Комментарий в первой строке НЕ найден"
    fi
done

задание 7

#!/bin/bash
if [ -z "$1" ]; then
    echo "Использование: $0 <путь>"
    exit 1
fi

find "$1" -type f -exec md5sum {} + | sort | uniq -w 32 --all-repeated=separate

задание 8

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

задание 9

#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Использование: $0 <входной_файл> <выходной_файл>"
    exit 1
fi

sed 's/    /\t/g' "$1" > "$2"
echo "Замена завершена. Результат сохранен в $2"

задание 10

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

find "$DIR" -maxdepth 1 -type f -empty -name "*.txt" -printf "%f\n"
