function validateForm() {
        // Perform your validation here
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmPassword').value;
        var gender = document.getElementById('gender').value;
        var dob = document.getElementById('dob').value;

        if (!username || !password || !confirmPassword || !gender || !dob) {
            alert('Please fill in all required fields.');
            return false; // Prevent form submission
        }

        // Additional validation logic if needed

        return true; // Allow form submission
    }