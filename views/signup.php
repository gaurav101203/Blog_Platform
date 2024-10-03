<?php
include('../config/db.php');

$error = ''; // Variable to store error messages

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    // Check if the email or username already exists
    $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ? OR username = ?");
    $stmt->execute([$email, $username]);
    $existingUser = $stmt->fetch();

    if ($existingUser) {
        // If user exists, show an error message
        $error = 'User already exists. Please log in.';
    } else {
        // If no existing user, insert the new user
        $stmt = $pdo->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
        $stmt->execute([$username, $email, $password]);

        // Redirect to login page after successful registration
        header('Location: login.php');
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
    <div class="container">
    <div class="heading">Sign Up</div>
    <form method="POST" action="signup.php" class="form">
        <input class="input" type="text" name="username" placeholder="Username" required><br>
        <input class="input" type="email" name="email" placeholder="Email" required><br>
        <input class="input" type="password" name="password" placeholder="Password" required><br>

        <!-- Display error message if the user exists -->
        <?php if ($error): ?>
            <p style="color:red;"><?= $error ?></p>
        <?php endif; ?>

        <!-- Sign Up button for all users -->
        <button class="login-button" type="submit">Sign Up</button>

        <!-- Show Login button if user already exists -->
        <?php if ($error): ?>
            <button class="login-button" type="button" onclick="window.location.href='login.php'">Login</button>
        <?php endif; ?>
    </form>
</body>
</html>
