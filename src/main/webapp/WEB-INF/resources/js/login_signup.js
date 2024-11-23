document.querySelector('.img__btn').addEventListener('click', function () {
    document.querySelector('.cont').classList.toggle('s--signup');
});

function validateEmailInput(emailInput, errorElement, button) {
    emailInput.addEventListener('input', function () {
        const emailPattern = /^[a-zA-Z0-9._%+-]+@(gmail|yahoo|outlook)\.com$/;
        const isValid = emailPattern.test(emailInput.value);
        if (isValid) {
            errorElement.style.display = 'none';
        } else {
            errorElement.style.display = 'block';
        }
        toggleButton(button, isValid && confirmPasswordMatch());
    });
}

// Function to validate password match
function checkPasswordMatch(passwordInput, confirmPasswordInput, errorElement, button) {
    function validatePasswords() {
        const passwordsMatch = passwordInput.value === confirmPasswordInput.value && passwordInput.value.length > 0;
        if (passwordsMatch) {
            errorElement.style.display = 'none';
        } else {
            errorElement.style.display = 'block';
        }
        toggleButton(button, validateEmail() && passwordsMatch);
    }

    passwordInput.addEventListener('input', validatePasswords);
    confirmPasswordInput.addEventListener('input', validatePasswords);
}

function validateName() {
    const nameInput = document.querySelector('.sign-up input[name="name"]');
    const nameErrorElement = document.getElementById('name-error');
    const namePattern = /^[A-Za-z\s]+$/; // Only letters and spaces allowed
    const isValid = namePattern.test(nameInput.value);
    if (isValid) {
        nameErrorElement.style.display = 'none';
    } else {
        nameErrorElement.style.display = 'block';
    }
    return isValid;
}

// Function to toggle button state based on validation
function toggleButton(button, isEnabled) {
    button.disabled = !isEnabled;
}

function validateEmail() {
    const emailInput = document.querySelector('.sign-up input[type="email"]');
    const emailPattern = /^[a-zA-Z0-9._%+-]+@(gmail|yahoo|outlook)\.com$/;
    return emailPattern.test(emailInput.value);
}

// Check if passwords match
function confirmPasswordMatch() {
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    return passwordInput.value === confirmPasswordInput.value && passwordInput.value.length > 0;
}

document.addEventListener('DOMContentLoaded', function () {
    // Sign-up email validation
    const signUpEmail = document.querySelector('.sign-up input[type="email"]');
    const signUpEmailError = document.getElementById('signup-email-error');
    const signupButton = document.getElementById('signupButton');
    validateEmailInput(signUpEmail, signUpEmailError, signupButton);

    // Sign-up password match validation
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const passwordError = document.getElementById('error-message');
    checkPasswordMatch(passwordInput, confirmPasswordInput, passwordError, signupButton);

    const nameInput = document.querySelector('.sign-up input[name="name"]');
    nameInput.addEventListener('input', function () {
        validateName();
        toggleButton(signupButton, validateEmail() && confirmPasswordMatch() && validateName());
    });
});