<?php
session_start(); // Start the session

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    header("Location:index.php"); // Redirect to login if not logged in
    exit();
}

// Database connection settings
$servername = '127.0.0.1';
$dbname = 'craftogram';
$username = 'root';
$password = '';

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch user information
$current_user = $_SESSION['username'];
$sql_user = "SELECT * FROM users WHERE user_id = '$current_user'";
$result_user = $conn->query($sql_user);
$user_info = $result_user->fetch_assoc();

// Handle profile update
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get user data from form
    $first_name = $conn->real_escape_string($_POST['first_name']);
    $last_name = $conn->real_escape_string($_POST['last_name']);
    $email = $conn->real_escape_string($_POST['email']);
    $phone = $conn->real_escape_string($_POST['phone']);
    $bio = $conn->real_escape_string($_POST['bio']);

    // Optional: Handle profile picture upload
    if (isset($_FILES['profile_pic']) && $_FILES['profile_pic']['error'] === UPLOAD_ERR_OK) {
        $profile_pic = $_FILES['profile_pic'];
        $target_dir = "uploads/";
        $target_file = $target_dir . basename($profile_pic["name"]);

        // Move uploaded file to desired location
        if (move_uploaded_file($profile_pic["tmp_name"], $target_file)) {
            $sql_update = "UPDATE users SET first_name='$first_name', last_name='$last_name', email='$email', phone='$phone', bio='$bio', profile_pic='$target_file' WHERE user_id='$current_user'";
        }
    } else {
        // Update without profile picture
        $sql_update = "UPDATE users SET first_name='$first_name', last_name='$last_name', email='$email', phone='$phone', bio='$bio' WHERE user_id='$current_user'";
    }

    if ($conn->query($sql_update) === TRUE) {
        header("Location: portfolio.php"); // Redirect to portfolio after successful update
        exit();
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Profile</title>
    <link rel="stylesheet" href="profile.css" />
</head>
<body>
    <h1>Edit Profile</h1>
    <form id="edit-profile-form" method="POST" enctype="multipart/form-data">
        <label for="first-name">First Name:</label>
        <input type="text" name="first_name" id="first-name" value="<?= htmlspecialchars($user_info['first_name']) ?>" required />

        <label for="last-name">Last Name:</label>
        <input type="text" name="last_name" id="last-name" value="<?= htmlspecialchars($user_info['last_name']) ?>" required />

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="<?= htmlspecialchars($user_info['email']) ?>" required />

        <label for="phone">Phone:</label>
        <input type="text" name="phone" id="phone" value="<?= htmlspecialchars($user_info['phone']) ?>" required />

        <label for="bio">Bio:</label>
        <textarea name="bio" id="bio" required><?= htmlspecialchars($user_info['bio']) ?></textarea>

        <label for="profile_pic">Profile Picture:</label>
        <input type="file" name="profile_pic" id="profile_pic" accept="image/*" />

        <button type="submit">Update Profile</button>
    </form>
    <button onclick="window.location.href='portfolio.php'">Cancel</button>
</body>
</html>

<?php
// Close connection
$conn->close();
?>
