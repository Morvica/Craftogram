document.addEventListener("DOMContentLoaded", function() {
    const postForm = document.getElementById('postForm');

    // Form submission via AJAX
    postForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent default form submission

        const formData = new FormData(postForm);

        fetch('save_post.php', {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest' // Indicate it's an AJAX request
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Show success alert
                alert("Your blog has been published successfully!");
                
                // Clear the form fields
                postForm.reset();
            } else {
                // Show error message if any
                alert("Error: " + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred while submitting the post.');
        });
    });
});
