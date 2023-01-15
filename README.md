# sharek_application

This application will connect drivers with customer who needs to get a drive.

## Getting Started

This project currently  contains several files related to the main functionalities that the user will have like, registration 
and logging in and some other files that integrate those main functionalities with the program.

The proposal directory includes our progress report I submissions.

Before starting with the files, it should be mentioned that the files are kept inside the lib folder where we have :

1.main.dart -file

2.auth - folder

3.pages - folder

Explanation:

1. sharek_application/lib/main.dart:
 This file has only a stateless widget that only calls the main_page. dart file which will be explained down below.

2. sharek_application/lib/auth/main_page.dart:
This file opens a stream with frebase current instance and checks whether the user has successfully signed in / registered. If yes, it will direct the user to the homepage 
screen where it says "you signed in as {email}". If no, it will direct the user to the authentication page where either the Login or register page will be shown.


3. sharek_application/lib/auth/auth_page.dart:
This page will check if the user has clicked on "not remember! register now", then it will direct the user to the register page. If the user has been already on the registration page and clicked
on "have an account! sign in now" then it will direct him to the login page.	

4. sharek_application/lib/pages/home_page.dart:
On this page, the user will see a successful sign-in message, if he has managed to log in/register from the main page.dart file.

5.sharek_application/lib/pages/login_page.dart:
In this page, the user will see a greeting message, email text filed, and password text fields. These fields will be directly connected to email and          password controllers and these controllers will be used for the firebase authentication so that the user will be able to log in.
6.sharek_application/lib/pages/register_page.dart:
On this page, the user will almost see the same screen he has seen on the login page. However, the user will have to fill his password again in the confirm password field. An additional controller was added for
the confirm password field so that we can make sure that the two passwords are the same. Then, the information will be sent to the cloud and saved there, so that the user will be able to log in again later. After registration, the homepage will be shown as in the case of login.  

7. sharek_application/lib/pages/Admin_Modify_Client_page.dart: admin here can modify client phone number, a button will be available for confirmation.
8. sharek_application/lib/pages/Admin_Modify_Driver_page.dart: admin here can modify driver plate number, a button will be available for confirmation.
9. sharek_application/lib/pages/Admin_Modify_Trip_page.dart:  admin here can modify trip destination place, a button will be available for confirmation.
10. sharek_application/lib/pages/Admin_interface.dart: here admin can choose whether to initalize, reset, view, modify, or backup database.
11. sharek_application/lib/pages/Admin_view_Clients.dart: here admin can view all clients in db.
12. sharek_application/lib/pages/Admin_view_Drivers.dart: here admin can view all drivers in db.
13. sharek_application/lib/pages/Admin_view_Trips.dart: here admin can view all trips in db.
14. sharek_application/lib/pages/ClientClass.dart: here is the class for client where we define all attributes needed and constructors.
15. sharek_application/lib/pages/DriverClass.dart: here is the class for driver where we define all attributes needed and constructors.
16. sharek_application/lib/pages/TripClass.dart: here is the class for trip where we define all attributes needed and constructors.
17. sharek_application/lib/pages/Trips.dart: here we provide the option of adding a trip for the user.
18. sharek_application/lib/pages/ViewDatabase.dart: here we provide the admin the option to view clients, trips, or drivers tables records.
19. sharek_application/lib/pages/ViewModificationpage.dart: here we provide the admin the option to modify clients, trips, or drivers tables records.
20. sharek_application/lib/pages/choose_register_page.dart: here we provide users the option to register as clients or drivers to the app.
21. sharek_application/lib/pages/driver_register_page.dart: special driver registration page that includes, plate number, car type info.
22. sharek_application/lib/pages/list_drivers.dart: listing all drivers available for user to communicate with.
23. sharek_application/lib/pages/share_drive.dart: listing all trips available for user to share in and for driver to accept.
