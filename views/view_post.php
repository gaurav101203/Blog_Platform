<?php
// Start session to check if user is logged in (optional for additional features like commenting)
session_start();
include('../config/db.php');

// Check if a post ID is passed in the URL
if (!isset($_GET['id'])) {
    echo "Invalid post!";
    exit;
}

// Get the post ID from the URL
$post_id = $_GET['id'];

// Fetch the post from the database
$stmt = $pdo->prepare("SELECT * FROM posts WHERE id = ? AND status = 'published'");
$stmt->execute([$post_id]);
$post = $stmt->fetch();

// Check if the post exists and is published
if (!$post) {
    echo "Post not found or not published!";
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
    <title><?= htmlspecialchars($post['title']) ?></title>
</head>
<body><div class="view">
    <h1><?= htmlspecialchars($post['title']) ?></h1>
    <p><strong>Published on:</strong> <?= $post['created_at'] ?></p>
    <p><strong>Tags:</strong> <?= htmlspecialchars($post['tags']) ?></p>
    <div>
        <?= nl2br(htmlspecialchars($post['content'])) ?>
    </div>

    <!-- Optional: Add back or home button to go back to the list of posts -->
    <br>
    <button class="button" onclick="window.location.href='../index.php'">Back to Blogs</button>
    </div>
</body>
</html>
