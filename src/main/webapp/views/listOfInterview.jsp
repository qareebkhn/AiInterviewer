<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>List of Interviews | AI Interviewer</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet" href="/views/styles_for _main.css">
<link rel="script" href="/views/script_for_main.js">

</head>


<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	if (session.getAttribute("username") == null) {
		response.sendRedirect("/");
		System.out.println(session.getAttribute("username"));
	}
	%>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand ms-3" href="/"> <img
				src="/images/logo.png" alt="Logo" width="190" height="35"
				class="d-inline-block align-text-top">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<div class="container-fluid d-flex justify-content-end">
					<!-- <button class="btn btn-outline-dark me-3" data-bs-toggle="modal" data-bs-target="#signinModal"
                        style="background-color: #FEC601; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
                        type="submit">Sign in</button> -->
					<!-- <form action="/logout" method="POST">
						<button id="logout" class="btn btn-outline-warning me-4"
							style="color: #000000; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
							type="submit">
							<i class="far fa-sign-in-alt"></i>
							Logout
						</button>
					</form> -->
					<form action="/uploadYourCV" method="POST">
						<button id="lunch_new_interview_btn"
							class="btn btn-outline-warning me-4"
							style="color: #000000; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
							type="submit">
							<i class="far fa-sign-in-alt"></i> Lunch a new Interview
						</button>
					</form>
					<div class="dropdown" style="padding-right: 60px;">
						<a href="#"
							class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false"> <img
							src="/images/userpic.png" alt="" width="32" height="32"
							class="rounded-circle me-2"><strong> <%=session.getAttribute("username")%></strong>
						</a>
						<ul class="dropdown-menu text-small shadow">
							<li><a class="dropdown-item"
								class="btn btn-outline-dark me-3" data-bs-toggle="modal"
								data-bs-target="#profileModal">Profile</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" method="POST" href="/logout">Sign
									out</a></li>

						</ul>
					</div>

				</div>

			</div>
		</div>
	</nav>
	<%-- <form action="/get-interview-results" method="POST">
		<input id="uid" name="uid" type="text"
			value="<%=session.getAttribute("uid")%>">
		<button type="submit">Show all interview result</button>
	</form>
	<p><%=session.getAttribute("interviewResults")%></p>
	 --%>
	<!-- Profile Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1"
		aria-labelledby="profileModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="profileModalLabel">User
						Profile</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="profileForm">
						<div class="mb-3" style="width: 70%; margin: 0 auto;">
							<label for="userid" class="form-label">User ID</label> <input
								type="text" class="form-control" id="userid" name="userid"
								value="12345" readonly>
						</div>
						<div class="mb-3" style="width: 70%; margin: 0 auto;">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" id="username" name="username"
								value="JohnDoe" disabled>
						</div>
						<div class="mb-3" style="width: 70%; margin: 0 auto;">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								value="johndoe@example.com" disabled>
						</div>
						<div class="mb-3" style="width: 70%; margin: 0 auto;">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password"
								name="password" disabled>

						</div>
						<div class="d-flex justify-content-end"
							style="width: 70%; margin: 0 auto;">
							<button type="button" class="btn btn-success" id="updateAccount"
								disabled>Update User</button>
							<button type="button" class="btn btn-primary mx-3"
								id="editButton">Edit User</button>
							<button type="button" class="btn btn-danger" id="deleteAccount">Delete
								User</button>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		document.getElementById('editButton').addEventListener('click',
				function() {
					document.getElementById('username').disabled = false;
					document.getElementById('email').disabled = false;
					document.getElementById('password').disabled = false;

					// Enable the Update User button
					document.getElementById('updateAccount').disabled = false;

					// Disable the Edit and Delete User buttons
					document.getElementById('editButton').disabled = true;
					document.getElementById('deleteAccount').disabled = true;
				});

		document
				.getElementById('deleteAccount')
				.addEventListener(
						'click',
						function() {
							if (confirm('Are you sure you want to delete your account? This action cannot be undone.')) {
								// Handle delete account functionality
								alert('Delete Account functionality to be implemented.');
							}
						});

		// Assuming you will add functionality for the Update User button later
		document.getElementById('updateAccount').addEventListener('click',
				function() {
					// Handle update account functionality
					alert('Update Account functionality to be implemented.');
				});

		// Reset the modal when it is closed
		document
				.getElementById('profileModal')
				.addEventListener(
						'hidden.bs.modal',
						function() {
							// Reset form fields
							document.getElementById('username').disabled = true;
							document.getElementById('email').disabled = true;
							document.getElementById('password').disabled = true;
							document.getElementById('username').value = 'JohnDoe';
							document.getElementById('email').value = 'johndoe@example.com';
							document.getElementById('password').value = '';

							// Reset buttons
							document.getElementById('updateAccount').disabled = true;
							document.getElementById('editButton').disabled = false;
							document.getElementById('deleteAccount').disabled = false;
						});
	</script>





	<!-- Profile In Modal -->
	<!-- <div class="modal fade" id="profilemodal" tabindex="-1"
		aria-labelledby="signinModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="signinModalLabel">Sign In to
						Your Account</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="signinForm" action="/signin" method="POST">
						<div class="mb-3">
							<label for="email" class="form-label">Email address</label> <input
								type="email" class="form-control" id="email" name="email"
								aria-describedby="emailHelp" required>
						</div>


						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="signinpassword"
								name="password" required>
						</div>
						<button type="submit" class="btn btn-primary">Sign In</button>
					</form>
					<div id="loadingSpinner" class="spinner-border text-primary"
						role="status" style="display: none;">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div id="welcomeMessage" class="alert alert-success mt-3"
						style="display: none;">Welcome back! You have signed in
						successfully.</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->




	<div id="list_of_interviews" class="container-fluid p-5 ">
		<table class="table table-striped table-hover border">
			<div class="h4 pb-2 mb-4 text-dark border-bottom border-dark">
				List of Interviews</div>
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Role</th>
					<th scope="col">Type of Interview</th>
					<th scope="col">Status</th>
					<th scope="col">Result</th>
				</tr>
			</thead>
			<tbody>
				<!-- Thymeleaf iteration over interviewResults list -->
				<tr th:each="result, stat : ${interviewResults}">
					<th scope="row" th:text="${stat.count}"></th>
					<td th:text="${result.role}"></td>
					<td th:text="${result.interviewType}"></td>
					<td th:text="${result.comment}"></td>
					<td th:text="${result.result}"></td>
				</tr>
			</tbody>
		</table>
	</div>


	<!-- List of Interview -->
	<!-- <div id="list_of_interviews" class="container-fluid p-5 ">

		<table class="table table-striped table-hover border ">
			<div class="h4 pb-2 mb-4 text-darj border-bottom border-dark">
				List of Interviews</div>
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Role</th>
					<th scope="col">Type of Interview</th>
					<th scope="col">Status</th>
					<th scope="col">Result</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>@mdo</td>

				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
					<td>@twitter</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
					<td>@twitter</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
					<td>@twitter</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
					<td>@twitter</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
					<td>@twitter</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
					<td>@twitter</td>
				</tr>

			</tbody>
		</table>
	</div> -->




	<!-- Footer -->
	<footer id="footer"
		class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<div class="col-md-4 d-flex align-items-center">
			<a href="/"
				class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
				<svg class="bi" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                </svg>
			</a> <span class="mb-3 mb-md-0 text-body-secondary">© 2024
				Company, Inc</span>
		</div>

		<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
			<li class="ms-3"><a class="text-body-secondary" href="#"><svg
						class="bi" width="24" height="24">
                        <use xlink:href="#twitter"></use>
                    </svg></a></li>
			<li class="ms-3"><a class="text-body-secondary" href="#"><svg
						class="bi" width="24" height="24">
                        <use xlink:href="#instagram"></use>
                    </svg></a></li>
			<li class="ms-3"><a class="text-body-secondary" href="#"><svg
						class="bi" width="24" height="24">
                        <use xlink:href="#facebook"></use>
                    </svg></a></li>
		</ul>


	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>