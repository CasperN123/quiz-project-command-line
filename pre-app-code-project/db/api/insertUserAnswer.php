<?php
	$response = array(); // Create an array for responses from API - for JSON

	$example = "http://localhost:8080/dbConn/api/insertUserAnswer.php?id=1&answer=1&userID=1";

	if($_SERVER['REQUEST_METHOD']=='GET'){
 
	    // getting values
	    $questionID = $_GET['id'];
	    $userAnswer = $_GET['answer'];
	    $userID = $_GET['userID'];
	 
	    // including the db operation file
	    require_once '../includes/dbOperation.php';

	    $db = new dbOperation();
		if(isset($_GET['id'], $_GET['answer'], $_GET['userID']))
		{
		    //inserting values 
			if($db->insertUserAnswer($questionID, $userAnswer, $userID)){
			    $response['error']=false;
			    $response['message']='Your answer has been added successfully';
			} 
			else {
			    $response['error']=true;
			    $response['message']='Could not add your answer';
			}

		}
		else {
			$response['error']=true;
			$response['message']='You are not authorized';
		}
	}
	else {
		$questionID = null;
		$userAnswer = null;
		$userID = null;

		echo "Parameters have not been set!";
	}


	echo json_encode($response);

?>