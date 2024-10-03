<?php
session_start();
include('../config/db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get form data
    $title = $_POST['title'] ?? '';
    $content = $_POST['content'] ?? '';
    $tags = $_POST['tags'] ?? '';
    $status = $_POST['status'] ?? 'draft'; // Default to 'draft' if not set
    $user_id = $_SESSION['user_id'] ?? null; // Ensure user_id is set in the session

    // Insert the post into the posts table
    $stmt = $pdo->prepare("INSERT INTO posts (user_id, title, content, tags, status) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$user_id, $title, $content, $tags, $status]);

    // If the post is published, delete the draft
    if ($status === 'published') {
        $stmt = $pdo->prepare("DELETE FROM drafts WHERE user_id = ?");
        $stmt->execute([$user_id]); // This deletes the draft for the user
    }

    // Redirect to the dashboard
    header('Location: dashboard.php');
    exit();
}

// Load the draft if it exists
$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT * FROM drafts WHERE user_id = ?");
$stmt->execute([$user_id]);
$draft = $stmt->fetch();

// Set default values from the draft or use defaults
$title = $draft ? $draft['title'] : '';
$content = $draft ? $draft['content'] : '';
$tags = $draft ? $draft['tags'] : '';
$status = $draft ? $draft['status'] : 'draft'; // Initialize $status

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create New Post</title>
    <link rel="stylesheet" type="text/css" href="../css/create_post.css">
</head>
<body>
    <form method="POST" action="create_post.php" id="blogPostForm">
        <input type="text" name="title" id="title" value="<?= htmlspecialchars($title) ?>" placeholder="Title" required><br>
        <textarea name="content" id="content" placeholder="Content" required><?= htmlspecialchars($content) ?></textarea><br>
        <input type="text" name="tags" id="tags" value="<?= htmlspecialchars($tags) ?>" placeholder="Tags (optional)"><br>
        <select name="status" class="select" required>
            <option value="" disabled <?= empty($status) ? 'selected' : '' ?>>Select Status</option>
            <option value="draft" <?= $status === 'draft' ? 'selected' : '' ?>>Draft</option>
            <option value="published" <?= $status === 'published' ? 'selected' : '' ?>>Publish</option>
        </select><br>

        <button type="submit">Save Post</button>
    </form>

    <div id="autosave-message"></div>

    <script src="../js/script.js"></script>
</body>
</html>
