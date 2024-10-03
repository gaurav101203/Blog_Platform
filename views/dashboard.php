<?php
session_start();
include('../config/db.php');

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT * FROM posts WHERE user_id = ?");
$stmt->execute([$user_id]);
$posts = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>Dashboard</title>
</head>
<body>
    <h1 class="dashboard-header">Your Blog Posts</h1>
    <button class="button" onclick="window.location.href='create_post.php?new_post=true'">Create New Post</button>    <ul>
        <?php foreach ($posts as $post): ?>
            <li>
                <a href="edit_post.php?id=<?= $post['id'] ?>"><?= $post['title'] ?></a> | 
                <a href="delete_post.php?id=<?= $post['id'] ?>" onclick="return confirm('Are you sure?')">Delete</a>
                <span class="status <?= $post['status'] === 'published' ? 'published' : 'draft' ?>">
                    | Status: <?= ucfirst($post['status']) ?>
                </span>
            </li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
