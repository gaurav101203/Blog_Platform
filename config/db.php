<?php
$host = 'localhost';
$dbname = 'blog_platform';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=localhost;port=3306;dbname=blog_platform", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>
