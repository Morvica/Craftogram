<?php
// Start the session
session_start();

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

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Sanitize input
    $postTitle = $conn->real_escape_string($_POST['postTitle']);
    $postContent = $conn->real_escape_string($_POST['postContent']);
    $postCategory = $conn->real_escape_string($_POST['postCategory']);
    $author = $conn->real_escape_string($_POST['author']);
    
    // Handle file uploads
    $uploaded_images = [];
    if (!empty($_FILES['postImages']['name'][0])) {
        $image_folder = 'uploads/';
        foreach ($_FILES['postImages']['name'] as $key => $image_name) {
            $image_tmp_name = $_FILES['postImages']['tmp_name'][$key];
            $image_new_name = uniqid() . '-' . basename($image_name);
            $image_path = $image_folder . $image_new_name;

            // Move the uploaded file to the destination folder
            if (move_uploaded_file($image_tmp_name, $image_path)) {
                $uploaded_images[] = $image_new_name; // Store image name in array
            }
        }
    }
    
    // Convert image array to JSON format to save in the database
    $images_json = json_encode($uploaded_images);

    // Insert post data into the blogs table without user_id
    $sql_post = $conn->prepare("INSERT INTO blogs (images, author, title, content, category) VALUES (?, ?, ?, ?, ?)");
    $sql_post->bind_param("sssss", $images_json, $author, $postTitle, $postContent, $postCategory);

    if ($sql_post->execute()) {
        // Check if request was made via AJAX
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            // Return JSON response if AJAX request
            echo json_encode([
                'success' => true,
                'images' => $uploaded_images,
                'author' => $author,
                'title' => $postTitle,
                'content' => $postContent,
                'category' => $postCategory
            ]);
        } else {
            // Redirect if it’s a normal form submission
            header('Location: blog.html'); // Replace with your desired page
            exit();
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Error inserting post']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request']);
}

// Close connection
$conn->close();
?>
