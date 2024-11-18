#!/bin/bash

# Ścieżka do pliku env.php
ENV_FILE="../app/etc/env.php"

# Funkcja do pobierania wartości z pliku env.php
get_env_value() {
    php -r "
    \$env = include('$ENV_FILE');
    echo \$env['db']['connection']['default']['$1'] ?? '';
    "
}

# Pobieranie danych z env.php
DB_NAME=$(get_env_value 'dbname')
DB_USER=$(get_env_value 'username')
DB_PASS=$(get_env_value 'password')
DB_HOST=$(get_env_value 'host')

# Data do nazwy pliku backupu
TIMESTAMP=$(date +"%F")
BACKUP_PATH="../db_backups/"

# Tworzenie kopii zapasowej
mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_PATH/db_backup_$TIMESTAMP.sql

# Sprawdzenie, czy eksport się powiódł
if [ $? -eq 0 ]; then
    echo "Kopia zapasowa bazy danych została wykonana pomyślnie: $BACKUP_PATH/db_backup_$TIMESTAMP.sql"
else
    echo "Błąd podczas tworzenia kopii zapasowej bazy danych."
fi

