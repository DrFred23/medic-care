<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Medical Case List</title>
    <link rel="icon" type="../image/png" sizes="16x16" href="../img/icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="../css/cases.css">
</head>
<body>

<div class="container">
    <!-- Adjusted width for .case-container -->
    <div class="case-container">
        <h2 class="case-header">Medical Case List</h2>

        <!-- Sample Case Items -->
        <div class="case-item">
            <div>
                <strong>Patient Name:</strong> John Doe<br>
                <strong>Gender:</strong> Male<br>
                <strong>Birthdate:</strong> 1990-01-01<br>
                <strong>Disease:</strong> Fever<br>
                <strong>Status:</strong> In Progress<br>
                <strong>Remarks:</strong> Recovering well
            </div>
            <div class="delete-btn" onclick="deleteCase(1)">
                <i class="fas fa-trash"></i> Delete
            </div>
        </div>

        <div class="case-item">
            <div>
                <strong>Patient Name:</strong> Jane Doe<br>
                <strong>Gender:</strong> Female<br>
                <strong>Birthdate:</strong> 1985-05-15<br>
                <strong>Disease:</strong> Headache<br>
                <strong>Status:</strong> Completed<br>
                <strong>Remarks:</strong> Follow-up needed
            </div>
            <div class="delete-btn" onclick="deleteCase(2)">
                <i class="fas fa-trash"></i> Delete
            </div>
        </div>

        <!-- Add Case Button -->
        <div class="add-case-btn">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCaseModal">Add
                Case
            </button>
        </div>
    </div>
</div>

<!-- Add Case Modal -->
<div class="modal fade" id="addCaseModal" tabindex="-1" aria-labelledby="addCaseModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCaseModalLabel">Add Medical Case</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Add your form fields for adding a new case here -->
                <form id="addCaseForm">
                    <!-- Sample: Patient Name Dropdown -->
                    <div class="mb-3">
                        <label for="patientName" class="form-label">Patient Name *</label>
                        <select class="form-select" id="patientName" required>
                            <option value="john_doe">John Doe</option>
                            <option value="jane_doe">Jane Doe</option>
                            <!-- Add more patient options as needed -->
                        </select>
                    </div>

                    <!-- Sample: Disease Input -->
                    <div class="mb-3">
                        <label for="disease" class="form-label">Disease *</label>
                        <input type="text" class="form-control" id="disease" required>
                    </div>

                    <!-- Sample: Status Dropdown -->
                    <div class="mb-3">
                        <label for="status" class="form-label">Status *</label>
                        <select class="form-select" id="status" required>
                            <option value="in_progress">In Progress</option>
                            <option value="completed">Completed</option>
                            <!-- Add more status options as needed -->
                        </select>
                    </div>

                    <!-- Sample: Remarks Textarea -->
                    <div class="mb-3">
                        <label for="remarks" class="form-label">Remarks</label>
                        <textarea class="form-control" id="remarks" rows="3"></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Weather Widget -->
<div class="weather-widget">
    <div id="weatherDescription"></div>
    <img id="weatherIcon" alt="Weather Icon">
    <div id="temperature"></div>
</div>

<!-- Translation Plugin -->
<div class="translation-plugin">
    <div id="google_translate_element"></div>
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE
            }, 'google_translate_element');
        }
    </script>
    <script type="text/javascript"
            src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/cases.js"></script>

</body>
</html>
