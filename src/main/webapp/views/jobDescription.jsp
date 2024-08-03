<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AI Interviewer - Job Description</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<script src="/scripts/script_for_jobDescription.js"></script> 
<!-- <script src="/views/script_for_jobDescription.js"></script> -->
<link rel="stylesheet" href="/CSS/styles_for_main.css">

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


	<!-- Job Descripttion -->

	<div id="job_description_cont" class="container-fluid my-4">

		<div class="px-4 pt-2 my-8 md-5 mb-4 text-center ">
			<header class="flex-column heading-combo mb-5">
				<h1 style="font-family: 'Trebuchet MS'; font-weight: 700;">Select
					a Job description</h1>
			</header>
			<div class="flex-column launch-wrap">
				<div class="flex column chips-container">
					<div class="roles-chips" role="radiogroup"
						aria-label="Select a job description from the following options">
						<label class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="true"
							aria-labelledby="chip-label-Custom-Job-Description"
							name="role-chip-group"> <span
							id="chip-label-Custom-Job-Description">Custom Job
								Description</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="false" value="Business Analyst"
							aria-labelledby="chip-label-Business-Analyst"
							name="role-chip-group"> <span
							id="chip-label-Business-Analyst">Business Analyst</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="false" value="Product Manager"
							aria-labelledby="chip-label-Product-Manager"
							name="role-chip-group"> <span
							id="chip-label-Product-Manager">Product Manager</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="false" value="Software Engineer"
							aria-labelledby="chip-label-Software-Engineer"
							value="Software Engineer" name="role-chip-group"> <span
							id="chip-label-Software-Engineer">Software Engineer</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="false" value="Marketing Specialist"
							aria-labelledby="chip-label-Marketing-Specialist"
							name="role-chip-group"> <span
							id="chip-label-Marketing-Specialist">Marketing Specialist</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"> <input
							aria-checked="false" value="Customer Service Representative"
							aria-labelledby="chip-label-Customer-Service-Representative"
							type="radio" name="role-chip-group"><span
							id="chip-label-Customer-Service-Representative"> Customer
								Service Representative</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							aria-checked="false" value="Sales Representative"
							aria-labelledby="chip-label-Sales-Representative" type="radio"
							name="role-chip-group"> <span
							id="chip-label-Sales-Representative">Sales Representative</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							aria-checked="false" value="Human Resources Specialist"
							aria-labelledby="chip-label-Human-Resources-Specialist"
							type="radio" name="role-chip-group"> <span
							id="chip-label-Human-Resources-Specialist">Human Resources
								Specialist</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill rounded-pill pointer"><input
							aria-checked="false" value="Data Analyst"
							aria-labelledby="chip-label-Data-Analyst" type="radio"
							name="role-chip-group"> <span
							id="chip-label-Data-Analyst">Data Analyst</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							aria-checked="false" value="UX/UI Designer"
							aria-labelledby="chip-label-UX/UI-Designer" type="radio"
							name="role-chip-group"> <span
							id="chip-label-UX/UI-Designer">UX/UI Designer</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							aria-checked="false" value="QA Engineer"
							aria-labelledby="chip-label-QA-Engineer" type="radio"
							name="role-chip-group"> <span id="chip-label-QA-Engineer">QA
								Engineer</span></label>
					</div>
					<!-- <div id="show-more-less">
						<button class="review-btn extra-margin-top"
							aria-label="Show less sample job description options"
							aria-expanded="true">Show less</button>
					</div> -->
				</div>
			</div>
			<!-- 720 x 336 -->
			<div class="job-description-container py-4">
				<div class="flex-column job-description-inputs">
					<div class="job-description">
						<textarea class="text-input rounded p-3 container"
							id="job-description" style="height: 336px;"
							placeholder="Select a job role above or paste your own description here"
							maxlength="5000"
							aria-label="Select a job role above or paste your own description here"
							aria-describedby="char-count"></textarea>
						<span id="char-count" class="char-count">5000 chars left </span>
					</div>

				</div>
			</div>


			<div class="question-footer">
				<p class="sr-only" role="alert"></p>
				<div class="flex-column">
					<form action="/questionsList" method="POST">
						<button type="submit" id="generate_questions_btn"
							class="footer-btn modern-btn button-weight rounded-pill gradient px-3 mb-5 py-2">
							Generate Questions
							<svg width="17" height="25" viewBox="0 0 17 25" fill="none"
								xmlns="http://www.w3.org/2000/svg" style="z-index: 1000">
                            <path
									d="M10.1203 16.5467L14.167 12.5L10.1203 8.45333M2.83366 12.5L14.0537 12.5"
									stroke="white" stroke-width="1.5" stroke-miterlimit="10"
									stroke-linecap="round" stroke-linejoin="round"></path>
                        </svg>
						</button>
					</form>
				</div>
			</div>
		</div>

	</div>
	<div>
		<p><%=session.getAttribute("content")%></p>
	</div>


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

</body>
</html>