function validateForm() {
    // Perform your validation here
    var username = $('#username').val();
    var password = $('#password').val();
    var confirmPassword = $('#confirmPassword').val();
    var gender = $('#gender').val();
    var dob = $('#dob').val();

    if (!username || !password || !confirmPassword || !gender || !dob) {
        alert('Please fill in all required fields.');
        return false; // Prevent form submission
    }

    return true;
}
