<?php

declare(strict_types=1);

namespace App\Services;

use DigitalStars\DataBase\DB as Database;
use PDO;

class DB
{
    public static Database $connection;

    private function __construct()
    {
    }

    public function __clone()
    {
    }

    public static function getConnection(): Database
    {
        if (!isset(self::$connection)) {
            self::$connection = Database::create(
                getenv('DB_CONNECTION') . ':'
                . 'host=' . getenv('DB_HOST') . ';'
                . 'port=' . getenv('DB_PORT') . ';'
                . 'dbname=' . getenv('DB_DATABASE'),
                getenv('DB_USERNAME'),
                getenv('DB_PASSWORD')
            );
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        return self::$connection;
    }
}
