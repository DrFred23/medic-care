function deleteCase(caseId) {
        // Add your logic to delete the case with the given ID
        alert('Deleting case with ID ' + caseId);
    }

    // ... (Your existing JavaScript code)
	document.getElementById('addCaseForm').addEventListener('submit', function (event) {
        // Add your logic to handle form submission (e.g., send data to the server)
        alert('Form submitted!');
        event.preventDefault(); // Prevent the default form submission
        // Close the modal if needed
        var modal = new bootstrap.Modal(document.getElementById('addCaseModal'));
        modal.hide();
    });

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