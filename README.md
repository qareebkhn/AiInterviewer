# AI Interviewer Application

## Overview

The AI Interviewer application is designed to simulate interview scenarios tailored to the user's CV and job description. It leverages OpenAI's GPT model to generate interview questions and provide real-time feedback. Users can manage their profiles, conduct interviews of varying difficulties, and review their results, all within an intuitive interface.

## Features

- **User Management:**
  - **Sign-Up & Sign-In:** User registration and authentication.
  - **Profile Management:** Users can view, edit, and delete their profiles.

- **Interview Simulation:**
  - **Custom Interview Setup:** Users upload their CV, provide a job description, and select an interview difficulty level (Easy, Moderate, Difficult).
  - **Interactive Interview:** Questions are generated based on the user's input, and feedback is provided for each answer.
  - **Results Summary:** At the end of the interview, users can view a summary of their performance. Results are automatically saved to the database.

- **UI Development:**
  - **Thymeleaf Templates:** The application uses Thymeleaf for rendering the UI, ensuring compatibility and maintainability.
  - **Profile Modal:** Allows users to manage their profile information directly from the UI.
  - **Contact Us Form:** Integrated email functionality for user inquiries.

- **OpenAI Integration:**
  - **API Interaction:** The application communicates with OpenAI's API to generate questions and analyze responses using the `gpt-3.5-turbo` model.
  - **RestTemplate Configuration:** Ensures secure API requests with proper authorization headers.

- **Email Notifications:**
  - Configured SMTP settings to allow email communications via Gmail, enabling users to send messages through the "Contact Us" form.

- **Error Handling & Improvements:**
  - Robust error handling and logging mechanisms are implemented throughout the application.

## Tech Stack

- **Backend:** Java Spring Boot
- **Frontend:** Thymeleaf
- **Database:** MySQL
- **API Integration:** OpenAI API
- **Email:** Gmail SMTP for email notifications

## Installation

### Prerequisites

- Java 11 or later
- MySQL
- Maven

### Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/qareebkhn/AiInterviewer.git
   cd ai-interviewer
   ```

2. **Configure the database:**

   - Ensure your MySQL server is running.
   - Create a new database named `AiInterviewer`.
   - Update the MySQL connection details in `src/main/resources/application.properties` if needed:

     ```properties
     spring.datasource.url=jdbc:mysql://localhost:3306/AiInterviewer
     spring.datasource.username=root
     spring.datasource.password=your_password
     ```

3. **Set up OpenAI API:**

   - Replace the placeholder API key in `application.properties` with your actual OpenAI API key:

     ```properties
     openai.api.key=your-openai-api-key
     ```

4. **Configure email settings:**

   - If you plan to use the "Contact Us" form, ensure the Gmail SMTP settings are correctly configured in `application.properties`:

     ```properties
     spring.mail.username=your-email@gmail.com
     spring.mail.password=your-email-password
     ```

5. **Build and run the application:**

   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

6. **Access the application:**
   - Open a web browser and navigate to `http://localhost:8080`.

## Usage

1. **Sign up** to create a new account.
2. **Sign in** to access your profile and start an interview.
3. **Upload your CV** and provide a job description.
4. **Select interview difficulty** (Easy, Moderate, Difficult) and begin the interview.
5. **Answer questions** as they appear. Receive real-time feedback and sample responses.
6. **View your results** after completing the interview. The results are automatically saved for future reference.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.
