document.getElementById('fileInput').addEventListener('change', function() {
	const file = this.files[0];
	if (file) {
		alert('Selected file: ' + file.name);
	}
});

// Wait for the DOM to fully load before executing the script
document.addEventListener("DOMContentLoaded", function() {
	// Select the button and the div by their IDs
	var button = document.getElementById('btn');
	var div = document.getElementById('list_of_interviews');

	// Add a click event listener to the button
	button.addEventListener('click', function() {
		// Add the new class to the div when the button is clicked
		div.classList.add('hidden');
	});
});


