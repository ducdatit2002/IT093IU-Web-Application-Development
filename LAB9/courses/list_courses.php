<?php
include 'db.php';

$sql = "SELECT * FROM course";
try {
    $stmt = $pdo->query($sql);
    if ($stmt === false) {
        die("Database error.");
    }
} catch (PDOException $e) {
    die("Error occurred:" . $e->getMessage());
}
?>

<h2>Course List</h2>
<table>
    <tr>
        <th>Course ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
        <tr>
            <td><?php echo htmlspecialchars($row['id']); ?></td>
            <td><?php echo htmlspecialchars($row['name']); ?></td>
            <td><?php echo htmlspecialchars($row['description']); ?></td>
            <td><a href="edit_course.php?id=<?php echo htmlspecialchars($row['id']); ?>">Edit</a></td>
            <td><a href="delete_course.php?id=<?php echo htmlspecialchars($row['id']); ?>" onclick="return confirm('Are you sure?');">Delete</a></td>
        </tr>
    <?php } ?>
</table>
