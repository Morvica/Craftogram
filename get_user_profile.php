<?php
session_start(); // Start the session

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    echo json_encode(['error' => 'User not logged in']);
    exit();
}

// Database connection settings
$servername = '127.0.0.1'; // or your DB host
$dbname = 'craftogram'; // your database name
$username = 'root'; // your MySQL username
$password = ''; // your MySQL password

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch user information
$current_user = $_SESSION['username'];
$sql_user = "SELECT * FROM users WHERE user_id = '$current_user'";
$result_user = $conn->query($sql_user);
$user_info = $result_user->fetch_assoc();

// Return the user info as JSON
echo json_encode($user_info);

// Close connection
$conn->close();
?>
