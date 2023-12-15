<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Patient Registration</title>
    <link rel="icon" type="../image/png" sizes="16x16" href="../img/icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/patient-register.css">
</head>
<body>

<nav aria-label="breadcrumb" class="breadcrumb-container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Patient Registration</li>
    </ol>
</nav>

<div class="container">
    <div class="form-container">
        <i class="fas fa-user-plus form-icon"></i>
        <h2 class="mb-4">Patient Registration</h2>

        <form onsubmit="return validateForm()" action="${pageContext.request.contextPath}/patient/registerProcess" method="post">
            <div class="mb-3 row d-flex justify-content-center">
                <label for="username" class="col-sm-2 col-form-label text-end required">Username *</label>
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

            <div class="mb-3 row d-flex justify-content-center">
                <label for="gender" class="col-sm-2 col-form-label text-end required">Gender *</label>
                <div class="col-sm-4">
                    <select class="form-select" id="gender" name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Secret">Secret</option>
                    </select>
                </div>
            </div>

            <div class="mb-3 row d-flex justify-content-center">
                <label for="dob" class="col-sm-2 col-form-label text-end required">Date of Birth *</label>
                <div class="col-sm-4">
                    <input type="date" class="form-control" id="dob" name="dob" required>
                </div>
            </div>

            <div class="mb-3 row d-flex justify-content-center">
                <label for="email" class="col-sm-2 col-form-label text-end">Email</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                </div>
            </div>

            <div class="mb-3 row d-flex justify-content-center">
                <label for="phone" class="col-sm-2 col-form-label text-end">Phone</label>
                <div class="col-sm-4">
                    <input type="tel" class="form-control" id="phone" placeholder="Enter phone number" name="phone">
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-submit">Register</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/patient-register.js"></script>

</body>
</html>
