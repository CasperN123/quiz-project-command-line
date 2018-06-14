<?php
	$response = array(); // Create an array for responses from API - for JSON

	$example = "http://localhost:8080/dbConn/api/getValidAnswers.php?cAnswer=1&uAnswer=1";

	if($_SERVER['REQUEST_METHOD']=='GET'){
 
	    // getting values
	    $answerNum = $_GET['cAnswer'];
	    $userAnswerNum = $_GET['uAnswer'];
	 
	    // including the db operation file
	    require_once '../includes/dbOperation.php';

	    $db = new dbOperation();
		if(isset($_GET['cAnswer'], $_GET['uAnswer']))
		{
		    //inserting values 
			if($db->getValidAnswers($answerNum, $userAnswerNum)){
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
		$answerNum = null;
		$userAnswerNum = null;

		echo "Parameters have not been set!";
	}


	echo json_encode($response);

?>