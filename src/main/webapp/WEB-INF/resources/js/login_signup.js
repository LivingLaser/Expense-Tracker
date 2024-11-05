document.querySelector('.img__btn').addEventListener('click', function () {
    document.querySelector('.cont').classList.toggle('s--signup');
});

function checkPasswordMatchInRealTime() {
    // Get password and confirm password values
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirmPassword');
    const errorMessage = document.getElementById('error-message');

    // Add input event listeners to both password fields
    password.addEventListener('input', validatePasswords);
    confirmPassword.addEventListener('input', validatePasswords);

    function validatePasswords() {
        // Check if passwords match
        if (password.value === confirmPassword.value) {
            // Passwords match, hide error message
            errorMessage.style.display = 'none';
        } else {
            // Passwords do not match, show error message
            errorMessage.style.display = 'block';
        }
    }
}

// Call the function to start real-time validation
checkPasswordMatchInRealTime();