<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Medical information management system</title>
    <link rel="icon" type="image/png" sizes="16x16" href="img/icon.png">

    <!-- Introducing Bootstrap styles-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">

    <!-- Font Awesome Icon library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

<div class="container">
    <div class="jumbotron">
        <h1 class="display-4">MEDICAL INFORMATION MANAGEMENT SYSTEM</h1>
        <p class="lead">Choose your identity</p>
    </div>

    <div class="row text-center">
        <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/doctor/login" class="btn btn-primary btn-entrance">doctor entrance</a>
        </div>
        <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/patient/login" class="btn btn-success btn-entrance">patient entrance</a>
        </div>
    </div>

    <!-- some colorful elements -->
    <div class="row feature-box">
        <div class="col-md-4">
            <i class="fas fa-stethoscope feature-icon"></i>
            <h3 class="mb-3">Professional Medical Services</h3>
            <p class="mb-4">We provide high-quality medical services to ensure you receive professional treatment.</p>
        </div>
        <div class="col-md-4">
            <i class="fas fa-calendar-check feature-icon"></i>
            <h3 class="mb-3">Appointment Management</h3>
            <p class="mb-4">The convenient and fast online appointment system makes it easier for you to schedule your
                medical treatment.</p>
        </div>
        <div class="col-md-4">
            <i class="fas fa-user-md feature-icon"></i>
            <h3 class="mb-3">Professional Doctor Team</h3>
            <p class="mb-4">An experienced team of doctors provides you with the best medical advice.</p>
        </div>
    </div>

</div>

<!-- import Bootstrap JavaScript file -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
