<?php
	class dbOperation {
		private $conn;

		function __construct() {
			require_once dirname(__FILE__) . '/config.php';
	        require_once dirname(__FILE__) . '/dbConn.php';
	        // opening db connection
	        $db = new dbConnect();
	        $this->conn = $db->connect();   
		}

		public function createQuiz($title, $description, $creator) {
			$stmt = $this->conn->prepare("INSERT INTO Quizzes(title, description, creator) VALUES(?, ?, ?)");
			$stmt->bind_param("ssi", $title, $description, $creator);

			$result = $stmt->execute();
			$stmt->close();

			if($result) {
				return true;
			} else {
				return false;
			}
		}

		// 
		public function createQuestion($quizId, $correctAnswer, $text) {
			$stmt = $this->conn->prepare("INSERT INTO Questions(quizID, correctAnswer, text) VALUES(?, ?, ?)");
	        $stmt->bind_param("iis", $quizId, $correctAnswer, $text);
        	
        	$result = $stmt->execute();
        	$stmt->close();
        	if ($result) {
            	return true;
        	} else {
            	return false;
        	}
		}

		public function createAnswer($questionID, $text, $answerLocalID) {
			$stmt = $this->conn->prepare("INSERT INTO Answers(questionID, answerText, answerLocalID) VALUES(?, ?, ?)");
			$stmt->bind_param("isi", $questionID, $text, $answerLocalID);

			$result = $stmt->execute();
			$stmt->close();

			if ($result) {
				return true;
			} else {
				return false;
			}
		}

		public function createUser($firstname, $middlename, $lastname, $username, $password, $email) {
			$stmt = $this->conn->prepare("INSERT INTO Users(firstname, middlename, lastname, username, password, email) VALUES(?, ?, ?, ?, ?, ?)");
			$stmt->bind_param("ssssss", $firstname, $middlename, $lastname, $username, $password, $email);

        	$result = $stmt->execute();
        	$stmt->close();
        	if ($result) {
            	return true;
        	} else {
            	return false;
        	}
		}

		public function insertUserAnswer($questionID, $userAnswer, $userID) {
			$stmt = $this->conn->prepare("INSERT INTO UserAnswers(questionID, userAnswer, userID) VALUES(?, ?, ?)");
			$stmt->bind_param("iii", $questionID, $userAnswer, $userID);

			$result = $stmt->execute();
			$stmt->close();
			if ($result) {
				return true;
			} else {
				return false;
			}
		}
		/*
		public function getValidAnswers($id) {
			$sql = "SELECT Answers.questionID, answerText
					FROM Answers
					INNER JOIN Questions ON Answers.questionID = Questions.correctAnswer"; // This doesn't work as of yet
			$data;
			while($row = mysqli_fetch($result)) {
				$data[] = $row;

			}
			echo json_encode($data);
		}
		*/
	}
?>