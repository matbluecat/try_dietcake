<?php
require_once VENDOR_DIR . 'Smarty/libs/Smarty.class.php';
define('SMARTY_EXT', '.tpl');
class AppSmartyView
{
	public $controller;
	public $vars = array();
	public $smarty;

	public $header = 'common/header';
	public $footer = 'common/footer';
	public $layout = 'layouts/default';

	public function __construct($controller){
		$this->controller = $controller;
		$this->smarty = new Smarty();

		$this->smarty->template_dir = VIEWS_DIR;
		$this->smarty->compile_dir = CACHE_DIR;
		$this->smarty->left_delimiter = '{{';
		$this->smarty->right_delimiter = '}}';
		$this->smarty->addPluginsDir(HELPERS_DIR . 'smarty_plugins/');
	}

    public function render($action = null)
    {
        $action = is_null($action) ? $this->controller->action : $action;
        if (strpos($action, '/') === false) {
            $tpl_file = $this->controller->name . '/' . $action . SMARTY_EXT;
        } else {
            $tpl_file = $action . SMARTY_EXT;
        }

        if (!file_exists(VIEWS_DIR . $tpl_file)) {
            throw new DCException("{$tpl_file} is not found");
        }

		if(is_array($this->vars)){
			foreach($this->vars as $key => $val){
				$this->smarty->assign($key, $val);
			}
		}
        $_contents	= $this->smarty->fetch($tpl_file);
		$this->smarty->assign('_contents', $_contents);

        $tpl	= $this->smarty->fetch($this->layout . SMARTY_EXT);

        ob_start();
		echo $tpl;
        $out = ob_get_clean();

        $this->controller->output = $out;
    }

}
