<?php
include('config/db.php');

// Initialize the search variable
$search = isset($_GET['search']) ? $_GET['search'] : '';

// Prepare the SQL statement
$query = "SELECT posts.*, users.username 
          FROM posts 
          JOIN users ON posts.user_id = users.id 
          WHERE posts.status = 'published'";

if (!empty($search)) {
    // Add search condition
    $query .= " AND (posts.title LIKE :search OR posts.content LIKE :search)";
}

// Prepare and execute the statement
$stmt = $pdo->prepare($query);

if (!empty($search)) {
    // Bind the search parameter
    $stmt->bindValue(':search', '%' . $search . '%');
}

$stmt->execute();
$posts = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Public Blog</title>
</head>
<body>
    <h1 class="dashboard-header">Published Blog Posts</h1>

    <!-- Search Form -->
    <div class="search-container">
        <form method="GET" action="index.php">
            <input type="text" name="search" placeholder="Search posts..." value="<?= isset($_GET['search']) ? htmlspecialchars($_GET['search']) : '' ?>">
            <button type="submit">Search</button>
        </form>
    </div>

    <ul>
    <?php foreach ($posts as $post): ?>
        <li>
            <a href="views/view_post.php?id=<?= $post['id'] ?>"><?= $post['title'] ?></a>
            <span class="tags">| Tags: <?= $post['tags'] ?></span>
            <span class="status <?= $post['status'] === 'published' ? 'published' : '' ?>">| Status: <?= $post['status'] ?></span>
            <span class="username"> Posted By: <?= $post['username'] ?></span>
        </li>
    <?php endforeach; ?>
    </ul>
</body>

</html>
