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
		document.getElementById('username').disabled = false;
		document.getElementById('email').disabled = false;
		document.getElementById('password').disabled = false;
		document.getElementById('updateAccount').disabled = false;
		document.getElementById('editButton').disabled = true;
		document.getElementById('deleteAccount').disabled = true;
	});

	document.getElementById('deleteAccount').addEventListener('click', function() {
		if (confirm('Are you sure you want to delete your account? This action cannot be undone.')) {
			alert('Delete Account functionality to be implemented.');
		}
	});

	document.getElementById('updateAccount').addEventListener('click', function() {
		alert('Update Account functionality to be implemented.');
	});

	document.getElementById('profileModal').addEventListener('hidden.bs.modal', function() {
		document.getElementById('username').disabled = true;
		document.getElementById('email').disabled = true;
		document.getElementById('password').disabled = true;
		document.getElementById('username').value = 'JohnDoe';
		document.getElementById('email').value = 'johndoe@example.com';
		document.getElementById('password').value = '';
		document.getElementById('updateAccount').disabled = true;
		document.getElementById('editButton').disabled = false;
		document.getElementById('deleteAccount').disabled = false;
	});

});

