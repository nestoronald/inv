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

	function InvQuery($id=0){

		// $dbh=conn_0("10.10.30.27","personal","wmaster","igpwmaster");
		$dbh=conn("personal","wmaster","igpwmaster");
		$dbh->query("SET NAMES 'utf8'");
	    $sql = "SELECT * FROM v_empleado_laboral_cargo WHERE idcargo in(4,5,6,69,70,71,72,73,74,75,89)";
	    // $sql = "SELECT * FROM v_investigadores ";
	    if ($id!=0) {
	    	$sql .= "where idempleado= $id";
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
		if ($stmt = $dbh->prepare("SELECT * FROM v_empleado_laboral_cargo WHERE idempleado = ? and idcargo in(4,5,6,69,70,71,72,73,74,75,89) LIMIT 1")) {
		// if ($stmt = $dbh->prepare("SELECT * FROM v_investigadores  LIMIT 1")) {
			$stmt->execute(array($id));
			$result=$stmt->fetch(PDO::FETCH_ASSOC);
			if($stmt->rowCount() == 1) {// investigador existe
				return $result;
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
		// $dbh=conn_0("10.10.30.27","personal","wmaster","igpwmaster");
		$dbh=conn("DB_ITS","wmaster","igpwmaster");
		$dbh->query("SET NAMES 'utf8'");
		if ($stmt = $dbh->prepare("SELECT * FROM v_empleado_laboral_cargo WHERE idempleado = ? and idcargo in(4,5,6,69,70,71,72,73,74,75,89) LIMIT 1")) {
		// if ($stmt = $dbh->prepare("SELECT * FROM v_investigadores  LIMIT 1")) {
			$stmt->execute(array($id));
			$result=$stmt->fetch(PDO::FETCH_ASSOC);
			if($stmt->rowCount() == 1) {// investigador existe
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

?>
