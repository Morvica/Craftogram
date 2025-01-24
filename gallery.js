let blogData = []; // Global variable to store blog data

function fetchPostsAndBlogs(category) {
    fetch(`fetch_gallery.php?category=${category}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            displayPosts(data.posts);
            displayBlogs(data.blogs);
            blogData = data.blogs; // Store blog data for modal display
            console.log(blogData); // Debugging: Check if blogData is populated
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

function displayPosts(posts) {
    const gallery = document.getElementById('gallery');
    gallery.innerHTML = ''; // Clear previous posts

    posts.forEach(post => {
        const postContainer = document.createElement('div');
        postContainer.classList.add('post-container');

        postContainer.innerHTML = `
            <img src="${post.image || 'default_image.jpg'}" alt="${post.caption || 'Post Image'}">
            <p class="caption">${post.caption || 'No caption available'}</p>
            <p class="author">by ${post.author_name || 'Unknown'}</p>
            <p class="contact-detail">Contact: ${post.contact_detail || 'No contact available'}</p>
            <p class="email-detail">Email: ${post.email || 'No email available'}</p>
        `;

        // Likes Section
        const likeSection = document.createElement('div');
        likeSection.classList.add('like-section');
        const likeCount = document.createElement('span');
        likeCount.classList.add('like-count');
        likeCount.textContent = `${post.like_count} Likes`;
        const likeButton = document.createElement('button');
        likeButton.textContent = 'Like';

        console.log("Post ID for liking:", post.id); // Debugging

        likeButton.onclick = () => {
            const postId = parseInt(post.id, 10); // Ensure ID is a number
            if (!isNaN(postId)) {
                likePost(postId, likeCount);
            } else {
                console.error('Invalid post ID:', post.id);
            }
        };

        likeSection.append(likeButton, likeCount);

        // Comments Section
        const commentSection = createCommentSection(post);

        // Append sections to postContainer
        postContainer.append(likeSection, commentSection);
        gallery.appendChild(postContainer);
    });
}

// Function to handle like button click for posts
function likePost(postId, likeCountElement) {
    if (!postId || isNaN(postId)) {
        console.error('Post ID is required and must be numeric.');
        return; // Exit if postId is invalid
    }

    fetch('like_post.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: postId }) // Changed 'post_id' to 'id' to match your PHP code
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            likeCountElement.textContent = `${data.like_count} Likes`;
        } else {
            console.error('Error liking post:', data.message);
        }
    })
    .catch(error => console.error('Error:', error));
}

// Function to create the comment section for each post
function createCommentSection(post) {
    const commentSection = document.createElement('div');
    commentSection.classList.add('comment-section');
    const commentsList = document.createElement('div');
    commentsList.classList.add('comments-list');
    
    post.comments.forEach(comment => {
        const commentText = document.createElement('p');
        commentText.textContent = `${comment.comment} (${comment.comment_time})`;
        commentsList.appendChild(commentText);
    });

    const commentForm = document.createElement('form');
    commentForm.onsubmit = function(e) {
        e.preventDefault();
        addComment(post.id, this.commentInput.value, commentsList);
        this.commentInput.value = '';
    };

    const commentInput = document.createElement('input');
    commentInput.name = 'commentInput';
    commentInput.placeholder = 'Add a comment';

    const submitCommentButton = document.createElement('button');
    submitCommentButton.textContent = 'Post';
    commentForm.appendChild(commentInput);
    commentForm.appendChild(submitCommentButton);

    commentSection.append(commentsList, commentForm);
    return commentSection; // Return the created comment section
}

// Function to handle adding a comment for posts
function addComment(postId, comment, commentsList) {
    if (!comment.trim()) {
        console.error('Comment cannot be empty.');
        return; // Exit if comment is empty
    }

    fetch('submit_comment.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ post_id: postId, comment: comment }) // Send post ID and comment
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const newComment = document.createElement('p');
            newComment.textContent = `${comment} (just now)`; // Add comment with timestamp
            commentsList.appendChild(newComment); // Add the new comment to the comments list
        } else {
            console.error('Error submitting comment:', data.message);
        }
    })
    .catch(error => console.error('Error:', error));
}

function displayBlogs(blogs) {
    const blogsSection = document.getElementById('blogs');
    blogsSection.innerHTML = ''; // Clear previous blogs

    blogs.forEach(blog => {
        const blogPost = document.createElement('article');
        blogPost.classList.add('blog-post');
        blogPost.innerHTML = `
            <h3>${blog.title}</h3>
            <p><em>by ${blog.author_name || 'Unknown'}</em></p>
            <p>Contact: ${blog.contact_detail || 'No contact available'}</p>
            <p>Email: ${blog.email || 'No email available'}</p>
            <p>${blog.content.substring(0, 100)}... <span class="read-more" onclick="openModal(${blog.id})">Read More</span></p>
        `;

        // Likes Section for Blog
        const blogLikeSection = document.createElement('div');
        blogLikeSection.classList.add('like-section');
        const blogLikeCount = document.createElement('span');
        blogLikeCount.classList.add('like-count');
        blogLikeCount.textContent = `${blog.like_count} Likes`;
        const blogLikeButton = document.createElement('button');
        blogLikeButton.textContent = 'Like';

        // Like functionality for blog
        blogLikeButton.onclick = () => {
            const blogId = parseInt(blog.id, 10); // Ensure ID is a number
            if (!isNaN(blogId)) {
                likeBlog(blogId, blogLikeCount);
            } else {
                console.error('Invalid blog ID:', blog.id);
            }
        };

        blogLikeSection.append(blogLikeButton, blogLikeCount);
        blogPost.appendChild(blogLikeSection);

        // Comments Section for Blog
        const blogCommentSection = createBlogCommentSection(blog); // Function to create comment section for blogs
        blogPost.appendChild(blogCommentSection);

        blogsSection.appendChild(blogPost);
    });
}

// Function to handle like button click for blogs
// Function to handle like button click for blogs
function likeBlog(blogId, likeCountElement) {
    if (!blogId || isNaN(blogId)) {
        console.error('Blog ID is required and must be numeric.');
        return; // Exit if blogId is invalid
    }

    fetch('like_blog.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ blog_id: blogId }) // Send blog ID
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            likeCountElement.textContent = `${data.like_count} Likes`; // Update like count
        } else {
            console.error('Error liking blog:', data.message);
        }
    })
    .catch(error => console.error('Error:', error));
}


// Function to create the comment section for each blog
function createBlogCommentSection(blog) {
    const commentSection = document.createElement('div');
    commentSection.classList.add('comment-section');
    const commentsList = document.createElement('div');
    commentsList.classList.add('comments-list');

    // Display existing comments for the blog
    blog.comments.forEach(comment => {
        const commentText = document.createElement('p');
        commentText.textContent = `${comment.comment} (${comment.comment_time})`;
        commentsList.appendChild(commentText);
    });

    const commentForm = document.createElement('form');
    commentForm.onsubmit = function(e) {
        e.preventDefault();
        addBlogComment(blog.id, this.commentInput.value, commentsList);
        this.commentInput.value = '';
    };

    const commentInput = document.createElement('input');
    commentInput.name = 'commentInput';
    commentInput.placeholder = 'Add a comment';

    const submitCommentButton = document.createElement('button');
    submitCommentButton.textContent = 'Post';
    commentForm.appendChild(commentInput);
    commentForm.appendChild(submitCommentButton);

    commentSection.append(commentsList, commentForm);
    return commentSection; // Return the created comment section
}

// Function to handle adding a comment for blogs
function addBlogComment(blogId, comment, commentsList) {
    if (!comment.trim()) {
        console.error('Comment cannot be empty.');
        return; // Exit if comment is empty
    }

    fetch('submit_blog_comment.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ blog_id: blogId, comment: comment }) // Send blog ID and comment
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const newComment = document.createElement('p');
            newComment.textContent = `${comment} (just now)`; // Add comment with timestamp
            commentsList.appendChild(newComment); // Add the new comment to the comments list
        } else {
            console.error('Error submitting comment:', data.message);
        }
    })
    .catch(error => console.error('Error:', error));
}

function openModal(blogId) {
    const blog = blogData.find(b => b.id === blogId);

    if (blog) {
        document.getElementById('blogImage').src = `http://localhost/MINI_PROJECT/uploads/${blog.images}` || 'default_image.jpg';
        document.getElementById('blogTitle').textContent = blog.title || 'No Title Available';
        document.getElementById('blogAuthor').textContent = `Written by ${blog.author_name || 'Unknown'}`;
        document.getElementById('blogContact').textContent = `Contact: ${blog.contact_detail || 'No contact available'}`;
        document.getElementById('blogEmail').textContent = `Email: ${blog.email || 'No email available'}`;
        document.getElementById('blogFullDescription').textContent = blog.content || 'No content available.';
        document.getElementById('blogDate').textContent = blog.created_at || 'No date available.';

        document.getElementById('blogModal').style.display = 'flex';
    } else {
        console.error('Blog not found');
    }
}

function closeModal() {
    document.getElementById('blogModal').style.display = 'none';
}

// Smooth scroll to sections and back-to-top functionality
document.getElementById('blogsBtn').addEventListener('click', function () {
    document.getElementById('blogsSection').scrollIntoView({ behavior: 'smooth' });
});

document.getElementById('postsBtn').addEventListener('click', function () {
    document.getElementById('postsSection').scrollIntoView({ behavior: 'smooth' });
});

window.onload = function () {
    fetchPostsAndBlogs('paintings'); // Load posts and blogs on page load
};
