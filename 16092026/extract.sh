#!/bin/bash
if [ -z "$1" ]; then
    echo "Использование: $0 <имя_файла>"
    exit 1
fi
grep -oE '[a-zA-Z_][a-zA-Z0-9_]*' "$1" | sort -u | tr '\n' ' '
echo ""
