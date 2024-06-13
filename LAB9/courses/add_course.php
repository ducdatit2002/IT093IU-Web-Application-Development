<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = htmlspecialchars($_POST['id']);
    $name = htmlspecialchars($_POST['name']);
    $description = htmlspecialchars($_POST['description']);

    $sql = "INSERT INTO course (id, name, description) VALUES (?, ?, ?)";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$id, $name, $description]);
        echo "Course added successfully.";
    } catch (PDOException $e) {
        die("Could not add course: " . $e->getMessage());
    }
}
?>

<form method="post">
    Course ID: <input type="text" name="id" required><br>
    Name: <input type="text" name="name" required><br>
    Description:<br>
    <textarea name="description" rows="5" cols="40" required></textarea><br>
    <input type="submit" value="Add Course">
</form>
