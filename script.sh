#!/usr/bin/env bash

echo "Введите ключевые слова для фильтрации логов:"

LOG_FILE="/var/log/syslog"
REPORT="report.txt"
echo "" > "$REPORT"
read -r -a KEY_WORDS

echo "Количество элементов: ${#KEY_WORDS[@]}"

for word in "${KEY_WORDS[@]}"; do
	echo "
	==========================================" >> "$REPORT"
	echo "	||	KEYWORD: ${word} LOGS:		||" >> "$REPORT"
	echo "	==========================================
	
	" >> "$REPORT"
	grep "$word" "$LOG_FILE" >> "$REPORT"
done
