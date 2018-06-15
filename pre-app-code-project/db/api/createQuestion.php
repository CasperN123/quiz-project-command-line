<?php
	$response = array(); // Create an array for responses from API - for JSON

	if($_SERVER['REQUEST_METHOD']=='GET' && isset($_GET['id'])) {
 
	    // getting values
	    $quizId = $_GET['id'];
	    $correctAnswer = $_GET['answer'];
	    $trueAnswer = $_GET['trueAnswer'];
	    $points = $_GET['points'];
	    $text = $_GET['text'];
	 
	    // including the db operation file
	    require_once 'includes/dbOperation.php';

	    $db = new dbOperation();
		if(isset($_GET["id"], $_GET["answer"], $_GET["text"], $_GET['trueAnswer'], $_GET['points']))
		{
		    //inserting values 
			if($db->createQuestion($quizId, $correctAnswer, $text, $trueAnswer, $points)){
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
	<p>Create Question:</p><br><br>	
	<input class="form-control" type="text" name="text" placeholder="Type question here"><br>
	<input class="form-control" type="text" name="id" placeholder="Type quiz ID"><br>
	<input class="form-control" type="text" name="answer" placeholder="Insert answer ID"><br>
	<input class="form-control" type="text" name="trueAnswer" placeholder="Insert true answer ID"><br>
	<input class="form-control" type="text" name="points" placeholder="Amount of points for answering correct"><br><br>
	<input class="btn btn-primary" type="submit" name="submitQuestion" value="Submit">
  	<input type="text" name="page" value="createQuestion" hidden>
</form>