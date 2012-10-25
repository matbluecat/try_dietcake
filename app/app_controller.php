<?php
class AppController extends Controller
{
    public $default_view_class = 'AppLayoutView';

	public function redirect($url, $params = array()){
		header('Location: ' . url($url, $params));
		exit;
	}
}
