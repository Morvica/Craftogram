// profile.js
document.getElementById("profile-form").onsubmit = async function (event) {
    event.preventDefault(); // Prevent default form submission

    const formData = new FormData(this); // Get form data

    try {
        const response = await fetch("update_profile.php", {
            method: "POST",
            body: formData,
        });

        // Check if the response is okay (HTTP status in the range 200-299)
        if (!response.ok) {
            throw new Error("Network response was not ok " + response.statusText);
        }

        const result = await response.json(); // Expecting JSON response
        document.getElementById("message").innerText = result.message;

        if (result.success) {
            // Optionally redirect or refresh
            window.location.href = "portfolio.php";
        }
    } catch (error) {
        console.error("Error:", error);
        document.getElementById("message").innerText = "An error occurred. Please try again.";
    }
};

// Image preview functionality
document.getElementById("profile-pic").onchange = function (event) {
    const reader = new FileReader();
    reader.onload = function () {
        const preview = document.getElementById("profile-pic-preview");
        preview.src = reader.result; // Set the preview image source
        preview.style.display = "block"; // Show the preview
    };
    reader.readAsDataURL(event.target.files[0]); // Read the selected file as data URL
};
