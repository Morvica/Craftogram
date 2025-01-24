<?php
session_start(); // Start the session

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    echo json_encode(['success' => false, 'message' => 'Not logged in.']);
    exit();
}

// Database connection settings
$servername = '127.0.0.1'; // your DB host
$dbname = 'craftogram'; // your database name
$username = 'root'; // your MySQL username
$password = ''; // your MySQL password

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Database connection failed.']);
    exit();
}

// Get the current user's ID
$current_user_id = $_SESSION['username']; // assuming this holds the user_id
$new_user_id = $_POST['username']; // This is the new user ID submitted

// Check if the new user ID already exists in the database, ignoring the current user's ID
$sql_check_user_id = "SELECT COUNT(*) as count FROM users WHERE user_id = '$new_user_id' AND user_id != '$current_user_id'";
$result_check = $conn->query($sql_check_user_id);
$row = $result_check->fetch_assoc();

if ($row['count'] > 0) {
    echo json_encode(['success' => false, 'message' => 'User ID already exists. Please choose another one.']);
    exit();
}

// Prepare to update user information
$first_name = $conn->real_escape_string($_POST['first_name']);
$last_name = $conn->real_escape_string($_POST['last_name']);
$email = $conn->real_escape_string($_POST['email']);
$phone = $conn->real_escape_string($_POST['phone']);
$dob = $conn->real_escape_string($_POST['dob']);
$gender = $conn->real_escape_string($_POST['gender']);
$bio = $conn->real_escape_string($_POST['bio']);
$profile_pic = ''; // Handle file upload separately

// Check if a profile picture is uploaded
if (!empty($_FILES['profile_pic']['name'])) {
    $target_dir = "uploads/"; // Change this to your upload directory
    $target_file = $target_dir . basename($_FILES["profile_pic"]["name"]);
    
    // Move the uploaded file
    if (move_uploaded_file($_FILES["profile_pic"]["tmp_name"], $target_file)) {
        $profile_pic = $conn->real_escape_string($target_file);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error uploading profile picture.']);
        exit();
    }
}

// Update query
$sql_update = "UPDATE users SET 
    user_id = '$new_user_id',
    first_name = '$first_name',
    last_name = '$last_name',
    email = '$email',
    phone = '$phone',
    dob = '$dob',
    gender = '$gender',
    bio = '$bio'" . 
    (!empty($profile_pic) ? ", profile_pic = '$profile_pic'" : "") . 
    " WHERE user_id = '$current_user_id'";

if ($conn->query($sql_update) === TRUE) {
    echo json_encode(['success' => true, 'message' => 'Profile updated successfully.']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error updating profile: ' . $conn->error]);
}

// Close connection
$conn->close();
?>
