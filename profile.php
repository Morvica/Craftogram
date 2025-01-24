<?php
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection
$servername = '127.0.0.1';
$dbname = 'craftogram';
$username = 'root';
$password = '';

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]);
    exit();
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Capture form inputs
    $user_id = $conn->real_escape_string($_POST['username']);
    $first_name = $conn->real_escape_string($_POST['first_name']);
    $last_name = $conn->real_escape_string($_POST['last_name']);
    $email = $conn->real_escape_string($_POST['email']);
    $phone = $conn->real_escape_string($_POST['phone']);
    $dob = $conn->real_escape_string($_POST['dob']);
    $gender = $conn->real_escape_string($_POST['gender']);
    $bio = $conn->real_escape_string($_POST['bio']);

// Handle file upload (optional)
$profile_pic = "default-profile.jpg";
if (isset($_FILES['profile_pic']) && $_FILES['profile_pic']['error'] === UPLOAD_ERR_OK) {
    $file_tmp = $_FILES['profile_pic']['tmp_name'];
    $file_name = basename($_FILES['profile_pic']['name']);
    $target_dir = "uploads/";
    $target_file = $target_dir . $file_name;
    if (move_uploaded_file($file_tmp, $target_file)) {
        $profile_pic = $target_file;
    }
}

// Check if all required fields are present
if (!$user_id || !$first_name || !$last_name || !$email) {
    echo json_encode(["success" => false, "message" => "Required fields missing"]);
    exit();
}

// Check if the user_id already exists in the database
$check_user = "SELECT * FROM users WHERE user_id = '$user_id'";
$result = $conn->query($check_user);

if ($result->num_rows > 0) {
    // If a user with the same user_id already exists
    echo json_encode(["success" => false, "message" => "User ID already exists. Please choose another one."]);
    exit();
}

// Insert form data into the database
$sql = "INSERT INTO users (user_id, first_name, last_name, email, phone, dob, gender, bio, profile_pic)
        VALUES ('$user_id', '$first_name', '$last_name', '$email', '$phone', '$dob', '$gender', '$bio', '$profile_pic')";
        
if ($conn->query($sql) === TRUE) {
    $_SESSION['username'] = $user_id; // Set the session variable
    echo json_encode(["success" => true, "message" => "Profile saved successfully!"]);
}  else {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Error: " . $conn->error]);
}
}

$conn->close();
exit();
?>
