<?php
	$createAnswer = "http://localhost:8080/dbConn/api/createAnswer.php?id=1&text=hejmeddig";
	$createQuestion = "http://localhost:8080/dbConn/api/createQuestion.php?id=1&answer=2&text=hejmeddig";
	$createQuiz = "http://localhost:8080/dbConn/api/createQuiz.php?title=quiz1&description=hej&creator=2";
	$createUser = "http://localhost:8080/dbConn/api/createUser.php?fname=ben&midname=ja&lname=min&uname=bensand&pass=1234&mail=hej@meddig.dk";
	$insertUserAnswer = "http://localhost:8080/dbConn/api/insertUserAnswer.php?id=1&answer=1&userID=1";

	require_once 'includes/dbOperation.php';

?>
<html>
	<head>
		<title>CaBeMa API</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">		
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>

	<body>
		<div>
			<ul>
				<li><a href="?page=createQuiz">Create quiz</a></li>
				<li><a href="?page=createQuestion">Create question</a></li>
				<li><a href="?page=createAnswer">Create answer</a></li>
				<li><a href="?page=createUser">Create user</a></li>
				<li><a href="?page=insertUserAnswer">Insert answer from user</a></li>
			</ul>

			<div>
				<?php 
					if(isset($_GET['page'])){
						include "./api/".$_GET['page'].".php";
					}
				 ?>
			</div>

		</div>
	</body>
</html>