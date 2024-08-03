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
<link rel="stylesheet" href="/views/styles_for _main.css">
<link rel="script" href="/views/script_for_main.js">
</head>


<body>
	<%
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
					<form action="/logout" method="POST">
						<button id="logout" class="btn btn-outline-warning me-4"
							style="color: #000000; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
							type="submit">
							<!-- <i class="far fa-sign-in-alt"></i> -->
							Logout
							<%-- <%
							session.removeAttribute("username");
							session.invalidate();
							response.sendRedirect("/");
						%> --%>
						</button>
					</form>
					<form action="/uploadYourCV" method="POST">
						<button id="lunch_new_interview_btn"
							class="btn btn-outline-warning me-4"
							style="color: #000000; border: none; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"
							type="submit">
							<!-- <i class="far fa-sign-in-alt"></i> -->
							Lunch a new Interview
						</button>
					</form>
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

	<!-- List of Interview -->
	<div id="list_of_interviews" class="container-fluid p-5 ">

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
	</div>


	<!-- Upload Your CV -->
	<div id="upload_your_cv_cont" class="container-fluid hidden">
		<div
			class="px-4 pt-5 my-8 md-5 text-center border-bottom border-top mb-5">
			<h1
				class="display-4 fw-meduim text-body-emphasis fs-sm-1 fs-md-1 mt-5"
				style="font-family: 'Trebuchet MS'">Upload Your Resume</h1>
			<br>
			<div class="col-lg-6 mx-auto">
				<p class="lead mb-4 ">Elevate your interviews with AI
					Interviewer: Generate tailored questions, analyze performance, and
					gain insights effortlessly. Streamline your interview process and
					ace your next opportunity with ease.</p>
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
					<div class="d-grid gap-2 col-6 mx-auto mb-5">
						<!-- File input element -->
						<input type="file" id="fileInput" accept=".pdf,.docx">

						<!-- Custom button that triggers the file input -->
						<!-- An icon of upload should be add at the left of the button. -->
						<label for="fileInput"
							class="file-chooser-btn btn-warning fs-5 px-5 rounded-pill">Upload
							Your CV</label>
						<!-- for now we are using this paragraph to go to next section after uploading CV -->
						<p id="nextSection" class=""
							style="color: green; font-size: 15px; cursor: pointer;">CV
							has been successfully uploaded</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Job Descripttion -->
	<div id="job_description_cont" class="container-fluid hidden">

		<div class="px-4 pt-2 my-8 md-5 mb-4 text-center ">
			<header class="flex-column heading-combo mb-5">
				<h1 style="font-family: 'Trebuchet MS'; font-weight: 700;">Select
					a Job description</h1>
			</header>
			<div class="flex-column launch-wrap">
				<div class="flex column chips-container">
					<div class="roles-chips" role="radiogroup"
						aria-label="Select a job description from the following options">
						<label
							class="chip border m-1 px-3 py-1 rounded-pill pointer active"><input
							type="radio" aria-checked="true"
							aria-labelledby="chip-label-Custom-Job-Description"
							name="role-chip-group"> <span
							id="chip-label-Custom-Job-Description">Custom Job
								Description</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="false"
							aria-labelledby="chip-label-Business-Analyst"
							name="role-chip-group"> <span
							id="chip-label-Business-Analyst">Business Analyst</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="false"
							aria-labelledby="chip-label-Product-Manager"
							name="role-chip-group"> <span
							id="chip-label-Product-Manager">Product Manager</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="false"
							aria-labelledby="chip-label-Software-Engineer"
							name="role-chip-group"> <span
							id="chip-label-Software-Engineer">Software Engineer</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							type="radio" aria-checked="false"
							aria-labelledby="chip-label-Marketing-Specialist"
							name="role-chip-group"> <span
							id="chip-label-Marketing-Specialist">Marketing Specialist</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"> <input
							aria-checked="false"
							aria-labelledby="chip-label-Customer-Service-Representative"
							type="radio" name="role-chip-group"><span
							id="chip-label-Customer-Service-Representative"> Customer
								Service Representative</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							aria-checked="false"
							aria-labelledby="chip-label-Sales-Representative" type="radio"
							name="role-chip-group"> <span
							id="chip-label-Sales-Representative">Sales Representative</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							aria-checked="false"
							aria-labelledby="chip-label-Human-Resources-Specialist"
							type="radio" name="role-chip-group"> <span
							id="chip-label-Human-Resources-Specialist">Human Resources
								Specialist</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill rounded-pill pointer"><input
							aria-checked="false" aria-labelledby="chip-label-Data-Analyst"
							type="radio" name="role-chip-group"> <span
							id="chip-label-Data-Analyst">Data Analyst</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							aria-checked="false" aria-labelledby="chip-label-UX/UI-Designer"
							type="radio" name="role-chip-group"> <span
							id="chip-label-UX/UI-Designer">UX/UI Designer</span></label><label
							class="chip border m-1 px-3 py-1 rounded-pill pointer"><input
							aria-checked="false" aria-labelledby="chip-label-QA-Engineer"
							type="radio" name="role-chip-group"> <span
							id="chip-label-QA-Engineer">QA Engineer</span></label>
					</div>
					<!-- <div id="show-more-less"><button class="review-btn extra-margin-top"
                                aria-label="Show less sample job description options" aria-expanded="true">Show
                                less</button></div> -->
				</div>
				<!-- 720 x 336 -->
				<div class="job-description-container py-4">
					<div class="flex-column job-description-inputs">
						<div class="job-description">
							<textarea class="text-input rounded p-2 container"
								style="height: 336px;"
								placeholder="Select a job role above or paste your own description here"
								maxlength="5000"
								aria-label="Select a job role above or paste your own description here"
								aria-describedby="char-count" required=""></textarea>
							<span id="char-count">5000<!-- --> chars left
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="question-footer">
				<p class="sr-only" role="alert"></p>
				<div class="flex-column">
					<button id="generate_questions_btn"
						class="footer-btn modern-btn button-weight rounded-pill gradient px-3 mb-5 py-2">
						Generate Questions
						<!-- <svg width="17" height="25" viewBox="0 0 17 25" fill="none"
                            xmlns="http://www.w3.org/2000/svg" style="z-index:1000">
                            <path d="M10.1203 16.5467L14.167 12.5L10.1203 8.45333M2.83366 12.5L14.0537 12.5"
                                stroke="white" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round"
                                stroke-linejoin="round"></path>
                        </svg> -->
					</button>
				</div>
			</div>
		</div>

	</div>


	<!-- Questions List -->
	<div class="container mb-5 py-5 border-bottom hidden"
		id="question_list">
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
				<span>Question 1 </span>
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
					<form class="flex-column full-width container-fluid">
						<div aria-live="polite"
							class="flex-column px-5 py-4 question-section"
							style="text-align: center;">
							<h3 class="question-subheader fw-bold" tabindex="0">Can you
								provide an example of a challenging software development project
								you worked on and how you approached and overcame the
								difficulties faced?</h3>
						</div>
						<div class="type-answer-containe py-3 ">
							<div class="flex-column type-answer-inputs">
								<div class="type-answer pointer">
									<textarea class="text-input rounded p-2 container"
										placeholder="Type your answer" style="height: 336px;"
										maxlength="5000" aria-label="Type your answer"
										aria-describedby="char-count" required=""></textarea>
									<span class="char-count" id="char-count">5000 chars left</span>
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
										type="submit" value="submit">Submit for AI feedback</button>
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
					<button class="accordion-button collapsed disabled" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo" disabled>
						Feedback</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						Placeholder content for this accordion, which is intended to
						demonstrate the
						<code>.accordion-flush</code>
						class. This is the second item's accordion body. Let's imagine
						this being filled with some actual content.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed disabled" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree" disabled>
						Sample Response</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						Placeholder content for this accordion, which is intended to
						demonstrate the
						<code>.accordion-flush</code>
						class. This is the third item's accordion body. Nothing more
						exciting happening here in terms of content, but just filling up
						the space to make it look, at least at first glance, a bit more
						representative of how this would look in a real-world application.
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


</body>
</html>