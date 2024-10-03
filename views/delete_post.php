<?php
session_start();
include('../config/db.php');

// Check if the post ID is provided
if (isset($_GET['id'])) {
    $post_id = $_GET['id'];

    // Prepare the delete query
    $stmt = $pdo->prepare("DELETE FROM posts WHERE id = ?");
    $stmt->execute([$post_id]);

    // Redirect back to the dashboard after deletion
    header('Location: dashboard.php');
    exit();
} else {
    // If no ID is provided, redirect with an error message
    header('Location: dashboard.php?error=invalid_post');
    exit();
}
