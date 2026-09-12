#!/usr/bin/env bash

echo "Введите ключевые слова для фильтрации логов:"

LOG_FILE="/var/log/syslog"
REPORT="report.txt"
echo "" > "$REPORT"
read -r -a KEY_WORDS

echo "Количество элементов: ${#KEY_WORDS[@]}"

for word in "${KEY_WORDS[@]}"; do
	echo "\n\n=========================================\n\n" >> "$REPORT"
	echo "\t\t\tKEYWORD: ${word} LOGS: \n" >> "$REPORT"
	grep "$word" "$LOG_FILE" >> "$REPORT"
done
