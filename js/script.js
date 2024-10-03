let autoSaveInterval;

// Function to auto-save the post
function autoSavePost() {
    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value;
    const tags = document.getElementById('tags').value;

    // Perform AJAX request to save the draft
    fetch('../views/autosave_draft.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            title: title,
            content: content,
            tags: tags
        })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('autosave-message').innerText = data.message;
    })
    .catch(error => console.error('Error saving draft:', error));
}

// Start auto-saving when the user is active
function startAutoSave() {
    autoSaveInterval = setInterval(autoSavePost, 1000); // Saves every 1 second
}

// Stop auto-saving when the form is submitted
document.getElementById('blogPostForm').addEventListener('submit', function() {
    clearInterval(autoSaveInterval);
});

// Start auto-saving when the page loads
window.onload = startAutoSave;
