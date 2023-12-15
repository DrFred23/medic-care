<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Patient Login</title>
    <link rel="icon" type="../image/png" sizes="16x16" href="../img/icon.png">

    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">

    <!-- Font Awesome Icon Library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/patient-login.css">
</head>
<body>

<nav aria-label="breadcrumb" class="breadcrumb-container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Patient Login</li>
    </ol>
</nav>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 login-container">
            <i class="fas fa-user-circle login-icon"></i>
            <h2 class="login-heading">Patient Login</h2>
            <form class="login-form" action="${pageContext.request.contextPath}/patient/loginProcess" method="post">
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Username" name="username" required>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" placeholder="Password" name="password" required>
                </div>
                <div class="mb-3 alert alert-danger ${not empty errorMessage ? '' : 'd-none'}">
                    Incorrect username or password, please try again.
                </div>
                <button type="submit" class="btn btn-primary btn-block login-btn">Login</button>
            </form>
            <p class="patient-login">No account? <a href="${pageContext.request.contextPath}/patient/register">Register here</a></p>
        </div>
    </div>
</div>

<!-- Include Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
