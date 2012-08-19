<?php
define('ENV_PRODUCTION', true);
define('APP_HOST', 'hello.example.com');
define('APP_BASE_PATH', '/');
define('APP_URL', 'http://hello.example.com/');

ini_set('error_log', LOGS_DIR.'php.log');
ini_set('session.auto_start', 0);

// MySQL: board
define('DB_DSN', 'mysql:host=localhost;dbname=board');
define('DB_USERNAME', 'board_root');
define('DB_PASSWORD', 'board_root');
define('DB_ATTR_TIMEOUT', 3);
