<?php
/**
 * DBI class for DietCake
 *
 * @license MIT License
 * @author Tatsuya Tsuruoka <http://github.com/ttsuruoka>
 * @link https://github.com/dietcake/dietcake-showcase
 */

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

    protected function onQueryEnd($sql, array $params = array())
    {
        $this->log($sql, $params);
    }

    protected function log($sql, array $params = array())
    {
        if (ENV_PRODUCTION) {
            return;
        }

        static $num_query = 1;

        preg_match('/host=([0-9A-Za-z_-]+)/', $this->dsn, $matches);
        $host = isset($matches[1]) ? $matches[1] : '-';

        Log::debug(sprintf("sql\t%f\t%d:(%s) %s; (%s)", $this->getLastExecTime(), $num_query++, $host, $sql, implode(', ', $params)), 'sql');
    }
}
