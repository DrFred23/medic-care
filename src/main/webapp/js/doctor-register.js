function validateForm() {
    var username = $('#username').val();
    var password = $('#password').val();
    var confirmPassword = $('#confirmPassword').val();

    if (!username || !password || !confirmPassword) {
        alert('Please fill in all required fields.');
        return false; // Prevent form submission
    }

    return true;
}

