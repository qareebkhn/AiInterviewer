
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Your Interview Session | AI Interviewer</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="/views/styles_for _main.css"> -->
<link rel="stylesheet" href="/CSS/styles_for_main.css">
<script src="/scripts/script_for_jobDescription.js"></script>
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


	<!-- navbar -->
	<%-- <nav class="navbar navbar-expand-lg bg-body-tertiary">
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
					<form action="/logout" method="POST">
						<button id="logout" class="btn btn-outline-warning me-4"
							style="color: #000000; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
							type="submit">
							<!-- <i class="far fa-sign-in-alt"></i> -->
							Logout
							<%
							session.removeAttribute("username");
							session.invalidate();
							response.sendRedirect("/");
						%>
						</button>
					</form>
					<!-- <form action="/lunchInterview" method="POST">
						<button id="lunch_new_interview_btn"
							class="btn btn-outline-warning me-4"
							style="color: #000000; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
							type="submit">
							<i class="far fa-sign-in-alt"></i>
							Lunch a new Interview
						</button>
					</form> -->
					<div class="dropdown" style="padding-right: 60px;">
						<a href="#"
							class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false"> <img
							src="https://github.com/mdo.png" alt="" width="32" height="32"
							class="rounded-circle me-2"> <strong>mdo</strong>
						</a>
						<ul class="dropdown-menu text-small shadow">
							<li><a class="dropdown-item" href="#">New project...</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li><a class="dropdown-item" href="#">Profile</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Sign out</a></li>
						</ul>
					</div>

				</div>

			</div>
		</div>
	</nav>
 --%>

	<!-- Questions List -->
	<div class="container mb-5 py-5 border-bottom" id="question_list">
		<!-- <div class="px-4 pt-5 my-9 text-center">
            <div class="col-lg-6 mx-auto">
                <p class="lead fw-meduim  md-4 fs-4" style=" color: #3b3b3b;
            font-family: 'Gill Sans'">Frequently Asked Questions</p>
                <p class="lead fw-bold" style=" margin-top: -30px; padding: 0; color: #FEC601;
            font-family: 'Gill Sans'">______</p>
            </div>
        </div> -->
		<nav
			class="flex-space-between d-flex justify-content-md-start mb-5 nav-container"
			aria-label="Current interview">
			<button
				aria-label="Return to the question generation step to start a new interview"
				aria-haspopup="dialog"
				class="flex-row link-btn back-btn rounded-pill px-3">
				<svg width="16" height="17" viewBox="0 0 16 17" fill="none"
					xmlns="http://www.w3.org/2000/svg">
                    <path
						d="M6.37992 4.45337L2.33325 8.50004L6.37992 12.5467M13.6666 8.50004H2.44659"
						stroke="#6A6C70" stroke-width="1.5" stroke-miterlimit="10"
						stroke-linecap="round" style="border: none;"
						stroke-linejoin="round"></path>
                </svg>
				Question Generation
			</button>
			<div class="flex-space-between question-picker mx-auto">
				<button aria-label="Go to the previous question" class="hidden"
					disabled="">
					<svg width="12" height="12" viewBox="0 0 9 9" fill="none"
						xmlns="http://www.w3.org/2000/svg">
                        <path
							d="M5.50011 7.13999L3.32678 4.96665C3.07011 4.70999 3.07011 4.28999 3.32678 4.03332L5.50011 1.85999"
							stroke="#6A6C70" stroke-width="1.5" stroke-miterlimit="10"
							stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
				</button>

				<span>Question </span>
				<%=session.getAttribute("currentQuestionIndex")%>

				<button aria-label="Go to the next question" class="disabled"
					disabled="">
					<svg width="12" height="12" viewBox="0 0 9 9" fill="none"
						xmlns="http://www.w3.org/2000/svg">
                        <path
							d="M3.47021 7.13999L5.64355 4.96665C5.90022 4.70999 5.90022 4.28999 5.64355 4.03332L3.47021 1.85999"
							stroke="#6A6C70" stroke-width="1.5" stroke-miterlimit="10"
							stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
				</button>
			</div>
			<div class="btn-width-wrap border rounded-pill">
				<button
					aria-label="End the interview and review a summary of your feedback"
					aria-haspopup="dialog"
					class="link-btn destructive-btn rounded-pill" disabled="">End
					&amp; Review</button>
			</div>
		</nav>
		<!-- end of the navbar -->
		<div class="accordion accordion-flush border rounded"
			id="accordionFlushExample">
			<div class="container-fluid mt-3 accordion-item"
				style="height: relative;">

				<h2 class="accordion-header">
					<form action="/submitAnswer" method="POST"
						class="flex-column full-width container-fluid">
						<div aria-live="polite"
							class="flex-column px-5 py-4 question-section"
							style="text-align: center;">
							<h3 class="question-subheader fw-bold" tabindex="0">
								<div id="question">
									<p><%=session.getAttribute("currentQuestion")%></p>
								</div>
							</h3>
						</div>
						<!-- <div class="type-answer-containe py-3 ">
							<div class="flex-column type-answer-inputs">
								<div class="type-answer pointer">
									<textarea class="text-input rounded p-2 container"
										placeholder="Type your answer" style="height: 336px;"
										maxlength="5000" aria-label="Type your answer"
										aria-describedby="char-count" required=""></textarea>
									<span class="char-count" id="char-count">5000 chars left</span>
								</div>
							</div>
						</div> -->
						<div class="job-description-container py-4">
							<div class="flex-column job-description-inputs">
								<div class="job-description">
									<textarea class="text-input rounded p-3 container fs-5"
										id="answer" name="answer" style="height: 336px;"
										placeholder="Type your answer" maxlength="5000"
										aria-label="Type your asnwer"></textarea>
									<span id="char-count-ans" class="fs-6">char left</span>
								</div>

							</div>
						</div>
						<div
							class="question-footer d-flex justify-content-sm-center thin-top-padding">
							<p class="sr-only" role="alert"></p>
							<div class="flex-column">
								<div class="submit-retry">
									<button
										class="footer-btn modern-btn link-btn button-weight rounded-pill gradient px-3 mb-5 py-2"
										type="submit">Submit for AI feedback</button>
								</div>
							</div>
						</div>
					</form>
					<!-- <div id="flush-collapseOne" class="accordion-collapse collapse"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">Placeholder content for this accordion, which is intended to
                            demonstrate
                            the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
                    </div> -->
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed " type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
						Feedback</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<%=session.getAttribute("feedback")%>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed " type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree" >
						Sample Response</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<%=session.getAttribute("sampleResponse")%>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!-- end of Questions List -->




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