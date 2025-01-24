<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection settings
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

$data = json_decode(file_get_contents('php://input'), true);
$blog_id = $data['blog_id'];
$comment = $data['comment'];

// Insert comment into database
$commentQuery = "INSERT INTO blog_comments (blog_id, comment, comment_time) VALUES (?, ?, NOW())";
$stmt = $conn->prepare($commentQuery);
$stmt->bind_param("is", $blog_id, $comment);
$result = $stmt->execute();

if ($result) {
    $newCommentId = $stmt->insert_id; // Get the ID of the newly inserted comment
    echo json_encode([
        "success" => true,
        "comment" => [
            "id" => $newCommentId,
            "text" => $comment,
            "time" => date("Y-m-d H:i:s") // Or fetch from the database if you have the timestamp
        ]
    ]);
} else {
    echo json_encode(["success" => false, "message" => "Failed to submit the comment."]);
}

$conn->close();
?>
