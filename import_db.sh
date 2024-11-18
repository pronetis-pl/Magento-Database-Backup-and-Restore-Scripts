#!/bin/bash

# Ścieżka do pliku env.php ENV_FILE="../app/etc/env.php"
env_file="../app/etc/env.php"

# Sprawdzenie, czy plik env.php istnieje
if [ ! -f "$env_file" ]; then
    echo "Plik env.php nie istnieje w podanej ścieżce."
    exit 1
fi


# Pobieranie danych z pliku env.php
DB_HOST=$(php -r "\$env = include('$env_file'); echo \$env['db']['connection']['default']['host'];")
DB_NAME=$(php -r "\$env = include('$env_file'); echo \$env['db']['connection']['default']['dbname'];")
DB_USER=$(php -r "\$env = include('$env_file'); echo \$env['db']['connection']['default']['username'];")
DB_PASS=$(php -r "\$env = include('$env_file'); echo \$env['db']['connection']['default']['password'];")



# Sprawdzenie, czy został podany argument (nazwa pliku SQL)
if [ -z "$1" ]; then
    echo "Nie podano pliku zrzutu bazy danych."
    echo "Użycie: $0 <ścieżka_do_pliku.sql>"
    exit 1
fi

# Ścieżka do pliku zrzutu bazy danych (pobieramy z linii poleceń)
backup_file="$1"

# Sprawdzamy, czy plik zrzutu istnieje
if [ ! -f "$backup_file" ]; then
    echo "Plik zrzutu bazy danych $backup_file nie istnieje."
    exit 1
fi

# Komenda do importu zrzutu
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$backup_file"

# Sprawdzanie, czy import się powiódł
if [ $? -eq 0 ]; then
  echo "Zrzut bazy danych z pliku $backup_file został pomyślnie zaimportowany do $DB_NAME."
else
  echo "Wystąpił problem podczas importowania zrzutu bazy danych."
fi
