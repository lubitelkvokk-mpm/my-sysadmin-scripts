#!/usr/bin/env bash

echo "Введите ключевые слова для фильтрации логов через пробел:"

LOG_FILE="/var/log/syslog"
REPORT="report.txt"

# Очистим файл
> "$REPORT"
read -r -a KEY_WORDS

echo "Введите 1, если хотите совершить поиск по ключевым словам с объединением результатов.
Введите 2, если хотите получить отдельную выборку по каждому из слов."

read WORK_REGIME


regime2() {
for word in "${KEY_WORDS[@]}"; do
	echo "
	==========================================" >> "$REPORT"
	echo "	||	KEYWORD: ${word} LOGS:		||" >> "$REPORT"
	echo "	==========================================
	
	" >> "$REPORT"
	grep "$word" "$LOG_FILE" >> "$REPORT"
done
}

regime1() {
	PATTERN=$(IFS='|'; echo "${KEY_WORDS[*]}")
	echo "Преобразованный паттерн ${PATTERN}"

	echo "
	==================================================================================" >> "$REPORT"
	echo "	||	KEYWORDS: ${PATTERN} LOGS:					||" >> "$REPORT"
	echo "	==================================================================================
	
	" >> "$REPORT"
	grep -Ei "$PATTERN" "$LOG_FILE" | sort -u >> "$REPORT"
}


case $WORK_REGIME in
	'1')
		echo "Режим конъюктивной определен"
		regime1
		;;
	'2')
		echo "Реэим дизъюнктивной фильтрации определен"
		regime2
		;;
	*)
		echo "Режим не определен"
		;;
esac


