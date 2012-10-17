<?php
function smarty_function_url($params, $smarty)
{
    if(isset($params['url'])){
        $url = $params['url'];
        unset($params['url']);
    }else{
        $url = '';
    }
    return url($url, $params);
}
