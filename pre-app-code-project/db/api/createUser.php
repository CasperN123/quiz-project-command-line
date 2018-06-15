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
?>	<form>
		
		<div class="singupform">
			
			<h1>Sign up</h1>
			<p>Please fill out the boxes to sign up!</p>

			<label>Username: </label>
			<input type="text" placeholder="Username..." name="email">

			<label>Password: </label>
			<input type="password" placeholder="Password..." name="password">

			<label>E-mail: </label>
			<input type="email" placeholder="E-mail..." name="username">

			<p>By creating an account you agree to our <a href="https://i.imgflip.com/2c9kfq.jpg">Terms & Privacy</a>.</p>
   		 	<button type="submit" class="registerbtn">Register</button>
  		


		</div>

	</form>