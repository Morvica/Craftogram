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
$blog_id = $data['blog_id']; // Use 'blog_id' to match the sent key

// Check if blog_id is set and is a number
if (!isset($blog_id) || !is_numeric($blog_id)) {
    echo json_encode(["success" => false, "message" => "Blog ID is required and must be numeric."]);
    exit();
}

// Check if the like already exists
$checkLikeQuery = "SELECT * FROM blog_likes WHERE blog_id = ?";
$checkStmt = $conn->prepare($checkLikeQuery);
$checkStmt->bind_param("i", $blog_id);
$checkStmt->execute();
$result = $checkStmt->get_result();

// if ($result->num_rows > 0) {
//     echo json_encode(["success" => false, "message" => "You have already liked this blog."]);
// } else {
    // Insert like into database
    $likeQuery = "INSERT INTO blog_likes (blog_id) VALUES (?)";
    $likeStmt = $conn->prepare($likeQuery);
    $likeStmt->bind_param("i", $blog_id);
    $likeStmt->execute();

    if ($likeStmt->affected_rows > 0) {
        // Fetch updated like count
        $likeCountQuery = "SELECT COUNT(*) AS like_count FROM blog_likes WHERE blog_id = ?";
        $countStmt = $conn->prepare($likeCountQuery);
        $countStmt->bind_param("i", $blog_id);
        $countStmt->execute();
        $likeResult = $countStmt->get_result();
        $likeCount = $likeResult->fetch_assoc()['like_count'];

        echo json_encode(["success" => true, "like_count" => $likeCount]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to like the blog."]);
    }
// }

// Close prepared statements
$checkStmt->close();
$likeStmt->close();
$countStmt->close();
$conn->close();
?>
