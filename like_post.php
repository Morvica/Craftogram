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
$postId = $data['id'] ?? null; // Fetching the ID from the request body

if ($postId) {
    // Check if the post is already liked by the user (assumed anonymous)
    $likeQuery = "INSERT INTO post_likes (post_id) VALUES (?)";
    $stmt = $conn->prepare($likeQuery);
    $stmt->bind_param("i", $postId);
    
    if ($stmt->execute()) {
        // Fetch the updated like count
        $countQuery = "SELECT COUNT(*) AS like_count FROM post_likes WHERE post_id = ?";
        $countStmt = $conn->prepare($countQuery);
        $countStmt->bind_param("i", $postId);
        $countStmt->execute();
        $countResult = $countStmt->get_result();
        $countRow = $countResult->fetch_assoc();

        echo json_encode(['success' => true, 'like_count' => $countRow['like_count']]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error liking post']);
    }

    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Post ID is required']);
}

$conn->close();
?>
