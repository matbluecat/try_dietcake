<?php
function smarty_modifier_eh($string){
	if (!isset($string)) return;
	return htmlspecialchars($string, ENT_QUOTES);
}

