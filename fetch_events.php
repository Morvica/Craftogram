<?php
// Database connection settings (same as in create_event.php)
$servername = '127.0.0.1'; // or your DB host
$dbname = 'craftogram'; // your database name
$username = 'root'; // your MySQL username
$password = ''; // your MySQL password

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    http_response_code(500); // Return error status
    echo json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Query to fetch all events
$sql = "SELECT title, description, event_date as date, fees as price, location, image_path as imageUrl,organizer,event_time FROM events";
$result = $conn->query($sql);

$events = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $events[] = $row;
    }
}

// Return events as JSON
echo json_encode($events);

$conn->close();
?>