# Dental Clinic Management System
The Dental Clinic Management System (SMILE APP) is a comprehensive application designed to streamline clinic operations and enhance user experience for patients, doctors, and administrators. By providing dedicated applications for each role, the system ensures personalized functionality and efficient interaction with the clinic's services.  
Patients can easily book appointments, view doctor profiles, explore clinic departments, and access informative medical articles. Doctors can manage their schedules, appointments, and patient interactions seamlessly. Administrators can oversee the clinic's operations, ensuring smooth coordination across all departments.  
With its user-friendly interface and role-specific features, this system simplifies clinic management, improves service delivery, and ensures a high level of satisfaction for all users.


### Functional Requirements :

The system includes three distinct roles: patient, doctor, and admin, with each role having its own dedicated application.
These features are shared among all three roles :

1- Login: Based on role, email, and password.
Provide a "Forgot Password" feature .

2- Account Creation: Includes role, name, email, password, confirm password, and gender.

3- Logout: Allows users to securely terminate their session.

4- Reset Password :
Users enter their registered email address to receive a verification code.

#### Admin Application Requirements :

1- Add Doctor:
Allows the admin to add a new doctor to the clinic by entering details such as name, photo, description, contact number, and working hours.

2- Delete Doctor:
Enables the admin to remove a doctor from the clinic.

3- View All Doctors:
Displays a list of all doctors in the clinic, including details such as the doctor's name, photo, and department.

4- View Doctor Profile Details:
Includes information such as the doctor's name, photo, phone number, working hours, and available appointments.

5- Add Department:
Allows the admin to add a new department by providing details such as the department name and working hours (start and end times).

6- Delete Department:
Enables the admin to remove a department from the clinic.

7- View All Departments:
Displays a list of all clinic departments, showing information like department names and working hours.

8- Add Medical Article:
Enables the admin to upload medical articles with details such as an image and text content.

9- Delete Medical Article:
Allows the admin to delete an existing medical article from the system.

10- View All Medical Articles:
Provides access to all medical articles related to the clinic.

11- View Medical Article Details:
Displays the full content of a selected medical article.

12- View All Patients:
Provides a list of all patients in the clinic.

13- View All Appointments:
Displays a comprehensive list of all appointments scheduled within the clinic, along with relevant details.

14- View All Medical Reports:
Allows the admin to access and review all medical reports associated with patients.

15- Dashboard with Statistics:
Provides an overview of clinic operations, including statistical data on patients, departments, and other key metrics.

16- Search for doctor by name

#### Patient Application Requirements:

1- View All Doctors:
Displays a list of all doctors in the clinic, including details such as the doctor's name, photo, and department.

2- View All Departments:
Displays a list of all clinic departments, showing information like department names and working hours.

3- View Medical Articles:
Provides access to all medical articles related to the clinic.

4- View Doctor Profile Details:
Includes information such as the doctor's name, photo, phone number, working hours, and available appointments.

5- View Medical Article Details:
Displays the full content of a selected medical article.

6- Book an Appointment:
Allows patients to book an appointment based on the doctor's available times.

7- View Patient's Appointments:
Shows details of the patient's bookings, such as the appointment time, date, doctor's name, and Department.

8- Cancel an Appointment:
Enables patients to delete a previously booked appointment.

9- Add Rating to Doctor:
Allows patients to rate doctors based on their experience.

10- Search for doctor by name


#### Doctor Application Requirements :

1- View All Patients:
Allows the doctor to see a list of all patients assigned to them.

2- View All Booked Appointments:
Displays all appointments scheduled with the doctor, along with details such as date and time.

3- Add Medical Report:
Enables the doctor to create and add a medical report for a patient, including necessary details about the patient's condition and recommendations.

4- View All Medical Reports:
Provides access to review all medical reports created for the doctor's patients.

5- Delete Medical Report:
Allows the doctor to delete a previously created medical report.

6- Doctor Dashboard:
Displays statistics specific to the doctor, such as the total number of patients under their care.

7- Search for patient by name



### Interface :

Splash screen , onboarding :


![Mobile App Screen Mockup, Floating (5)](https://github.com/user-attachments/assets/026cef19-6d9c-4e58-afa2-54cf98d42f2a)


Login , Create Account , reset password , email verification :


![Mobile App Screen Mockup, Floating (1)](https://github.com/user-attachments/assets/8efbd7a9-9dd0-4399-ac99-84b2a7c3eccd)


#### Admin Application :


Drawer , Home , Clinic doctors :

![Mobile App Screen Mockup, Floating (3)](https://github.com/user-attachments/assets/15c7f572-b9f4-4f4c-aba0-e6d7119b6ffd)

Clinic doctors , Add doctor , Doctor Profile :

![Mobile App Screen Mockup, Floating (6)](https://github.com/user-attachments/assets/5bb1a5d9-6aa8-4e7f-977e-77847e738c98)

Clinic Departments , Archive Department , Add Department , Choose Time :

![Mobile App Screen Mockup, Floating (4)](https://github.com/user-attachments/assets/3e2b5525-bb06-43ff-81a7-b93f405d888a)

Clinic Articles , Add Article , Delete Article :

![Mobile App Screen Mockup, Floating (7)](https://github.com/user-attachments/assets/81ca4f8f-98ff-43e0-896f-ca4eb1a797ab)

Archive doctor , search for doctor , Article Details :

![Mobile App Screen Mockup, Floating (10)](https://github.com/user-attachments/assets/03c9d5ec-61b4-484f-9180-303c2d7490ec)


#### Doctor Application :


Drawer , Home , Doctor's Appointments , Doctor's Patients :

![Mobile App Screen Mockup, Floating (8)](https://github.com/user-attachments/assets/8227b49a-edf9-43c4-9f2a-fa519d62283c)


diagnoses Details , all diagnoses , Add diagnoses  :

![Mobile App Screen Mockup, Floating (9)](https://github.com/user-attachments/assets/a88eab5d-44d9-4e61-8f6e-fcab816d3f4e)



#### Patient Application :


Drawer , Home , Article Details :

![Mobile App Screen Mockup, Floating](https://github.com/user-attachments/assets/607e0a68-01bf-48bc-85ed-1936b2c564f4)

Rating , Doctor Profile , Book an Appointment :

![Mobile App Screen Mockup, Floating (2)](https://github.com/user-attachments/assets/dbb812f2-195f-4380-aecb-f8fd55f299c7)

search for doctor , Department's Doctors , Patient's Appointments :

![Mobile App Screen Mockup, Floating (11)](https://github.com/user-attachments/assets/ede112a8-adc0-4912-a2eb-cb601c49826a)


### Technology Stack for the Clinic Management System :

Frontend: Built using Flutter with the following tools and libraries:

1- State Management:

GetX: Used for efficient and reactive state management, dependency injection, and navigation handling.

2- API Integration:
HTTP & Dio

3- Caching:

Shared Preferences: Utilized for local data storage, such as caching user credentials, settings, and other temporary data.

4- UI Enhancements:

Google Fonts: Provides customizable and elegant font styling.

Image Picker: Allows users to select images from the gallery or capture new ones using the camera.

Date Time Picker: Simplifies the selection of dates and times for scheduling appointments.

Pie Chart & FL Chart: Used to visualize data and statistics in dashboards with interactive charts.

Carousel Slider: For creating image or content sliders within the app.

Rating Dialog: Enables users to give ratings or feedback within the application.

Alert Dialog: Displays customizable alerts for various actions and confirmations.

Neumorphic UI: Implements modern, soft design elements for an aesthetically pleasing user interface.

 

