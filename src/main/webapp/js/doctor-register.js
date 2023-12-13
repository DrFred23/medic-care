function validateForm() {
        // Perform your validation here
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmPassword').value;
        

        if (!username || !password || !confirmPassword) {
            alert('Please fill in all required fields.');
            return false; // Prevent form submission
        }

        // Additional validation logic if needed

        return true; // Allow form submission
    }