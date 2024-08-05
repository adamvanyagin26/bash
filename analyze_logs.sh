# Создаем отчет
{
    echo "Общее количество запросов:"
    awk 'END {print NR}' access.log

    echo
    echo "Количество уникальных IP-адресов:"
    awk '{print $1}' access.log | sort | uniq | wc -l

    echo
    echo "Количество запросов по методам:"
    awk -F'"' '{print $2}' access.log | awk '{print $1}' | sort | uniq -c

    echo
    echo "Самый популярный URL:"
    awk -F'"' '{print $2}' access.log | awk '{print $2}' | sort | uniq -c | sort -nr | head -n 1
} > report.txt

echo "Отчет создан: report.txt"
