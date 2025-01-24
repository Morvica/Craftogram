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

$data = json_decode(file_get_contents("php://input"), true);
$postId = $data['post_id'] ?? null; // Fetching post ID from request body
$comment = $data['comment'] ?? null; // Fetching comment from request body

if ($postId && $comment) {
    // Insert the comment into the database
    $query = "INSERT INTO post_comments (post_id, comment, comment_time) VALUES (?, ?, NOW())";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("is", $postId, $comment);

    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Comment added successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error adding comment']);
    }
    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Post ID and comment are required']);
}

$conn->close();
?>
