<?php
session_start();
include('../config/db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the JSON data from the request
    $data = json_decode(file_get_contents('php://input'), true);

    $title = $data['title'];
    $content = $data['content'];
    $tags = $data['tags'];
    $user_id = $_SESSION['user_id'];

    // Check if a draft already exists for this user
    $stmt = $pdo->prepare("SELECT * FROM drafts WHERE user_id = ?");
    $stmt->execute([$user_id]);
    $draft = $stmt->fetch();

    if ($draft) {
        // Update the existing draft
        $stmt = $pdo->prepare("UPDATE drafts SET title = ?, content = ?, tags = ?, status = ? WHERE user_id = ?");
        $stmt->execute([$title, $content, $tags, 'draft', $user_id]); // Set status to 'draft' on update
    } else {
        // Create a new draft with status
        $stmt = $pdo->prepare("INSERT INTO drafts (user_id, title, content, tags, status) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$user_id, $title, $content, $tags, 'draft']); // Set status to 'draft'
    }

    echo json_encode(['message' => 'Draft auto-saved!']);
}
?>
