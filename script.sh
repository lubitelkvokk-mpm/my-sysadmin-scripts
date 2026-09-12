#!/usr/bin/env bash

echo "Введите ключевые слова для фильтрации логов:"

LOG_FILE="/var/log/syslog"
REPORT="report.txt"
echo "" > "$REPORT"
read -r -a KEY_WORDS

echo "Введите 1, если хотите совершить поиск по всем ключевым словам.
Введите 2, если хотите получить отдельную выборку по каждому из слов."

read WORK_REGIME

case "$1" in
	1)
		echo "Режим конъюктивной определен"
		# Call func 1
		;;
	2)
		echo "Реэим дизъюнктивной фильтрации определен"
		# Call func 2
		;;
	*)
		echo "Режим не определен"
		;;
esac



for word in "${KEY_WORDS[@]}"; do
	echo "
	==========================================" >> "$REPORT"
	echo "	||	KEYWORD: ${word} LOGS:		||" >> "$REPORT"
	echo "	==========================================
	
	" >> "$REPORT"
	grep "$word" "$LOG_FILE" >> "$REPORT"
done
