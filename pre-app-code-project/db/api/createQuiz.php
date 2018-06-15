<?php
	$response = array();

	$example = "http://localhost:8080/dbConn/api/createQuiz.php?title=quiz1&description=hej&creator=2";

	if($_SERVER['REQUEST_METHOD']=='GET' && isset($_GET['id'])){
 
	    //getting values
	    $title = $_GET['title'];
	    $description = $_GET['description'];	
	    $creator = $_GET['creator'];
	 
	    //including the db operation file
	    require_once '../includes/dbOperation.php';
	 
	    $db = new dbOperation();
		if(isset($_GET["title"], $_GET["description"], $_GET["creator"]))
		{
		    //inserting values 
			if($db->createQuiz($title, $description, $creator)){
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
		$title = null;
		$description = null;
		$creator = null;

	}


	//echo json_encode($response);

?>
<form action="?" method="GET">
	<p>Create Quiz:</p><br><br>
	<input class="form-control" type="text" name="title" placeholder="Enter quiz-title"><br>
	<input class="form-control" type="text" name="description" placeholder="Description of quiz"><br>
	<input class="form-control" type="text" name="creator" placeholder="Enter creator ID"><br><br>
	<input class="btn btn-primary" type="submit" value="Submit" name="submitQuiz">
</form>