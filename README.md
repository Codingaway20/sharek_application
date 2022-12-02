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

1. main.dart:
 This file has only a stateless widget that only calls the main_page. dart file which will be explained down below.

2. auth/main_page.dart:
This file opens a stream with frebase current instance and checks whether the user has successfully signed in / registered. If yes, it will direct the user to the homepage 
screen where it says "you signed in as {email}". If no, it will direct the user to the authentication page where either the Login or register page will be shown.


3. auth/auth_page.dart:
This page will check if the user has clicked on "not remember! register now", then it will direct the user to the register page. If the user has been already on the registration page and clicked
on "have an account! sign in now" then it will direct him to the login page.	

4. pages/home_page.dart:
On this page, the user will see a successful sign-in message, if he has managed to log in/register from the main page.dart file.


 5.pages/login_page.dart:
 In this page, the user will see a greeting message, email text filed, and password text fields. These fields will be directly connected to email and           password controllers and these controllers will be used for the firebase authentication so that the user will be able to log in.



6. pages/register_page.dart:
On this page, the user will almost see the same screen he has seen on the login page. However, the user will have to fill his password again in the confirm password field. An additional controller was added for
the confirm password field so that we can make sure that the two passwords are the same. Then, the information will be sent to the cloud and saved there, so that the user will be able to log in again later.
After registration, the homepage will be shown as in the case of login.  

