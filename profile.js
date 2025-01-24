document.getElementById("profile-form").onsubmit = function(event) {
    event.preventDefault();
    let formData = new FormData(document.getElementById("profile-form"));

    fetch('profile.php', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
    })
    .then(result => {
        if (result.success) {
            window.location.href = 'index.php';
        } else {
            document.getElementById("message").textContent = "Error: " + result.message;
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
};
