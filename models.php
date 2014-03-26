<?php
	function conn_0($host,$bd,$user,$pass){

		try {
			$dbh = new PDO('mysql:host='.$host.'; dbname='.$bd, $user, $pass);

		}
		catch (PDOException $e) {
			print "Error!: " . $e->getMessage() . "<br/>";
			die();
		}

		return $dbh;
	}

	function ListInvQuery($name=""){

		// $dbh=conn_0("10.10.30.27","personal","wmaster","igpwmaster");
		$dbh=conn("personal","wmaster","igpwmaster");
		$dbh->query("SET NAMES 'utf8'");
	    $sql = "SELECT * FROM v_empleado_investigador ";
	    // $sql = "SELECT * FROM v_investigadores ";
	    if (trim($name)!="") {
	    	$sql .= "where ( empleado_name like '%".$name."%' or empleado_surname like '%".$name."%') ";
	    }

	    $i=0;
	    if($dbh->query($sql)){
	        foreach($dbh->query($sql) as $row) {
	            $result["empleado_name"][$i]= $row["empleado_name"];
	            $result["empleado_surname"][$i]= $row["empleado_surname"];
	            $result["idempleado"][$i]= $row["idempleado"];
	            $i++;
	        }

	        if(isset($result["idempleado"])){
	            $result["Count"]=count($result["idempleado"]);
	        }
	        else{
	            $result["Count"]=0;
	        }

	        $result["Error"]=100;

	    }
	    else{
	        $result["Error"]=-100;
	    }

	    $dbh = null;
	    $result["Query"]=$sql;

	    return $result;
	}
	function InvQueryId($id=0){
		// $dbh=conn_0("10.10.30.27","personal","wmaster","igpwmaster");
		$dbh=conn("personal","wmaster","igpwmaster");
		$dbh->query("SET NAMES 'utf8'");
		if ($stmt = $dbh->prepare("SELECT * FROM v_empleado_investigador WHERE idempleado = ? LIMIT 1")) {
		// if ($stmt = $dbh->prepare("SELECT * FROM v_investigadores  LIMIT 1")) {
			$stmt->execute(array($id));
			$result=$stmt->fetch(PDO::FETCH_ASSOC);
			$dni= $result["empleado_dni"];
			if($stmt->rowCount() == 1) {// investigador existe
				$consulta = PublicationQuery($id);
				if ($consulta!=-100) {
					$result["publication"] = PublicationQuery($id);
				}

				$stmt = $dbh->prepare("SELECT * FROM v_empleado_idioma  WHERE dni = ? ");
				$stmt->execute(array($dni));
				// $result["languaje"] = $stmt->fetch(PDO::FETCH_ASSOC);
				$result["languaje"] = $stmt->fetchAll();
				if($stmt->rowCount() >= 1) {
					$stmt = $dbh->prepare("SELECT * FROM v_empelado_postgrado WHERE dni = ? ");
					$stmt->execute(array($dni));
					$result["academic"] = $stmt->fetchAll();
					if ($stmt->rowCount() >= 1) {
						// return $result;
						// $consulta = PublicationQuery($id);
						// if ($consulta!=-100) {
						// 	$result["publication"] = PublicationQuery($id);
						// 	return $result;
						// }
						// else{
						// 	return $result;
						// }
						return $result;
					}
					else{
						return $result;
					}
				}
				else{
					return $result;
				}

			}
			else{
				return -100;
			}
		}
		else{
			return -100;
		}
	    // $sql = "SELECT * FROM v_empleado_users";
	    // $sql .= "where idempleado = ".$id."";


	    // $i=0;
	    // if($dbh->query($sql)){
	    //     foreach($dbh->query($sql) as $row) {
	    //         $result["data"]["empleado_name"]= $row["empleado_name"];
	    //         $result["data"]["empleado_surname"]= $row["empleado_surname"];
	    //         $result["data"]["idempleado"]= $row["idempleado"];
	    //         $i++;
	    //     }

	    //     if(isset($result["idempleado"])){
	    //         $result["Count"]=count($result["idempleado"]);
	    //     }
	    //     else{
	    //         $result["Count"]=0;
	    //     }

	    //     $result["Error"]=100;

	    // }
	    // else{
	    //     $result["Error"]=-100;
	    // }

	    $dbh = null;
	    // $result["Query"]=$sql;

	    // return $result;
	}

	function PublicationQuery($id=0){
		// $dbh=conn_0("10.10.30.25","DB_ITS","wmaster","igpwmaster");
		$dbh=conx("DB_ITS","wmaster","igpwmaster");
		$dbh->query("SET NAMES 'utf8'");
		switch ($id) {
			//Woodman
			case 1:
				$idauthor = 523;
				break;
			//machare
			case 2:
				$idauthor = 241;
				break;
			case 177:
				$idauthor = 271;
				break;
			//Ishitsuka
			case 16:
				$idauthor = 656;
				break;
			//Norabuena
			case 31:
				$idauthor = 712;
				break;
			//Silva
			case 61:
				$idauthor = 775;
				break;
			//Takahashi Guevara
			case 66:
				$idauthor = 745;
				break;
			//Lagos
			case 23:
				$idauthor = 773;
				break;
			//Martinez Grimaldo
			case 23:
				$idauthor = 772;
				break;
			//Tavera
			case 36:
				$idauthor = 590;
				break;
			//Bernal Esquia
			case 37:
				$idauthor = 591;
				break;
			//Macedo Sanchez
			case 47:
				$idauthor = 827;
				break;
			//Espinoza
			case 67:
				$idauthor = 986;
				break;

			default:
				break;
		}
		// $idauthor = 523;
		if ($stmt = $dbh->prepare("SELECT * FROM v_publicacion_autor  WHERE idautor = ? ")) {
			$stmt->execute(array($idauthor));
			// $stmt->execute();
			$result=$stmt->fetchAll();

			if($stmt->rowCount() >= 1) {// investigador existe
				return $result;
			}
			else{
				return -100;
			}
		}
		else{
			return -100;
		}
		$dbh = null;

	}
	// function LanguajeQuery($iduser=0){
	// 	$dbh=conn_0("10.10.30.25","DB_ITS","wmaster","igpwmaster");
	// 	// $dbh=conn("DB_ITS","wmaster","igpwmaster");

	// 	$dbh->query("SET NAMES 'utf8'");
	// 	if ($stmt = $dbh->prepare(" SELECT  * FROM  v_empleado_idioma")) {
	// 	// if ($stmt = $dbh->prepare("SELECT * FROM v_investigadores  LIMIT 1")) {
	// 		$stmt->execute(array($id));
	// 		$result=$stmt->fetch(PDO::FETCH_ASSOC);
	// 		if($stmt->rowCount() == 1) {// investigador existe
	// 			return $result;
	// 		}
	// 		else{
	// 			return -100;
	// 		}
	// 	}
	// 	else{
	// 		return -100;
	// 	}
	// 	$dbh = null;

	// }

?>
