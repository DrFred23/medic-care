<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
    <link rel="stylesheet" href="../css/common.css">
</head>
<body>

<nav aria-label="breadcrumb" class="breadcrumb-container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Medical Case List</li>
    </ol>
</nav>

<div class="container">
    <!-- Adjusted width for .case-container -->
    <div class="case-container">
        <div class="case-item case-header-container">
            <div class="container mt-3">
                <h2 class="case-header">Medical Case List</h2>
            </div>
            <c:if test="${user.type eq 0}">
                <div id="search-div" class="container mt-3 justify-content-end custom-row ml-auto">
                    <div class="col-md-6 ml-auto w-100">
                        <div class="input-group">
                            <input id="patient-name" type="text" class="form-control"
                                   placeholder="Search cases by patient name" aria-label="Recipient's username"
                                   aria-describedby="button-addon2" spellcheck="false" data-ms-editor="true">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" onclick="searchCases()">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
        <c:if test="${empty caseInfos}">
            <div>
                <p>You don't have medical records yet.</p>
            </div>
        </c:if>

        <c:forEach items="${caseInfos}" var="caseInfo">
            <div class="case-item">
                <div>
                    <strong>Patient Name:</strong> ${caseInfo.patientName}<br>
                    <strong>Gender:</strong> ${caseInfo.gender}<br>
                    <strong>Birthdate:</strong> <fmt:formatDate value="${caseInfo.dob}" type="date"
                                                                pattern="yyyy-MM-dd"/><br>
                    <strong>Disease:</strong> ${caseInfo.disease}<br>
                    <strong>Status:</strong> ${caseInfo.status}<br>
                    <strong>Remarks:</strong> ${caseInfo.remarks}
                </div>
                <c:if test="${user.type eq 0}">
                    <div class="action-buttons">
                        <div class="btn edit-btn"
                             onclick="editCase(${caseInfo.id}, ${caseInfo.patientId}, '${caseInfo.disease}', '${caseInfo.status}', '${caseInfo.remarks}')">
                            <i class="fas fa-edit"></i> Edit
                        </div>

                        <div class="delete-btn" onclick="deleteCase(${caseInfo.id}, ${user.id})">
                            <i class="fas fa-trash"></i> Delete
                        </div>
                    </div>
                </c:if>
            </div>
        </c:forEach>

        <!-- Add Case Button -->
        <c:if test="${user.type eq 0}">
            <div class="add-case-btn">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#addCaseModal">Add
                    Case
                </button>
            </div>
        </c:if>
    </div>
</div>

<!-- Add Case Modal -->
<c:if test="${user.type eq 0}">
    <div class="modal fade" id="addCaseModal" tabindex="-1" aria-labelledby="addCaseModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCaseModalLabel">Add Medical Case</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Add your form fields for adding a new case here -->
                    <form id="addCaseForm" action="${pageContext.request.contextPath}/createCase?userId=${user.id}"
                          method="post">
                        <!-- Sample: Patient Name Dropdown -->
                        <div class="mb-3">
                            <label for="patientName" class="form-label">Patient Name *</label>
                            <select class="form-select" id="patientName" name="patientId" required>
                                <c:forEach items="${allUsers}" var="user">
                                    <option value="${user.id}">${user.username}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Sample: Disease Input -->
                        <div class="mb-3">
                            <label for="disease" class="form-label">Disease *</label>
                            <input type="text" class="form-control" id="disease" name="disease" required>
                        </div>

                        <!-- Sample: Status Dropdown -->
                        <div class="mb-3">
                            <label for="status" class="form-label">Status *</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="Confirmed">Confirmed</option>
                                <option value="Treating">Treating</option>
                                <option value="Recovered">Recovered</option>
                            </select>
                        </div>

                        <!-- Sample: Remarks Textarea -->
                        <div class="mb-3">
                            <label for="remarks" class="form-label">Remarks</label>
                            <textarea class="form-control" id="remarks" rows="3" name="remarks"></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</c:if>

<!-- Weather Widget -->
<div class="weather-widget">
    <div id="location"></div>
    <div id="weatherDescription"></div>
    <img id="weatherIcon" alt="Weather Icon">
    <div id="temperature"></div>
</div>

<!-- Translation Plugin -->
<div class="translation-plugin">
    <div id="google_translate_element"></div>
    <script type="text/javascript"
            src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="../js/cases.js"></script>

</body>
</html>
