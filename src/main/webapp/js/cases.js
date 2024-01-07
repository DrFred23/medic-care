/**
 * Show add case form
 */
$(document).ready(function () {
    // show add case btn.
    addCaseBtn();

    // get weather info
    getWeatherInfo();
});

/**
 * Show add case button
 */
function addCaseBtn() {
    var addCaseForm = $('#addCaseForm');
    if (addCaseForm.length) {
        addCaseForm.on('submit', function (event) {
            var modal = new bootstrap.Modal($('#addCaseModal'));
            modal.hide();
        });
    }
}

/**
 * search cases by patient name
 * @param patientName
 */
function searchCases() {
    let patientName = $('#patient-name').val();
    if (!patientName) {
        return;
    }

    $.ajax({
        type: 'GET',
        url: window.location.origin + "/search",
        contentType: 'application/json',
        data: {patientName: patientName},
        success: function (response) {
            $('.case-container .case-item:not(.case-header-container)').remove();

            $.each(response, function (index, item) {
                var caseItem = $('<div class="case-item"></div>');

                var patientInfo = $('<div></div>');
                patientInfo.append('<strong>Patient Name:</strong> ' + item.patientName + '<br>');
                patientInfo.append('<strong>Gender:</strong> ' + item.gender + '<br>');
                patientInfo.append('<strong>Birthdate:</strong> ' + item.dob.substring(0, 10) + '<br>');
                patientInfo.append('<strong>Disease:</strong> ' + item.disease + '<br>');
                patientInfo.append('<strong>Status:</strong> ' + item.status + '<br>');
                patientInfo.append('<strong>Remarks:</strong> ' + item.remarks);

                var actionButtons = $('<div class="action-buttons"></div>');
                actionButtons.append('<div class="btn edit-btn" onclick="editCase(' + item.id + ', ' + item.patientId + ', \'' + item.disease + '\', \'' + item.status + '\', \'' + item.remarks + '\')"><i class="fas fa-edit"></i> Edit</div>');
                actionButtons.append('<div class="btn delete-btn" onclick="deleteCase(' + item.id + ', ' + item.patientId + ')"><i class="fas fa-trash"></i> Delete</div>');

                caseItem.append(patientInfo);
                caseItem.append(actionButtons);

                // 将数据追加到页面上的容器
                caseItem.insertBefore('.add-case-btn');

            });
        }
    });
}

/**
 * Delete case
 * @param caseId
 * @param userId
 */
function deleteCase(caseId, userId) {
    // alert('Deleting case with ID ' + caseId);

    var url = window.location.origin + "/deleteCase";

    $.ajax({
        type: 'POST',
        url: url,
        contentType: 'application/json',
        data: JSON.stringify({
            caseId: caseId,
            doctorId: userId
        }),
        success: function () {
            location.reload();
        }
    });
}

/**
 * Edit case
 * @param caseId
 * @param patientId
 * @param disease
 * @param status
 * @param remarks
 */
function editCase(caseId, patientId, disease, status, remarks) {
    $('#patientName').val(patientId);
    $('#disease').val(disease);
    $('#status').val(status);
    $('#remarks').val(remarks);

    var searchParams = new URLSearchParams(window.location.search);
    var myForm = $('#addCaseForm');
    myForm.attr('action', window.location.origin + '/editCase?userId=' + searchParams.get('id') + '&caseId=' + caseId);

    // Show form
    var modal = new bootstrap.Modal(document.getElementById('addCaseModal'));
    modal.show();
}

/**
 * Google translation
 */
function googleTranslateElementInit() {
    new google.translate.TranslateElement({
        pageLanguage: 'en',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE
    }, 'google_translate_element');
}

// Weather API
function getWeatherInfo() {
    const weatherUrl = 'https://weatherapi-com.p.rapidapi.com/current.json';
    const apiKey = 'ff4f5cd3a6mshaae92fcc4c9b174p165136jsn644f4d752007';

// Replace 'your_location' with the desired city name
    const city = 'Dublin';

    $.ajax({
        url: `${weatherUrl}?q=${city}`,
        type: 'GET',
        headers: {
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
        },
        success: function (data) {
            $('#location').text(data.location.name);
            $('#weatherDescription').text(data.current.condition.text);
            $('#weatherIcon').attr('src', `https:${data.current.condition.icon}`);
            $('#temperature').text(`${data.current.temp_c}℃`);
        },
        error: function (error) {
            console.error('Error fetching weather data:', error);
        }
    });
}