<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "1234";
$dbname = "school";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully<br>";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $student_id = $_POST['student_id'];
    $full_name = $_POST['full_name'];
    $department = $_POST['department'];
    $email = $_POST['email'];
    $gender = $_POST['gender'];

    // Insert data into database
    $sql = "INSERT INTO students (student_id, full_name, department, email, gender)
            VALUES ('$student_id', '$full_name', '$department', '$email', '$gender')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully<br>";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Retrieve data and display
    $sql = "SELECT * FROM students WHERE student_id='$student_id'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            echo "ID: " . $row["id"]. " - Student ID: " . $row["student_id"]. " - Name: " . $row["full_name"]. " - Department: " . $row["department"]. " - Email: " . $row["email"]. " - Gender: " . $row["gender"]. "<br>";
        }
    } else {
        echo "0 results";
    }
}

$conn->close();
?>
