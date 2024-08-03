document.addEventListener('DOMContentLoaded', function() {
	const businessAnalystDescription = "Job Title: Business Analyst\n\nRole Summary: We are looking for a Business Analyst to join our team. This role is perfect for those who are early in their careers and are eager to dive into analyzing business needs and delivering data-driven solutions.\n\nResponsibilities:\n- Work closely with business units and stakeholders to understand and analyze business requirements.\n- Translate business needs into functional specifications and system design plans.\n- Conduct thorough data analysis using a variety of techniques, ranging from simple data aggregation via statistical analysis to complex data mining.\n- Monitor project progress by tracking activity, resolving problems, publishing progress reports, and recommending actions.\n- Ensure solutions meet business needs and requirements.\n- Conduct meetings and presentations to share ideas and findings.\n\nRequirements:\n- Bachelor’s degree in Business, Information Systems, or a related field.\n- 0-3 years of experience in a business analysis or a related field.\n- Strong analytical skills with the ability to collect, organize, analyze, and disseminate significant amounts of information with attention to detail and accuracy.\n- Proficiency in data visualization and business intelligence tools like Tableau or PowerBI.\n- Excellent verbal and written communication skills.\n- Experience working with cross-functional teams.";

	const productManagerDescription = "Job Title: Product Manager\n\nRole Summary: We are seeking an enthusiastic Product Manager to join our team. This is an excellent opportunity for individuals at the early stage of their career to contribute to the full product life cycle and work on products that reach users worldwide.\n\nResponsibilities:\n- Manage the entire product line life cycle from strategic planning to tactical activities.\n- Work closely with multiple teams to define product requirements.\n- Develop product roadmaps to meet business targets.\n- Analyze market trends and competition.\n- Conduct usability studies and perform user research to understand user needs.\n- Prioritize features and tasks for product development based on business and customer impact.\n- Work with the sales and marketing teams to define the go-to-market strategy.\n\nRequirements:\n- Bachelor's degree in Business, Engineering, Computer Science, or related field.\n- 0-3 years of experience in product management or a related field.\n- Strong problem-solving skills and willingness to roll up one's sleeves to get the job.\n- Excellent written and verbal communication skills.\n- Skilled at working effectively with cross-functional teams in a matrix organization.\n- Proficiency in web analytics tools and experience in data-driven decision making.";

	const softwareEngineerDescription = "Job Title: Software Engineer\n\nRole Summary: We are looking for a Software Engineer to join our diverse and dedicated team. This position is an excellent opportunity for those seeking to grow their skills and experience in software development while working on projects with significant impact.\n\nResponsibilities:\n- Develop and implement new software solutions.\n- Collaborate with teams to understand objectives, design features, and meet specific requirements.\n- Improve and maintain existing software to ensure strong functionality and optimization.\n- Recommend changes to existing software applications, as necessary, to ensure excellent functionality.\n- Write efficient, secure, well-documented, and clean JavaScript code.\n- Participate in all phases of the development life cycle.\n\nRequirements:\n- Degree in Computer Science or related field.\n- 0-3 years of experience in software development.\n- Demonstrated problem-solving abilities and attention to detail.\n- Proficiency with at least one programming language.\n- Familiarity with various operating systems and platforms.\n- Good understanding of software development principles.\n- Excellent communication and teamwork skills.\n- Demonstrated ability to manage and prioritize tasks independently.";

	const marketingSpecialistDescription = "Job Title: Marketing Specialist\n\nRole Summary: We are seeking a Marketing Specialist to join our team. This role is ideal for individuals who are early in their marketing career and looking to enhance their skills in various marketing strategies and campaigns.\n\nResponsibilities:\n- Plan, execute, and optimize marketing strategies across various channels.\n- Collaborate with the team to develop content for advertising and promotional materials.\n- Conduct market research to identify marketing opportunities and negotiate media coverage.\n- Track, report, and analyze campaign performance and results.\n- Participate in the development and execution of social media campaigns.\n- Organize and attend marketing activities or events to raise brand awareness.\n\nRequirements:\n- Bachelor's degree in Marketing, Business, or a related field.\n- 0-3 years of experience in marketing or a related field.\n- Strong understanding of marketing strategies and how to use different marketing tools and platforms.\n- Excellent verbal and written communication skills.\n- Strong analytical skills with a goal-oriented attitude.\n- Proficiency with Google Analytics, content management systems, and social media platforms.\n- Creative mindset with strong decision-making skills.";

	const customerServiceRepresentativeDescription = "Job Title: Customer Service Representative\n\nRole Summary: We are seeking a dedicated and enthusiastic Customer Service Representative to join our team. This role offers the opportunity to interact directly with our customers and ensure their experience with our company is positive and memorable.\n\nResponsibilities:\n- Respond to customer inquiries via phone, email, and live chat.\n- Resolve product or service problems by clarifying the customer's complaint, determining the cause of the problem, selecting and explaining the best solution to solve the problem, and following up to ensure resolution.\n- Maintain a high level of professionalism with customers and work to establish a positive rapport with every caller.\n- Work with the customer service team to ensure excellent service standards and maintain high customer satisfaction.\n- Keep records of customer interactions and transactions, recording details of inquiries, complaints, and comments, as well as actions taken.\n\nRequirements:\n- High school diploma or equivalent. More education or experience may be preferred.\n- 0-3 years of experience in customer service or a related field.\n- Excellent communication and presentation skills.\n- Ability to multi-task, prioritize, and manage time effectively.\n- Patience in dealing with confused or irate customers.\n- Experience with customer service software, databases, and CRM tools.";

	const salesRepresentativeDescription = "Job Title: Sales Representative\n\nRole Summary: We are seeking a motivated Sales Representative to join our team. This position offers the opportunity to develop valuable sales skills and contribute to the growth of our company.\n\nResponsibilities:\n- Generate new leads and build relationships with potential customers.\n- Actively seek out new sales opportunities through cold calling, networking, and social media.\n- Present, promote, and sell products/services to prospective customers.\n- Achieve agreed-upon sales targets and outcomes within the designated timeline.\n- Conduct product demonstrations and provide accurate information to customers.\n- Coordinate sales efforts with team members and other departments.\n- Keep abreast of industry trends, best practices, and competitor activities.\n\nRequirements:\n- Bachelor's degree in Business, Marketing, or a related field (preferred).\n- 0-3 years of experience in sales or a related field.\n- Excellent communication and negotiation skills.\n- Self-motivated with a strong desire to succeed.\n- Ability to work independently as well as collaboratively in a team environment.\n- Familiarity with CRM software and sales tools.\n- Positive attitude and strong customer focus.\n- Willingness to travel as required.";

	const humanResourcesSpecialistDescription = "Job Title: Human Resources Specialist\n\nRole Summary: We are seeking a detail-oriented Human Resources Specialist to join our team. This position offers the opportunity to be involved in a broad range of HR functions, providing excellent experience in the field.\n\nResponsibilities:\n- Assist with all internal and external HR-related matters.\n- Participate in developing organizational guidelines and procedures.\n- Recommend strategies to motivate employees.\n- Assist with the recruitment process by identifying candidates, conducting reference checks, and issuing employment contracts.\n- Investigate complaints brought forward by employees.\n- Coordinate employee development plans and performance management.\n- Perform orientations and update records of new staff.\n\nRequirements:\n- Bachelor's degree in Human Resources or related field.\n- 0-3 years of experience in a Human Resources position or related field.\n- Strong interpersonal and communication skills.\n- Ability to manage a wide range of relationships with a variety of stakeholders.\n- Proficient in Microsoft Office applications, especially Excel, or similar software.\n- Working knowledge of employment laws and regulations.\n- Excellent administrative and organizational skills.";

	const dataAnalystDescription = "Job Title: Data Analyst\n\nRole Summary: We are seeking a Data Analyst to join our team. This entry-to-mid-level position is a wonderful opportunity for those who are passionate about data-driven insights and are looking to broaden their experience in data analysis.\n\nResponsibilities:\n- Interpret data and analyze results using statistical techniques.\n- Identify, analyze, and interpret trends or patterns in complex data sets.\n- Develop and implement data collection systems and other strategies that optimize statistical efficiency and data quality.\n- Work with management to prioritize business and information needs.\n- Transform raw data into useful information using data-driven techniques.\n- Collaborate with teams to implement strategies based on data analysis.\n\nRequirements:\n- Degree in Statistics, Mathematics, Computer Science, Information Systems, Economics, or a related field.\n- 0-3 years of experience in data analysis or a related field.\n- Strong analytical skills with the ability to collect, organize, analyze, and disseminate significant amounts of information with attention to detail and accuracy.\n- Familiarity with data visualization tools and techniques.\n- Proficient in SQL and understanding of relational databases.\n- Excellent written and verbal communication skills.\n- Ability to work independently and with team members from different backgrounds.\n- Highly organized, detail-oriented, and proactive.";

	const uxUiDesignerDescription = "Job Title: UX/UI Designer\n\nRole Summary: We are in search of a UX/UI Designer who is passionate about improving user experience by creating intuitive, user-friendly design solutions. This position is suitable for those who are at the early stage of their career and have a deep interest in interactive design.\n\nResponsibilities:\n- Design and implement user interfaces for different digital platforms.\n- Collaborate with the product and engineering team to define and implement innovative solutions for the product direction, visuals, and experience.\n- Develop wireframes, user flows, and prototypes to effectively communicate interaction and design ideas.\n- Conduct user research and evaluate user feedback to optimize the design.\n- Establish and promote design guidelines, best practices, and standards.\n\nRequirements:\n- Degree in Design, Computer Science or a related field.\n- 0-3 years of experience in UX/UI design.\n- Proficiency in graphic design software including Adobe Photoshop, Adobe Illustrator, and other visual design tools.\n- Familiarity with HTML, CSS, and JavaScript for rapid prototyping.\n- Strong visual design skills with a good understanding of user-system interaction.\n- Ability to solve problems creatively and effectively.\n- Excellent verbal and written communication skills.\n- Up-to-date with the latest UI trends, techniques, and technologies.";

	const qaEngineerDescription = "Job Title: QA Engineer\n\nRole Summary: We are seeking a detail-oriented and meticulous QA Engineer to join our team. This position offers the opportunity to contribute to the quality assurance process and ensure the delivery of high-quality software products.\n\nResponsibilities:\n- Develop and execute test plans, test cases, and test scripts to ensure quality software delivery.\n- Identify, document, and track software defects and issues.\n- Collaborate with cross-functional teams to ensure effective communication and resolution of issues.\n- Perform thorough regression testing to verify software functionality after bug fixes or enhancements.\n- Participate in the design and review of software requirements and specifications.\n- Contribute to continuous improvement initiatives to enhance the overall quality and efficiency of testing processes.\n\nRequirements:\n- Bachelor's degree in Computer Science, Engineering, or a related field.\n- 0-3 years of experience in software quality assurance or a related field.\n- Strong knowledge of software QA methodologies, tools, and processes.\n- Familiarity with software testing techniques and test case development.\n- Experience with test automation frameworks and tools.\n- Excellent analytical and problem-solving skills.\n- Strong attention to detail and ability to work in a fast-paced environment.\n- Good communication and collaboration skills.";

	const descriptions = {
		'Business Analyst': businessAnalystDescription,
		'Product Manager': productManagerDescription,
		'Software Engineer': softwareEngineerDescription,
		'Marketing Specialist': marketingSpecialistDescription,
		'Customer Service Representative': customerServiceRepresentativeDescription,
		'Sales Representative': salesRepresentativeDescription,
		'Human Resources Specialist': humanResourcesSpecialistDescription,
		'Data Analyst': dataAnalystDescription,
		'UX/UI Designer': uxUiDesignerDescription,
		'QA Engineer': qaEngineerDescription

	};

	const roleChips = document.querySelectorAll('.roles-chips input');
	const textarea = document.getElementById('job-description');
	let previousSelectedChip = null;

	function updateTextArea(description) {
		textarea.value = description ? description : '';
	}

	function updateURL(role) {
		const newURL = `${window.location.pathname}?role=${encodeURIComponent(role)}`;
		history.pushState(null, '', newURL);
	}


	roleChips.forEach(chip => {
		chip.addEventListener('change', function() {

			const selectedRole = this.value;
			const description = descriptions[selectedRole];
			updateTextArea(description);
			updateURL(selectedRole);

			if (previousSelectedChip) {
				previousSelectedChip.parentElement.classList.remove('active');
			}
			this.parentElement.classList.add('active');
			previousSelectedChip = this;

		});
	});



	// Handle initial load if URL contains a role
	const urlParams = new URLSearchParams(window.location.search);
	const role = urlParams.get('role');
	if (role && descriptions[role]) {
		const matchingChip = Array.from(roleChips).find(chip => chip.value === role);
		if (matchingChip) {
			matchingChip.checked = true;
			updateTextArea(descriptions[role]);
		}
	}




	document.getElementById('editButton').addEventListener('click', function() {
		document.getElementById('username').disabled = false;
		document.getElementById('email').disabled = false;
		document.getElementById('password').disabled = false;

		// Enable the Update User button
		document.getElementById('updateAccount').disabled = false;

		// Disable the Edit and Delete User buttons
		document.getElementById('editButton').disabled = true;
		document.getElementById('deleteAccount').disabled = true;
	});


	/*document.getElementById('editButton').addEventListener('click', function() {
		document.getElementById('username').disabled = false;
		document.getElementById('email').disabled = false;
		document.getElementById('password').disabled = false;
	
		// Enable the Update User button
		document.getElementById('updateAccount').disabled = false;
	
		// Disable the Edit and Delete User buttons
		document.getElementById('editButton').disabled = true;
		document.getElementById('deleteAccount').disabled = true;
	});*/

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



	document.addEventListener('DOMContentLoaded', () => {
		const labels = document.querySelectorAll('.roles-chips label');

		labels.forEach(label => {
			label.addEventListener('click', () => {
				// Remove active class from all labels
				labels.forEach(lbl => lbl.classList.remove('active'));

				// Add active class to the clicked label
				label.classList.add('active');
			});
		});
	});

	document.addEventListener('DOMContentLoaded', function() {
		const textarea = document.getElementById('job-description');
		const charCountSpan = document.getElementById('char-count');
		const maxChars = 5000;

		function updateCharCount() {
			const currentLength = textarea.value.length;
			if (currentLength > maxChars) {
				textarea.value = textarea.value.substring(0, maxChars); // Trim excess characters
			}
			charCountSpan.textContent = `${maxChars - textarea.value.length} characters remaining`;
		}

		textarea.addEventListener('input', updateCharCount);

		// Initialize char count on page load
		updateCharCount();
	});
});
