<?php
/**
 * Standard router for DietCake
 *
 * @license MIT License
 * @author Tatsuya Tsuruoka <http://github.com/ttsuruoka>
 * @link https://github.com/dietcake/dietcake-showcase
 */
function url($url = '', $params = array())
{
    $query = http_build_query($params);
    if (strlen($query) > 0) {
        $query = '?' . $query;
    }

    if ($url === '') {
        if ($params === array()) {
            $url = $_SERVER['REQUEST_URI'];
        } else {
            $parsed_url = parse_url($_SERVER['REQUEST_URI']);
            $url = '';
            $url .= isset($parsed_url['scheme']) ? $parsed_url['scheme'] . '://' : '';
            $url .= isset($parsed_url['host']) ? $parsed_url['host'] : '';
            $url .= isset($parsed_url['path']) ? $parsed_url['path'] : '';
            parse_str(isset($parsed_url['query']) ? $parsed_url['query'] : '', $request_query);
            $query = http_build_query(array_merge($request_query, $params));
            if (strlen($query) > 0) {
                $query = '?' . $query;
            }
            $url = $url . $query;
        }
    } elseif ($url === '/') {
        $url = APP_URL . $query;
    } elseif (strpos($url, 'http') === 0) {
        $url = $url . $query;
    } elseif (strpos($url, '#') === 0) {
        $url = $url;
    } elseif (strpos($url, '?') === 0) {
        $url = $url;
    } else {
        $url = APP_BASE_PATH . $url . $query;
    }

    return $url;
}
