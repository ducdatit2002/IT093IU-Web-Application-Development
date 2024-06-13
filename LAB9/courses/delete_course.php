<?php
include 'db.php'; // Your database connection file

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = htmlspecialchars($_POST['id']);

    // SQL to delete course
    $sql = "DELETE FROM course WHERE id = ?";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$id]);
        echo "Course deleted successfully.";
    } catch (PDOException $e) {
        die("Error deleting course: " . $e->getMessage());
    }
}
?>

<form method="post">
    Course ID to Delete: <input type="text" name="id" required><br>
    <input type="submit" value="Delete Course" onclick="return confirm('Are you sure you want to delete this course?');">
</form>
