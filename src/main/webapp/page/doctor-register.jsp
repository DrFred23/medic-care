<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Doctor Registration</title>
    <link rel="icon" type="../image/png" sizes="16x16" href="../img/icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="../css/doctor-register.css">

</head>
<body>

<div class="container">
    <div class="form-container">
        <i class="fas fa-user-plus form-icon"></i>
        <h2 class="mb-4">Doctor Registration</h2>

        <form onsubmit="return validateForm()" action="${pageContext.request.contextPath}/doctor/registerProcess" method="post">
            <div class="mb-3 row d-flex justify-content-center">
                <label for="username" class="col-sm-2 col-form-label text-end required">Doctor Code *</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
                </div>
            </div>

            <div class="mb-3 alert alert-danger ${not empty errorMessage ? '' : 'd-none'}">
                This account already exists, please try to register another account.
            </div>

            <div class="mb-3 row d-flex justify-content-center">
                <label for="password" class="col-sm-2 col-form-label text-end required">Password *</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
                </div>
            </div>

            <div class="mb-3 row d-flex justify-content-center">
                <label for="confirmPassword" class="col-sm-2 col-form-label text-end required">Confirm Password *</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm password" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-submit">Register</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/doctor-register.js"></script>

</body>
</html>
