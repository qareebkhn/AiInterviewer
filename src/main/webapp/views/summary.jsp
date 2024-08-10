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
<link rel="stylesheet" href="/CSS/style_for_summary.css">
<script src="/scripts/script_for_jobDescription.js"></script>
</head>

<body>

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
							class="rounded-circle me-2"><strong> </strong>
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
	<main>
		<div class="flex-column main-container max-width">
			<nav class="flex-space-between nav-container"
				aria-label="Current interview">
				<div class="flex-space-between question-picker">Summary</div>
			</nav>

			<div class="flex-column question-box">
				<textarea disabled class="full p-3"><%=session.getAttribute("responseResult")%></textarea>

				<div class="d-grid gap-2 col-6 mx-auto">
					<button class="btn btn-primary my-2" type="button">Button</button>
					<button class="btn btn-primary" type="button">Button</button>
				</div>
			</div>
		</div>

	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>
