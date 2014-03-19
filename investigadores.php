<?php

 require ("../class/dbconnect.php");
 require ("../class/PasswordHash.php");
 require ("../class/Security.php");
 require ('../class/xajax_core/xajax.inc.php');
 require ('../class/smarty/Smarty.class.php');
 $xajax=new xajax();
 $xajax->configure('javascript URI', 'js/');
 date_default_timezone_set('America/Lima');

 require("models.php");

 function details_inv($id=0){
    $result=InvQueryId($id);
    if (isset($result)) {
        if ($result!=-100) {
            return $result;
        }
        else{
            return -100;
        }
    }
    else{
        return -100;
    }
 }

 function lista_inv(){
 	$result=InvQuery();
 	$html = "";
 	if (isset($result)) {
 	    if ($result["Count"]>0) {
 	        for ($i=0; $i < $result["Count"]; $i++) {
 	            $html .="<div class='art'>";
 	            $html.="	<h4>";
 	            $html.="	<a href='./investigadores.php?id=".$result["idempleado"][$i]."'>".$result["empleado_name"][$i].", ".$result["empleado_surname"][$i]."</a>";
 	            $html .="	</h4>
 	            		</div><hr />";
 	        }
 	    }
 	}
 	return $html;
  }
$xajax->processRequest();
$smarty = new Smarty;
$smarty->assign("xajax",$xajax->printJavascript());
// $smarty->assign("lista", lista_inv());
// $smarty->display('./tpl/investigadores.tpl');

if (isset($_GET["id"])) {
    if(!empty($_GET['id'])){
       $id = $_GET['id'];
       $id = preg_replace('/[^a-zA-Z0-9]/', '', $id);
    }
    else {
       $id = 0;
    }
    $smarty->assign("details", details_inv($id));
    $smarty->display('./tpl/investigador.tpl');
}
else{
    $smarty->assign("lista", lista_inv());
    $smarty->display('./tpl/investigadores.tpl');
}

?>