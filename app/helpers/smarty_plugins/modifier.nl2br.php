<?php
function smarty_modifier_nl2br($string){
	if (!isset($string)) return;
	return nl2br($string);
}

