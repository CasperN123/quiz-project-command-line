<?php
	$response = array(); // Create an array for responses from API - for JSON

	$example = "http://localhost:8080/dbConn/api/createAnswer.php?id=1&text=hejmeddig";

	if($_SERVER['REQUEST_METHOD']=='GET'){
 
	    // getting values
	    $questionID = $_GET['id'];
	    $text = $_GET['text'];
	 
	    // including the db operation file
	    require_once '../includes/dbOperation.php';

	    $db = new dbOperation();
		if(isset($_GET["id"], $_GET["text"]))
		{
		    //inserting values 
			if($db->createAnswer($questionID, $text)){
			    $response['error']=false;
			    $response['message']='Answer added successfully';
			} 
			else {
			    $response['error']=true;
			    $response['message']='Could not add answer';
			}

		}
		else {
			$response['error']=true;
			$response['message']='You are not authorized';
		}
	}
	else {
		$questionID = null;
		$text = null;

		echo "Parameters have not been set!";
	}


	echo json_encode($response);

?>