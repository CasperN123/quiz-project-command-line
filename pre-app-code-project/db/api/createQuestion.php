<?php
	$response = array(); // Create an array for responses from API - for JSON

	$example = "http://localhost:8080/dbConn/api/createQuestion.php?id=1&answer=2&text=hejmeddig";

	if($_SERVER['REQUEST_METHOD']=='GET' && isset($_GET['id'])) {
 
	    // getting values
	    $quizId = $_GET['id'];
	    $correctAnswer = $_GET['answer'];
	    $text = $_GET['text'];
	 
	    // including the db operation file
	    require_once '../includes/dbOperation.php';

	    $db = new dbOperation();
		if(isset($_GET["id"], $_GET["answer"], $_GET["text"]))
		{
		    //inserting values 
			if($db->createQuestion($quizId, $correctAnswer, $text)){
			    $response['error']=false;
			    $response['message']='Quiz added successfully';
			} 
			else {
			    $response['error']=true;
			    $response['message']='Could not add quiz';
			}

		}
		else {
			$response['error']=true;
			$response['message']='You are not authorized';
		}
	}
	else {
		$quizId = null;
		$correctAnswer = null;
		$text = null;
	}


	//echo json_encode($response);

?>
<form action="?" method="GET">
	<a>Create Question:</a><br><br>	
	<input class="form-control" type="text" name="inputQuestion" placeholder="Type question here"><br>
	<input class="form-control" type="text" name="inputText" placeholder="Type question text here"><br>
	<input class="form-control" type="text" name="inputAnswerID" placeholder="Insert answer ID"><br>
	<input class="form-control" type="text" name="inputTrueCorrect" placeholder="Insert true answer ID"><br>
	<input class="form-control" type="text" name="inputPoints" placeholder="Amount of points for answering correct"><br><br>
	<input class="btn btn-primary" type="submit" name="submitQuestion" value="Submit">
</form>