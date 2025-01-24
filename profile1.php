<?php
session_start(); // Start the session

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    header("Location:index.php"); // Redirect to login page if not logged in
    exit();
}

// Database connection settings
$servername = '127.0.0.1'; // your DB host
$dbname = 'craftogram'; // your database name
$username = 'root'; // your MySQL username
$password = ''; // your MySQL password

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch user information
$current_user = $_SESSION['username'];
$sql_user = "SELECT * FROM users WHERE user_id = '$current_user'"; // Fetch user details based on user_id
$result_user = $conn->query($sql_user);
$user_info = $result_user->fetch_assoc();

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Prepare and bind
    $stmt = $conn->prepare("UPDATE users SET first_name=?, last_name=?, email=?, phone=?, dob=?, gender=?, bio=? WHERE user_id=?");
    
    // Get the uploaded file
    $profile_pic = $_FILES['profile_pic']['name'];
    $target_dir = "uploads/"; // Ensure this directory exists and has proper permissions
    $target_file = $target_dir . basename($profile_pic);

    // Check if a new file is uploaded
    if (move_uploaded_file($_FILES['profile_pic']['tmp_name'], $target_file)) {
        // File upload successful, use new image path
        $stmt->bind_param("ssssssss", $_POST['first_name'], $_POST['last_name'], $_POST['email'], $_POST['phone'], $_POST['dob'], $_POST['gender'], $_POST['bio'], $current_user);
    } else {
        // Use existing image path if no new file was uploaded
        $stmt = $conn->prepare("UPDATE users SET first_name=?, last_name=?, email=?, phone=?, dob=?, gender=?, bio=? WHERE user_id=?");
        $stmt->bind_param("ssssssss", $_POST['first_name'], $_POST['last_name'], $_POST['email'], $_POST['phone'], $_POST['dob'], $_POST['gender'], $_POST['bio'], $current_user);
    }
    
    if ($stmt->execute()) {
        // Success
        $message = "Profile updated successfully!";
        // Optionally, update user_info to reflect the new data
    } else {
        $message = "Error updating profile: " . $stmt->error;
    }
}

// Close connection
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Profile</title>
    <link rel="stylesheet" href="profile1.css" />
</head>
<body>
    <div class="container">
        <h1>Profile Page</h1>
        <form id="profile-form" enctype="multipart/form-data" method="POST">

            <fieldset>
                <legend>Profile Picture</legend>
                <label for="profile-pic" class="custom-file-upload">Upload Profile Picture:</label>
                <input type="file" id="profile-pic" name="profile_pic" accept="image/*" />
                <img id="profile-pic-preview" src="<?= htmlspecialchars($user_info['profile_pic']) ?>" alt="Preview Picture" style="display:block; width: 100px; height: 100px" />
            </fieldset>

            <fieldset>
                <legend>Personal Information</legend>

                <label for="username">User ID:</label>
                <input type="text" id="username" name="username" autocomplete="username" value="<?= htmlspecialchars($user_info['user_id']) ?>" required readonly />

                <label for="first-name">First Name:</label>
                <input type="text" id="first-name" name="first_name" autocomplete="given-name" value="<?= htmlspecialchars($user_info['first_name']) ?>" required />

                <label for="last-name">Last Name:</label>
                <input type="text" id="last-name" name="last_name" autocomplete="family-name" value="<?= htmlspecialchars($user_info['last_name']) ?>" required />

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" autocomplete="email" value="<?= htmlspecialchars($user_info['email']) ?>" required />

                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" autocomplete="tel" value="<?= htmlspecialchars($user_info['phone']) ?>" required />

                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" autocomplete="bday" value="<?= htmlspecialchars($user_info['dob']) ?>" />

                <label for="gender">Gender:</label>
                <select id="gender" name="gender" autocomplete="sex" required>
                    <option value="">Select...</option>
                    <option value="Male" <?= ($user_info['gender'] == 'Male') ? 'selected' : '' ?>>Male</option>
                    <option value="Female" <?= ($user_info['gender'] == 'Female') ? 'selected' : '' ?>>Female</option>
                    <option value="Other" <?= ($user_info['gender'] == 'Other') ? 'selected' : '' ?>>Other</option>
                </select>

                <label for="bio">Bio:</label>
                <textarea id="bio" name="bio" autocomplete="off"><?= htmlspecialchars($user_info['bio']) ?></textarea>
            </fieldset>

            <button type="submit">Save Profile</button>
            <p id="message"><?= isset($message) ? $message : '' ?></p>
        </form>
    </div>
    <script src="profile1.js"></script>
</body>
</html>
