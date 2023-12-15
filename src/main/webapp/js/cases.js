/**
 * Delete case
 * @param caseId
 * @param userId
 */
function deleteCase(caseId, userId) {
    // alert('Deleting case with ID ' + caseId);
    var xhr = new XMLHttpRequest();
    var url = window.location.origin + "/deleteCase"

    xhr.open('POST', url, true);
    xhr.setRequestHeader('Content-Type', 'application/json');

    var requestData = {
        caseId: caseId,
        doctorId: userId
    };

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            location.reload();
            // var responseData = JSON.parse(xhr.responseText);
            // console.log(responseData);
        }
    };

    xhr.send(JSON.stringify(requestData));

}

/**
 * Show add case form
 * @type {HTMLElement}
 */
var addCaseForm = document.getElementById('addCaseForm');
if (addCaseForm) {
    addCaseForm.addEventListener('submit', function (event) {
        // Add your logic to handle form submission (e.g., send data to the server)
        // alert('Form submitted!');
        // event.preventDefault(); // Prevent the default form submission
        // Close the modal if needed
        var modal = new bootstrap.Modal(document.getElementById('addCaseModal'));
        modal.hide();
    });
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
const weatherUrl = 'https://weatherapi-com.p.rapidapi.com/current.json';
const apiKey = 'ff4f5cd3a6mshaae92fcc4c9b174p165136jsn644f4d752007';

// Replace 'your_location' with the desired city name
const city = 'Dublin';

fetch(`${weatherUrl}?q=${city}`, {
    method: 'GET',
    headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
    }
})
    .then(response => response.json())
    .then(data => {
        document.getElementById('weatherDescription').innerText = data.current.condition.text;
        document.getElementById('weatherIcon').src = `https:${data.current.condition.icon}`;
        document.getElementById('temperature').innerText = `${data.current.temp_c}℃`;
    })
    .catch(error => console.error('Error fetching weather data:', error));