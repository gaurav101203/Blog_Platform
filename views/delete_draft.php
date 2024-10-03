<?php
session_start();
include('../config/db.php');

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$user_id = $_SESSION['user_id'];

// Check if a draft ID is provided
if (isset($_GET['id'])) {
    $draft_id = $_GET['id'];

    // Prepare and execute the SQL statement to delete the draft
    $stmt = $pdo->prepare("DELETE FROM drafts WHERE id = ? AND user_id = ?");
    $stmt->execute([$draft_id, $user_id]);

    // Redirect back to the dashboard after deletion
    header('Location: dashboard.php');
    exit;
} else {
    // If no draft ID is provided, redirect back to the dashboard
    header('Location: dashboard.php');
    exit;
}
