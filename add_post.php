<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    echo "Not logged in!";
    exit();
}

// Database connection
$servername = '127.0.0.1';
$dbname = 'craftogram';
$username = 'root';
$password = '';

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $current_user = $_SESSION['username'];
    $caption = $conn->real_escape_string($_POST['caption']);
    $category = $conn->real_escape_string($_POST['category']); // Fetch the selected category

    // Handle image upload
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $file_tmp = $_FILES['image']['tmp_name'];
        $file_name = basename($_FILES['image']['name']);
        $target_dir = "uploads/";
        $image_path = $target_dir . $file_name;

        if (!move_uploaded_file($file_tmp, $image_path)) {
            echo "Failed to upload image.";
            exit();
        }

        // Insert post into the database with category
        $sql = "INSERT INTO posts (user_id, image, caption, category) VALUES ('$current_user', '$image_path', '$caption', '$category')";

        if ($conn->query($sql) === TRUE) {
            echo "Post added successfully!";
        } else {
            echo "Error: " . $conn->error;
        }
    } else {
        echo "No image uploaded.";
    }
}

// Close connection
$conn->close();
?>
