# login_app

## Overview
This Flutter application provides authentication functionalities for users to sign in or sign up. The app uses Firebase as its backend service for managing user authentication, supporting email/password authentication, Google Sign-In, and Apple Sign-In.

## Main Components
### main.dart

Initializes the Firebase instance and starts the app with MyApp, which directs to the AuthPage.

### AuthPage

A stateless widget that uses a StreamBuilder to listen for Firebase authentication state changes. It renders the HomePage if a user is logged in, otherwise it displays the LoginOrRegisterPage.

### HomePage

A stateless widget that displays a simple home screen with a welcome message and an option to sign out.

### LoginOrRegisterPage

A stateful widget that toggles between the LoginPage and RegisterPage based on user interaction.

### LoginPage

Allows existing users to log in using their email and password. It also supports logging in with Google and Apple. It includes input validation and error handling.

### RegisterPage

Enables new users to create an account using their email and password. Similar to LoginPage, it also supports Google and Apple as alternative authentication methods. It includes password confirmation and error handling for account creation.

## Services
### AuthService

Handles the authentication logic, including methods for signing in with Google and Apple. It also manages user sessions through Firebase authentication.

## Components
### MyTextField

A reusable text field widget customized for this application, used for user input on login and registration forms.

### MyButton

A reusable button widget used for submitting forms throughout the application.

### SquareTile

Used for displaying social login options (Google and Apple), it wraps an image in a stylized tile with interaction capabilities.

## Configuration
### firebase_options.dart

Defines platform-specific Firebase configuration options, ensuring the app can initialize Firebase appropriately across different platforms.

# Usage
The app provides a straightforward user interface for logging in and registering new accounts, including error feedback and seamless transitions between its various screens. Users can choose traditional email/password authentication or opt for quicker social sign-ins through Google or Apple. After logging in, the user is greeted on the HomePage with their email displayed and an option to log out.

## Signing Method
- Create user manual in Firebase and login with Email and password
- Register now , create Email, password and login
- Sign In with Google and login


### More informations links below

- https://firebase.google.com/docs/auth/flutter/password-auth
- https://pub.dev/packages/google_sign_in
- https://pub.dev/packages/sign_in_with_apple
- https://firebase.google.com/docs/auth/flutter/email-link-auth
- https://developers.google.com/android/guides/client-auth
- https://firebase.google.com/

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# login_sign_in_flutter_app

https://github.com/ChrisNgobeck/Login_SignIn_flutter_App/assets/150654899/34675b23-3d04-41fe-99cc-9f3e32b36a7b





