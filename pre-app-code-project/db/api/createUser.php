<?php
	$response = array();

	$example = "http://localhost:8080/dbConn/api/createUser.php?fname=ben&midname=ja&lname=min&uname=bensand&pass=1234&mail=hej@meddig.dk";

	if($_SERVER['REQUEST_METHOD']=='GET' && isset($_GET['id'])){
 
	    //getting values
	    $firstname = $_GET['fname'];
	    $middlename = $_GET['midname'];
	    $lastname = $_GET['lname'];
	    $username = $_GET['uname'];
	    $password = $_GET['pass'];
	    $email = $_GET['mail'];
	 
	    //including the db operation file
	    require_once '../includes/dbOperation.php';
	 
	    $db = new dbOperation();
		if(isset($_GET["fname"], $_GET["midname"], $_GET["lname"], $_GET["uname"], $_GET["pass"], $_GET["mail"]))
		{
		    //inserting values 
			if($db->createUser($firstname, $middlename, $lastname, $username, $password, $email)){
			    $response['error']=false;
			    $response['message']='User added successfully';
			} 
			else {
			    $response['error']=true;
			    $response['message']='Could not add user';
			}
		}
		else {
			$response['error']=true;
			$response['message']='You are not authorized';
		}
	}
	else {
		$firstname = null;
		$middlename = null;
		$lastname = null;
		$username = null;
		$password = null;
		$email = null;

	}

	//echo json_encode($response);
?>	
<form action="?" method="GET">
	<p>Create user:</p><br><br>
	<input class="form-control" type="text" placeholder="First name" name="fname"><br>
	<input class="form-control" type="text" placeholder="Middle name (optional)" name="midname"><br>
	<input class="form-control" type="text" placeholder="Last name" name="lname"><br>
	<input class="form-control" type="text" placeholder="Username" name="uname"><br>
	<input class="form-control" type="password" placeholder="Password..." name="inputPassword"><br>
	<input class="form-control" type="email" placeholder="E-mail" name="inputMail"><br><br>
	<input class="btn btn-primary" type="submit" name="submitUser" value="Submit">
</form>