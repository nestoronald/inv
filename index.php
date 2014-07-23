<?php

	require ('../class/ClassCombo.php');
	require ('../class/ClassForm.php');
	require ('../class/ClassPaginado.php');
    require ('../class/ClassPaginator.php');
	require ('../class/dbconnect.php');
	require ('../class/xajax_core/xajax.inc.php');
    require ('../class/smarty/Smarty.class.php');
	$xajax=new xajax();
	$xajax->configure('javascript URI', 'js/');
 	date_default_timezone_set('America/Lima');

	// require("indexSearch.php");
	// require("indexStatistics.php");

	//Ejecutamos el modelo
    // require("adminModel.php");
    session_name("inv");
	session_start();

    
    // $xajax->registerFunction('ini');
    // $xajax->registerFunction('menu_main');
    // $xajax->registerFunction('show_details');

	$xajax->processRequest();

	//Mostramos la pagina
	// require("indexView.php");
    $smarty = new Smarty;
    $smarty->assign("xajax",$xajax->printJavascript());
    $smarty->display('tpl/home.tpl');

?>