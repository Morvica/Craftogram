<?php
// Database connection settings
$servername = '127.0.0.1'; // or your DB host
$dbname = 'craftogram'; // your database name
$username = 'root'; // your MySQL username
$password = ''; // your MySQL password

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    http_response_code(500); // Return error status
    echo json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Get form data
$title = $_POST['title'];  // Add title
$description = $_POST['description'];  // Add description
$organizer = $_POST['organizer'];
$location = $_POST['location'];
$event_date = $_POST['event_date'];
$event_time = $_POST['event_time'];
$fees = $_POST['fees'];
$category = $_POST['category'];  // Add category
$language = $_POST['language'];  // Add language

// Handle image upload
if (isset($_FILES['image_path']) && $_FILES['image_path']['error'] === UPLOAD_ERR_OK) {
    $image_name = $_FILES['image_path']['name'];
    $image_tmp = $_FILES['image_path']['tmp_name'];
    $image_path = 'uploads/' . $image_name; // Change to 'image_path'
    move_uploaded_file($image_tmp, $image_path);
} else {
    $image_path = '';  // Default or no image
}

// Insert the event into the database
$sql = "INSERT INTO events (title, description, organizer, location, event_date, event_time, fees, image_path, category, language)
        VALUES ('$title', '$description', '$organizer', '$location', '$event_date', '$event_time', '$fees', '$image_path', '$category', '$language')";

if ($conn->query($sql) === TRUE) {
    echo "New event created successfully!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
