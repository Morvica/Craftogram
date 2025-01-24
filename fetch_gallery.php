<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection settings
$servername = '127.0.0.1';
$dbname = 'craftogram';
$username = 'root';
$password = '';

$conn = new mysqli($servername, $username, $password, $dbname);

// Check for connection error
if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]);
    exit();
}

$category = $_GET['category'] ?? '';
$posts = [];
$blogs = [];

// Fetch posts with the author's full name based on the category
$postQuery = "
    SELECT posts.id, posts.image, posts.caption, 
           CONCAT(users.first_name, ' ', users.last_name) AS author_name, 
           users.phone AS contact_detail, 
           users.email, 
           COUNT(post_likes.id) AS like_count
    FROM posts
    JOIN users ON posts.user_id = users.user_id
    LEFT JOIN post_likes ON posts.id = post_likes.post_id
    WHERE posts.category = ?
    GROUP BY posts.id, posts.image, posts.caption, author_name, users.phone, users.email";

$stmt = $conn->prepare($postQuery);

if ($stmt) {
    $stmt->bind_param("s", $category);
    $stmt->execute();
    $postResult = $stmt->get_result();

    while ($row = $postResult->fetch_assoc()) {
        // Fetch comments for the post
        $commentsQuery = "SELECT comment, comment_time FROM post_comments WHERE post_id = ?";
        $commentsStmt = $conn->prepare($commentsQuery);
        $commentsStmt->bind_param("i", $row['id']);
        $commentsStmt->execute();
        $commentsResult = $commentsStmt->get_result();

        $comments = [];
        while ($commentRow = $commentsResult->fetch_assoc()) {
            $comments[] = $commentRow;
        }
        
        // Include comments and like count in the post data
        $row['comments'] = $comments; // Add comments to the post data
        $row['like_count'] = $row['like_count'] ?? 0; // Initialize like_count if null
        $posts[] = $row;
    }
    $stmt->close(); // Close statement after execution
} else {
    echo json_encode(["success" => false, "message" => "Failed to prepare statement for posts."]);
    exit();
}

// Fetch blogs based on the category
$blogQuery = "
    SELECT blogs.id, 
           blogs.title, 
           blogs.content, 
           CONCAT(users.first_name, ' ', users.last_name) AS author_name,
           users.email, 
           users.phone AS contact_detail, 
           blogs.images, 
           blogs.created_at 
    FROM blogs 
    JOIN users ON blogs.author = users.user_id 
    WHERE blogs.category = ?";

$stmt = $conn->prepare($blogQuery);

if ($stmt) {
    $stmt->bind_param("s", $category);
    $stmt->execute();
    $blogResult = $stmt->get_result();

    while ($row = $blogResult->fetch_assoc()) {
        // Fetch comments for the blog
        $commentsQuery = "SELECT comment, comment_time FROM blog_comments WHERE blog_id = ?";
        $commentsStmt = $conn->prepare($commentsQuery);
        $commentsStmt->bind_param("i", $row['id']);
        $commentsStmt->execute();
        $commentsResult = $commentsStmt->get_result();

        $comments = [];
        while ($commentRow = $commentsResult->fetch_assoc()) {
            $comments[] = $commentRow;
        }

        // Include comments in the blog data
        $row['comments'] = $comments; // Add comments to the blog data
        $blogs[] = [
            'id' => $row['id'],
            'title' => $row['title'],
            'content' => $row['content'],
            'author_name' => $row['author_name'], // Fetch author's full name
            'contact_detail' => $row['contact_detail'], // Include contact detail
            'email' => $row['email'], // Include email
            'images' => trim($row['images'], '[]"'),
            'created_at' => $row['created_at'],
            'comments' => $comments // Add comments for blogs
        ];
    }
    $stmt->close(); // Close statement after execution
} else {
    echo json_encode(["success" => false, "message" => "Failed to prepare statement for blogs."]);
    exit();
}

// Output the JSON data
header('Content-Type: application/json');
echo json_encode(['posts' => $posts, 'blogs' => $blogs]);

$conn->close();
?>
