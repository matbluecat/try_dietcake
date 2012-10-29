<?php
class AppController extends Controller
{
	public $default_view_class = 'AppSmartyView';

	public function redirect($url, $params = array()){
		header('Location: ' . url($url, $params));
		exit;
	}
}
