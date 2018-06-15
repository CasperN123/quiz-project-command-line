<?php
	$response = array(); // Create an array for responses from API - for JSON

	$example = "http://localhost:8080/dbConn/api/createAnswer.php?id=1&text=hejmeddig";

	if($_SERVER['REQUEST_METHOD']=='GET' && isset($_GET['id'])){
 
	    // getting values
	    $questionID = $_GET['id'];
	    $text = $_GET['text'];
	    $answerLocalID = $_GET['answerID'];
	 
	    // including the db operation file
	    require_once '../includes/dbOperation.php';

	    $db = new dbOperation();
		if(isset($_GET["id"], $_GET["text"]))
		{
		    //inserting values 
			if($db->createAnswer($questionID, $text, $answerLocalID)){
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

	}


//	echo json_encode($response);

?>


<form action="?" method="get">
  <p>Create answer:</p><br><br>
  <input type="text" name="text" placeholder="Type the answer text" class="form-control"><br>
  <input type="text" name="id" placeholder="Type question id" class="form-control"><br>
  <input type="text" name="answerID" placeholder="Type the answerID" class="form-control"><br><br>
  <input type="submit" value="Submit" class="btn btn-primary">
</form>