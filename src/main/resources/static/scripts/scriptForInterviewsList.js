document.addEventListener("DOMContentLoaded", function() {

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
});

