<?php
include('../config/db.php');
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$username]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        header('Location: dashboard.php');
    } else {
        echo "Invalid credentials!";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/login.css">
    <title>Login</title>
</head>
<body>
    <div class="container">
    <div class="heading">Log In</div>
    <form method="POST" action="login.php" class="form">
      <input required="" class="input" type="text" name="username" placeholder="Username">
      <input required="" class="input" type="password" name="password" placeholder="Password">
      <input class="login-button" type="submit" value="Log In">
      
    </form>
</body>
</html>
