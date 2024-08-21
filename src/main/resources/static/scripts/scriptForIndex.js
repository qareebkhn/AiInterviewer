document.addEventListener("DOMContentLoaded", function() {
	// Get the hidden field values
	var isLoggedIn = document.getElementById("isLoggedIn").value;



	// Use these values in your logic
	if (isLoggedIn === 'true') {
		// Code to show the logged-in navbar
		document.getElementById("loggedInNavbar").style.display = "block";
		document.getElementById("loggedOutNavbar").style.display = "none";

	} else {
		// Code to show the logged-out navbar
		document.getElementById("loggedInNavbar").style.display = "none";
		document.getElementById("loggedOutNavbar").style.display = "block";
	}



	// Edit and update account functionality
	document.getElementById('editButton').addEventListener('click', function() {
		document.getElementById('usernameProfile').disabled = false;
		document.getElementById('emailProfile').disabled = false;
		document.getElementById('passwordProfile').disabled = false;
		document.getElementById('updateAccount').disabled = false;
		document.getElementById('editButton').disabled = true;
		document.getElementById('deleteAccount').disabled = true;
	});

	document.getElementById('deleteAccount').addEventListener('click', function() {
		const userId = document.getElementById('currentUserId').value;

		if (confirm("Are you sure you want to delete this account?")) {
			fetch(`/deleteUser/${userId}`, {
				method: 'DELETE'
			})
				.then(response => {
					if (response.ok) {
						alert("User deleted successfully");
						window.location.href = "/logout"; // Redirect to homepage after deletion
					} else {
						alert("Failed to delete user");
					}
				});
		}
	});

	document.getElementById('updateAccount').addEventListener('click', function() {
		const userId = document.getElementById('useridProfile').value;
		const username = document.getElementById('usernameProfile').value;
		const email = document.getElementById('emailProfile').value;
		const password = document.getElementById('passwordProfile').value;

		const userData = {
			id: userId,
			username: username,
			email: email,
			password: password
		};

		fetch(`/update/${userId}`, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(userData)
		})
			.then(response => {
				if (response.ok) {
					alert("User updated successfully");
					location.reload();
				} else {
					alert("Failed to update user");
				}
			});
	});

	// Reset the modal when it is closed
	document.getElementById('profileModal').addEventListener('hidden.bs.modal', function() {
		// Reset form fields
		document.getElementById('usernameProfile').disabled = true;
		document.getElementById('emailProfile').disabled = true;
		document.getElementById('passwordProfile').disabled = true;
		document.getElementById('passwordProfile').value = '';

		// Reset buttons
		document.getElementById('updateAccount').disabled = true;
		document.getElementById('editButton').disabled = false;
		document.getElementById('deleteAccount').disabled = false;
	});

	document.getElementById('startButton').addEventListener('click', function() {

		// Use these values in your logic
		if (isLoggedIn === 'true') {
			// Code to show the logged-in navbar
			window.location.href = '/listOfInterview';

		} else {
			// Code to show the logged-out navbar
			openSignInModal();
		}
	});


	// Mock function to open the sign-in modal
	function openSignInModal() {
		// Use Bootstrap's Modal class to show the modal
		var myModal = new bootstrap.Modal(document.getElementById('signinModal'));
		myModal.show();
	}


	document.getElementById('signupForm').addEventListener('submit', function(event) {
		event.preventDefault(); // Prevent the default form submission

		var password = document.getElementById('password').value;
		var confirmPassword = document.getElementById('confirmPassword').value;
		var passwordMatchError = document.getElementById('passwordMatchError');
		var loadingSpinner = document.getElementById('loadingSpinner');
		var welcomeMessage = document.getElementById('signupwelcomeMessage');
		var modal = bootstrap.Modal.getInstance(document.getElementById('signupModal'));

		// Check if passwords match
		if (password !== confirmPassword) {
			passwordMatchError.style.display = 'block'; // Show error message
		} else {
			// Hide error message if passwords match
			passwordMatchError.style.display = 'none';

			// Show loading spinner
			loadingSpinner.style.display = 'block';

			// Create FormData object to send form data
			var formData = new FormData(document.getElementById('signupForm'));

			// Send the form data using fetch
			fetch('addUser', {
				method: 'POST',
				body: formData
			})
				.then(response => response.json())
				.then(data => {
					loadingSpinner.style.display = 'none'; // Hide loading spinner


				})
				.catch(error => {
					console.error('Error:', error);
					loadingSpinner.style.display = 'none'; // Hide loading spinner
					// Optionally show an error message to the user
				});
			// Clear form fields
			document.getElementById('signupForm').reset();
			welcomeMessage.style.display = 'block'; // Show welcome message
		}
	});

	document.getElementById('signupForm').addEventListener('submit', function(event) {
		event.preventDefault(); // Prevent the default form submission

		var password = document.getElementById('password').value;
		var confirmPassword = document.getElementById('confirmPassword').value;
		var passwordMatchError = document.getElementById('passwordMatchError');
		var loadingSpinner = document.getElementById('loadingSpinner');
		var welcomeMessage = document.getElementById('signupwelcomeMessage');
		var modal = bootstrap.Modal.getInstance(document.getElementById('signupModal'));

		// Check if passwords match
		if (password !== confirmPassword) {
			passwordMatchError.style.display = 'block'; // Show error message
		} else {
			// Hide error message if passwords match
			passwordMatchError.style.display = 'none';

			// Show loading spinner
			loadingSpinner.style.display = 'block';

			// Create FormData object to send form data
			var formData = new FormData(document.getElementById('signupForm'));

			// Send the form data using fetch
			fetch('addUser', {
				method: 'POST',
				body: formData
			})
				.then(response => response.json())
				.then(data => {
					loadingSpinner.style.display = 'none'; // Hide loading spinner


				})
				.catch(error => {
					console.error('Error:', error);
					loadingSpinner.style.display = 'none'; // Hide loading spinner
					// Optionally show an error message to the user
				});
			// Clear form fields
			document.getElementById('signupForm').reset();
			welcomeMessage.style.display = 'block'; // Show welcome message
		}
	});
});

