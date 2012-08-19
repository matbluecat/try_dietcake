<?php
class DB extends SimpleDBI
{
    public static function getConnectSetting($destination = null)
    {
        if (is_null($destination)) {
            $dsn = DB_DSN;
            $username = DB_USERNAME;
            $password = DB_PASSWORD;
            $driver_options = array(PDO::ATTR_TIMEOUT => DB_ATTR_TIMEOUT);
        } else {
            throw new InvalidArgumentException("Unknown database: {$destination}");
        }

        return array($dsn, $username, $password, $driver_options);
    }
}
