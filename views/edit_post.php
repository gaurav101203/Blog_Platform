<?php
session_start();
include('../config/db.php');

if (!isset($_GET['id'])) {
    header('Location: dashboard.php');
    exit;
}

$post_id = $_GET['id'];
$stmt = $pdo->prepare("SELECT * FROM posts WHERE id = ?");
$stmt->execute([$post_id]);
$post = $stmt->fetch();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $content = $_POST['content'];
    $tags = $_POST['tags'];
    $status = $_POST['status'];

    $stmt = $pdo->prepare("UPDATE posts SET title = ?, content = ?, tags = ?, status = ? WHERE id = ?");
    $stmt->execute([$title, $content, $tags, $status, $post_id]);

    header('Location: dashboard.php');
}
?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/create_post.css">
    <title>Edit Post</title>
</head>
<body>
    <form method="POST" action="edit_post.php?id=<?= $post['id'] ?>">
        <input type="text" name="title" value="<?= $post['title'] ?>" required><br>
        <textarea name="content" required><?= $post['content'] ?></textarea><br>
        <input type="text" name="tags" value="<?= $post['tags'] ?>"><br>
        <select name="status">
            <option value="status" disabled>Status</option>
            <option value="draft" <?= $post['status'] == 'draft' ? 'selected' : '' ?>>Draft</option>
            <option value="published" <?= $post['status'] == 'published' ? 'selected' : '' ?>>Published</option>
        </select><br>
        <button type="submit">Update Post</button>
    </form>
</body>
</html>
