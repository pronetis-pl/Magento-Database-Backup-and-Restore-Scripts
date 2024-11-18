# Database Backup and Restore Scripts

This repository contains two bash scripts designed to simplify and automate the process of backing up and restoring MySQL databases for Magento-based applications. Whether you're managing a small e-commerce store or working on a large-scale Magento project, these scripts ensure your database is securely backed up and easily restorable. The scripts use database connection details directly from the `env.php` file located in your Magento installation.

## Features

- **Automated Database Backup**: A script (`dump_db.sh`) to create automatic backups of your database with timestamped filenames.
- **Easy Database Restore**: A script (`import_db.sh`) that allows for quick and secure restoration of MySQL backups from SQL dump files.
- **Magento Integration**: Both scripts extract database credentials from the `env.php` configuration file in your Magento installation, so no need to manually configure the credentials.
- **Simple to Use**: Just run the scripts and they handle the rest – no complicated setup required.

## Scripts

### 1. `dump_db.sh` (Backup Script)

- Automatically backs up your MySQL database and stores it in the `db_backups/` directory with a timestamped filename.
- The script fetches database connection details such as username, password, host, and database name from the `env.php` file.
- **Usage**: Simply execute the script, and it will create a backup of the database specified in the `env.php` file.

### 2. `import_db.sh` (Restore Script)

- Restores a MySQL database from a given SQL dump file.
- The script retrieves database connection details from the `env.php` file to restore the backup to your database.
- **Usage**: Run the script with the path to your SQL dump file, and it will restore the backup to your database.

## How to Use

### 1. `dump_db.sh` (Backup Script)
Simply place the backup script in your server's root directory, and run it from the command line.

Example:
```bash
./dump_db.sh
