<?php
include 'db.php'; // Your database connection file

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = htmlspecialchars($_POST['id']);
    $name = htmlspecialchars($_POST['name']);
    $description = htmlspecialchars($_POST['description']);

    // SQL to update course
    $sql = "UPDATE course SET name = ?, description = ? WHERE id = ?";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$name, $description, $id]);
        echo "Course updated successfully.";
    } catch (PDOException $e) {
        die("Error updating course: " . $e->getMessage());
    }
} else {
    // Display the form with existing data
    $id = htmlspecialchars($_GET['id']);
    $sql = "SELECT * FROM course WHERE id = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$id]);
    $course = $stmt->fetch(PDO::FETCH_ASSOC);
?>
    <form method="post">
        Course ID: <input type="text" name="id" value="<?php echo $course['id']; ?>" readonly><br>
        Name: <input type="text" name="name" value="<?php echo $course['name']; ?>"><br>
        Description:<br>
        <textarea name="description" rows="5" cols="40"><?php echo $course['description']; ?></textarea><br>
        <input type="submit" value="Update Course">
    </form>
<?php
}
?>
