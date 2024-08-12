<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AI Interviewer</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="styles_for _index.css">
<script src="/scripts/scriptForIndex.js"></script>
<title>AI Interviewer</title>
</head>

<body>


	<!-- logged out navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		id="loggedOutNavbar" style="display: none;">
		<div class="container-fluid">
			<a class="navbar-brand ms-3" href="/views/index.jsp"> <img
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
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item me-3 fw-meduim"><a class="nav-link"
						aria-current="page" href="#how_to_use">How to use</a></li>
					<li class="nav-item me-3 fw-meduim"><a class="nav-link"
						href="#about">About</a></li>
					<li class="nav-item me-3 fw-meduim"><a class="nav-link"
						aria-current="page" href="#faq">FAQ</a></li>
					<li class="nav-item me-3 fw-meduim"><a class="nav-link "
						aria-current="page" href="#">Contact Us</a></li>
				</ul>

				<button class="btn btn-outline-dark me-3" data-bs-toggle="modal"
					data-bs-target="#signinModal"
					style="width: 100px; background-color: #FEC601; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
					type="submit">Sign in</button>
				<button class="btn btn-outline-warning me-4" data-bs-toggle="modal"
					data-bs-target="#signupModal"
					style="width: 100px; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
					type="submit">Sign up</button>

			</div>
		</div>

	</nav>
	<!-- end of navbar -->


	<!-- logged in navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		id="loggedInNavbar" style="display: none;">
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
								type="password" class="form-control" id="passwordProfile"
								name="passwordProfile" disabled>

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

	<!-- Sign In Modal -->
	<div class="modal fade" id="signinModal" tabindex="-1"
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
	</div>

	<!-- <script>
document.getElementById('signinForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the default form submission
 
    var loadingSpinner = document.getElementById('loadingSpinner');
    var welcomeMessage = document.getElementById('welcomeMessage');

    loadingSpinner.style.display = 'block'; // Show loading spinner

    // Create FormData object
    var formData = new FormData(document.getElementById('signinForm'));

    // Send the form data using fetch
     fetch('getUserByEmail', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        loadingSpinner.style.display = 'none'; // Hide loading spinner
        

        // Clear form fields
        
    })
    .catch(error => {
        console.error('Error:', error);
        loadingSpinner.style.display = 'none'; // Hide loading spinner
    }); 
    document.getElementById('signinForm').reset();
    welcomeMessage.style.display = 'block'; // Show welcome message
});
</script>
 -->




	<!-- Sign in Modal -->
	<!-- 	<div class="modal fade" id="signinModal" tabindex="-1"
		aria-labelledby="signinModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="signinModalLabel">Login to AI
						Interviewer</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form > 
						<div class="mb-3">
							<label for="email" class="form-label">Email
								address</label> <input type="email" id="loginEmail" name="loginEmail" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
							<div id="LoginEmailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label>
							<input type="password" class="form-control"
								id="loginPassword" name="loginPassword">
						</div>

						<button type="submit" class="btn btn-primary">Sign in</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->
	<!-- end of sign in modal -->

	<!-- Sign Up Modal -->
	<div class="modal fade" id="signupModal" tabindex="-1"
		aria-labelledby="signupModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="signupModalLabel">Create an
						AI Interviewer Account</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="signupForm" action="addUser" method="POST">
						<!-- <div class="mb-3">
							<label for="uid" class="form-label">User ID</label> <input
								type="text" class="form-control" id="uid" name="uid"
								placeholder="user id" required>
						</div> -->
						<div class="mb-3">
							<label for="username" class="form-label">Name</label> <input
								type="text" class="form-control" id="username" name="username"
								placeholder="Your name" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email address</label> <input
								type="email" class="form-control" id="email" name="email"
								aria-describedby="emailHelp" required>
							<div id="emailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>
						<div class="mb-3">
							<label for="confirmPassword" class="form-label">Confirm
								Password</label> <input type="password" class="form-control"
								id="confirmPassword" required>
							<div id="passwordMatchError" class="form-text text-danger"
								style="display: none;">Passwords do not match.</div>
						</div>
						<button type="submit" class="btn btn-primary">Create
							Account</button>
					</form>
					<div id="loadingSpinner" class="spinner-border text-primary"
						role="status" style="display: none;">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div id="signupwelcomeMessage" class="alert alert-success mt-3"
						style="display: none;">Welcome! Your account has been
						created successfully.</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script>
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
</script>



	<!-- 
	 	Sign up Modal
	<div class="modal fade" id="signupModal" tabindex="-1"
		aria-labelledby="signupModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="signupModalLabel">Create an
						AI Interviewer Account</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="signupForm" action="addUser" method="POST">
						<div class="mb-3">
							<label for="uid" class="form-label">User ID</label> <input
								type="text" class="form-control" id="uid" name="uid"
								placeholder="User id" required>
						</div>
						<div class="mb-3">
							<label for="username" class="form-label">Name</label> <input
								type="text" class="form-control" id="username" name="username"
								placeholder="username" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email address</label> <input
								type="email" class="form-control" id="email"
								placeholder="youremail@mail.com" name="email"
								aria-describedby="emailHelp" required>
							<div id="emailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>
						<div class="mb-3">
							<label for="confirmPassword" class="form-label">Confirm
								Password</label> <input type="password" class="form-control"
								id="confirmPassword" required>
							<div id="passwordMatchError" class="form-text text-danger"
								style="display: none;">Passwords do not match.</div>
						</div>
						<button type="submit" class="btn btn-primary">Create
							Account</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	

	<script>
		document
				.getElementById('signupForm')
				.addEventListener(
						'submit',
						function(event) {
							var password = document.getElementById('password').value;
							var confirmPassword = document
									.getElementById('confirmPassword').value;
							if (password !== confirmPassword) {
								event.preventDefault(); // Prevent form submission
								document.getElementById('passwordMatchError').style.display = 'block'; // Show error message
							} else {
								document.getElementById('passwordMatchError').style.display = 'none'; // Hide error message
							}
						});
	</script>
	-->


	<!-- Previous Code -->
	<!-- <div class="modal fade" id="signupModal" tabindex="-1"
		aria-labelledby="signupModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="signupModalLabel">Create an
						AI Interviewer Account</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="addUser" method="POST">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Name</label>
							<input type="text" class="form-control" id="uid" name="uid"
								placeholder="user id"> <input type="text"
								class="form-control" id="username" name="username" placeholder="Your name">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email
								address</label> <input type="email" class="form-control" id="email" name="email"
								aria-describedby="emailHelp">
							<div id="emailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label>
							<input type="password" class="form-control" id="password" name="password">
						</div>
						<div class="mb-3">
							<label for="cexampleInputPassword1" class="form-label">Confirm
								Password</label> <input type="password" class="form-control"
								id="confirmPassword">
						</div> 
						<button type="submit" class="btn btn-primary">Create
							Account</button>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->
	<!-- enf of sing up modal -->


	<!-- Hero section -->
	<div class="container-fluid">
		<div class="px-4 pt-5 my-8 md-5 text-center border-bottom">
			<h1 class="display-4 fw-bold text-body-emphasis fs-sm-1 fs-md-1"
				style="font-family: Cochin;">AI INTEREVIEWER</h1>
			<div class="col-lg-6 mx-auto">
				<p class="lead mb-4 ">Elevate your interviews with AI
					Interviewer: Generate tailored questions, analyze performance, and
					gain insights effortlessly. Streamline your interview process and
					ace your next opportunity with ease.</p>
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
					<div class="d-grid gap-2 col-6 mx-auto">
						<a href="/listOfInterview">
							<button id="startHereButton" class="btn btn-warning fs-5 px-5"
								type="button">Start here for free</button>
						</a>

					</div>
				</div>
			</div>
			<div style="max-height: 50vh;">
				<div class="container px-5">
					<img src="/images/back4.jpeg"
						class="img-fluid border rounded-3 shadow-lg mb-4"
						alt="Example image" width="700" height="200" loading="lazy">
				</div>
			</div>
		</div>
	</div>
	<!-- end of hero section -->

	<!-- How It works -->
	<div class="container" id="how_to_use">
		<div class="px-4 pt-5 my-9 text-center mb-5">
			<div class="col-lg-6 mx-auto">
				<p class="lead fw-meduim fs-6" style="color: #FEC601; margin: 0;">INTERVIEW
					PROCESS</p>
				<p class="lead fw-semibold  fs-1"
					style="margin-bottom: 5px; padding: 0;">How It Works</p>
				<p class="lead fw-meduim  md-4 fs-5"
					style="color: #bbbbbb; font-family: 'Gill Sans'">Once you've
					registered, It's simple to get started</p>
			</div>

		</div>
		<div class="container marketing border-bottom pb-4">

			<!-- Three columns of text below the carousel -->
			<div class="row">
				<div class="col-lg-4">
					<div class="col-auto d-none d-lg-block"
						style="margin-bottom: 15px;">
						<img class="bd-placeholder-img rounded-circle" width="140"
							height="140" " width=" 200" height="250"
							src="/images/uploadCV.jpg" alt="">

					</div>
					<h2 class="fw-normal">Upload Your CV</h2>
					<p>Some representative placeholder content for the three
						columns of text below the carousel. This is the first column.</p>
					<!-- <p>
						<a class="btn btn-secondary" href="#">View details »</a>
					</p> -->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<div class="col-auto d-none d-lg-block"
						style="margin-bottom: 15px;">
						<img class="bd-placeholder-img rounded-circle" width="140"
							height="140" " width=" 200" height="250"
							src="/images/jobDesc.jpg" alt="">

					</div>
					<h2 class="fw-normal">Post Job Description</h2>
					<p>Another exciting bit of representative placeholder content.
						This time, we've moved on to the second column.</p>
					<!-- 	<p>
						<a class="btn btn-secondary" href="#">View details »</a>
					</p> -->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<div class="col-auto d-none d-lg-block"
						style="margin-bottom: 15px;">
						<img class="bd-placeholder-img rounded-circle" width="140"
							height="140" " width=" 200" height="250"
							src="/images/interview.jpg" alt="">

					</div>
					<h2 class="fw-normal">Give interview</h2>
					<p>And lastly this, the third column of representative
						placeholder content.</p>
					<!-- <p>
						<a class="btn btn-secondary" href="#">View details »</a>
					</p> -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->

		</div>

	</div>
	<!-- end of how it works -->


	<!-- Introduction to AI Interviewer -->
	<div class="container col-xxl-8  border-bottom" id="about">
		<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
			<div class="col-10 col-sm-8 col-lg-6">
				<img src="/images/intro.jpg"
					class="d-block mx-lg-auto img-fluid border rounded-3 shadow-lg mb-4"
					alt="Bootstrap Themes" width="700" height="500" loading="lazy">
			</div>
			<div class="col-lg-6">
				<h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3">Introduction
					to AI Interviewer</h1>
				<p class="lead">Efficiently manage and streamline your interview
					process with our AI Interview platform. Leverage advanced AI
					features to automate scheduling, analyze feedback in real-time, and
					evaluate candidates seamlessly. Our application integrates a
					user-friendly interface with powerful backend support, ensuring a
					smooth and effective recruitment experience.</p>
				<!-- <div class="d-grid gap-2 d-md-flex justify-content-md-start">
					<button type="button" class="btn btn-outline-warning btn-lg px-4">Default</button>
				</div> -->
			</div>
		</div>
	</div>
	<!-- end of introuction to AI -->

	<!-- FAQ -->
	<div class="container mb-5 py-5 border-bottom" id="faq">
		<div class="px-4 pt-5 my-9 text-center">
			<div class="col-lg-6 mx-auto">
				<p class="lead fw-meduim  md-4 fs-4"
					style="color: #3b3b3b; font-family: 'Gill Sans'">Frequently
					Asked Questions</p>
				<p class="lead fw-bold"
					style="margin-top: -30px; padding: 0; color: #FEC601; font-family: 'Gill Sans'">______</p>
			</div>

		</div>

		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="false" aria-controls="flush-collapseOne">
						How does AI Interviewer help me prepare for interviews?</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">AI Interviewer assists by
						generating customized interview questions based on your
						preferences and analyzing your performance to provide actionable
						insights for improvement. With its intuitive interface, you can
						simulate real interview scenarios, identify strengths and areas
						for growth, and refine your interview skills effectively.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
						Can I use AI Interviewer on any device?</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">Yes, AI Interviewer is designed
						to be responsive, ensuring seamless usability across various
						devices, including desktops, laptops, tablets, and mobile phones.
						Whether you're at home, in the office, or on the go, you can
						access AI Interviewer effortlessly to sharpen your interview
						readiness.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
						Is my data secure with AI Interviewer?</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">Absolutely. We prioritize the
						security and privacy of your data. AI Interviewer employs robust
						encryption protocols and follows industry best practices to
						safeguard your information. Rest assured that your personal and
						interview-related data remains confidential and protected at all
						times.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseFour"
						aria-expanded="false" aria-controls="flush-collapseThree">
						How accurate are the interview questions generated by AI
						Interviewer?</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">The interview questions generated
						by AI Interviewer are tailored to your profile and the job you're
						targeting, ensuring relevance and accuracy to enhance your
						preparation. Leveraging advanced algorithms, AI Interviewer
						curates a diverse range of questions that reflect the requirements
						of your desired role, providing you with a comprehensive
						preparation experience.</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end of FAQ -->



	<!-- Contact Us -->
	<div class="container" id="contact_us">
		<div class="px-4 pt-5 my-9 text-center">
			<div class="col-lg-6 mx-auto">
				<p class="lead fw-meduim  md-4 fs-4"
					style="color: #3b3b3b; font-family: 'Gill Sans'">Contact Us</p>
				<p class="lead fw-bold"
					style="margin-top: -30px; padding: 0; color: #FEC601; font-family: 'Gill Sans'">______</p>
			</div>

		</div>


		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Name</label>
			<input type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Your name">
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Email
				address</label> <input type="email" class="form-control"
				id="exampleFormControlInput1" placeholder="name@example.com">
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Subject</label>
			<input type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Subject">
		</div>
		<div class="mb-4">
			<label for="exampleFormControlTextarea1" class="form-label">Message</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="3"></textarea>
		</div>
		<div class="d-grid gap-2 col-2 mx-auto">
			<button class="btn btn-warning" type="button">Submit</button>
		</div>
	</div>
	<!-- end of Contact US -->

	<!-- Footer -->
	<div class="container py-4">
		<footer
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
		<!-- end of footer -->



	</div>
	<%
	String username = (String) session.getAttribute("username");
	boolean isLoggedIn = username != null;
	%>

	<!-- Hidden fields to store session attributes -->
	<input type="hidden" id="isLoggedIn" value="<%=isLoggedIn%>">
	<input type="hidden" id="username" value="<%=username%>">

	<%-- <script>
    const isLoggedIn = <%=(session.getAttribute("username") != "null" ? "true" : "false")%>;
    
	</script>
 --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>