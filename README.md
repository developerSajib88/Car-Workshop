
### Project Summary

**Objective**: Develop a cross-platform mobile application for a car workshop that allows users to create and manage bookings for car servicing while ensuring a focus on UI/UX design and clean, modular, well-documented code.

### Key Features

1. **User Authentication**
   - Implement registration and login functionalities using email/password.
   - Utilize Firebase or an alternative backend for authentication.
   - Differentiate user roles, providing specific access for mechanics and admins.

2. **Car Servicing Booking System**
   - Enable admins to create and manage car service bookings.
   - Design a form to collect necessary booking details, including:
     - **Car Details**: Make, Model, Year, and Registration Plate.
     - **Customer Details**: Name, Phone Number, and Email.
     - **Booking Information**: Title, start and end datetimes, and mechanic assignment.
   - Store bookings in a database (Firebase or other backend solutions).

3. **Calendar View of Bookings**
   - Integrate a calendar UI to visualize service bookings.
   - Display bookings for a selected day, week, or month.
   - Allow users to select a booking to view detailed information.
   - Provide a dedicated view for mechanics to see jobs assigned to them.

---

## App Screenshot's

![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_1.png) | ![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_2.png) | ![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_3.png)
--- | --- | ---
*Welcome* | *SignIn* | *Registration*

![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_4.png) | ![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_5.png) | ![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_6.png)
--- | --- | ---
*Admin Dashboard* | *Booking Details* | *Create Bookings*

![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_7.png) | ![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_8.png) | ![App Screenshot](https://github.com/developerSajib88/Project-Screenshots/blob/main/Car%20Workshop/screen_9.png)
--- | --- | ---
*Booking Dates* | *Mechanic Jobs* | *User Profile*


Here’s a more detailed, step-by-step instruction set to help you thoroughly set up and run the Car Workshop Flutter project:

---

### Step 1: Install Flutter SDK
If you haven’t installed Flutter on your machine, follow these steps:

1. **Download Flutter**: 
   - Go to the [Flutter installation guide](https://docs.flutter.dev/get-started/install).
   - Choose the version appropriate for your operating system (Windows, macOS, or Linux) and follow the download instructions.
   
2. **Extract and Install Flutter**:
   - After downloading, unzip the Flutter SDK file. 
   - Move the extracted `flutter` folder to a preferred location on your system (like `C:\src\flutter` on Windows or `~/flutter` on macOS/Linux).

3. **Add Flutter to PATH**:
   - This step makes the `flutter` command accessible from any terminal window.
   - Follow the guide to add the Flutter directory to your system’s PATH variable:
      - On **Windows**: 
        - Open **System Properties > Environment Variables**.
        - Edit the `Path` variable to include the path to the Flutter `bin` folder (e.g., `C:\src\flutter\bin`).
      - On **macOS/Linux**:
        - Add `export PATH="$PATH:/path-to-flutter/bin"` to your shell configuration file (like `~/.bashrc` or `~/.zshrc`).

4. **Verify Installation**:
   - Open a terminal and run:
     ```bash
     flutter doctor
     ```
   - `flutter doctor` checks your setup and lists any additional steps to complete the installation, like setting up Android Studio or any missing dependencies.

---

### Step 2: Clone the Project from GitHub
Now, you’ll download the Car Workshop project files.

1. **Open a Terminal or Command Prompt**:
   - You can use Git Bash, PowerShell, or any terminal on Windows, or Terminal on macOS/Linux.

2. **Clone the Repository**:
   - Run this command to download the project files:
     ```bash
     git clone git@github.com:developerSajib88/Car-Workshop.git
     ```
   - This command creates a `Car-Workshop` folder with all project files.

3. **Navigate into the Project Directory**:
   - Change into the project’s directory using:
     ```bash
     cd Car-Workshop
     ```
   - This is where you’ll run all remaining setup commands.

---

### Step 3: Open the Project in Android Studio or VS Code

#### Option A: Using Android Studio
1. **Launch Android Studio**.
2. **Open the Project**:
   - Go to **File > Open**, then navigate to and select the `Car-Workshop` folder.
3. **Set Flutter SDK Path**:
   - If Android Studio prompts you to configure the Flutter SDK path, select the location where you installed Flutter.
4. **Install Dependencies**:
   - Android Studio may automatically run `flutter pub get`, which installs all project dependencies. If it doesn’t, open the Terminal tab in Android Studio and run:
     ```bash
     flutter pub get
     ```

#### Option B: Using Visual Studio Code (VS Code)
1. **Launch VS Code**.
2. **Open the Project Folder**:
   - Go to **File > Open Folder**, and select the `Car-Workshop` folder.
3. **Install Flutter and Dart Extensions**:
   - Go to the Extensions view (usually the square icon in the left sidebar).
   - Search for **Flutter** and **Dart** extensions and install them; they provide better support and tooling for Flutter projects.
4. **Install Dependencies**:
   - Open the terminal in VS Code by going to **View > Terminal** and run:
     ```bash
     flutter pub get
     ```
   - This command installs all necessary libraries and dependencies listed in the `pubspec.yaml` file.

---

### Step 4: Run the Project
You can now run the app on an emulator or a connected physical device.

1. **Start an Emulator or Connect a Physical Device**:
   - **In Android Studio**: Go to **Device Manager** to start an Android emulator or connect an Android device via USB.
   - **In VS Code**: Select an emulator or connected device from the **Device Selector** at the bottom of the screen.

2. **Run the App**:
   - **In Android Studio**: Click the **Run** button (green play icon) or go to **Run > Run ‘main.dart’**.
   - **In VS Code**: Open `main.dart`, then press **F5** or go to **Run > Start Debugging**.

   Alternatively, from the terminal in either IDE, you can start the app with:
   ```bash
   flutter run
   ```
   - This command compiles and runs the app on the selected device. You should see the Car Workshop app open on the emulator or device screen.

---

### Additional Useful Commands
- **Check for Code Issues**: Run `flutter analyze` to check for any linting issues or potential bugs in the code.
- **Format Code**: Use `flutter format .` to format all Dart files according to standard Dart formatting rules.

---

### Troubleshooting
If you encounter any problems, try these troubleshooting steps:

1. **Update Flutter**:
   - Make sure your Flutter SDK is the latest version by running:
     ```bash
     flutter upgrade
     ```
   - This command updates Flutter and all installed components.

2. **Reinstall Dependencies**:
   - If dependencies seem to be missing, re-run:
     ```bash
     flutter pub get
     ```

3. **Verify Setup**:
   - Run `flutter doctor` to see if any required components are missing or incorrectly set up. Follow the suggested actions until everything shows as correctly configured.

---

Following these steps should get you fully set up and running with the Car Workshop project.



Here’s a markdown section describing each package and its purpose within your project:

---

## Project Dependencies

This project uses a variety of packages to enhance functionality, manage state, provide animations, and integrate with Firebase. Below is an overview of each package and why it’s used.

### Core Packages

- **Responsive Design**
  - `flutter_screenutil` (v5.9.0): Enables responsive design by adapting the UI based on screen size, allowing a consistent look across different devices.

- **State Management**
  - `hooks_riverpod` (v2.5.1): A state management solution for Flutter that is type-safe and helps manage complex application state across widgets.

- **Object Comparison**
  - `equatable` (v2.0.5): Simplifies the comparison of objects, making it easier to work with data classes and avoid repetitive boilerplate code.

- **Routing Management**
  - `go_router` (v14.2.0): Provides a declarative, robust solution for managing routing and navigation within the app.

- **Dependency Injection**
  - `get_it` (v7.7.0): Used for dependency injection, making it easy to manage and inject dependencies like services throughout the app.

- **API Client**
  - `http` (v1.2.0): Facilitates making HTTP requests to interact with APIs, enabling data fetching and network communication.

### Data Storage

- **Local Database**
  - `hive` (v2.2.3) & `hive_flutter` (v1.1.0): A lightweight, NoSQL database for Flutter. It’s used for storing local data offline, such as user preferences or session data.

- **Firebase Integration**
  - `firebase_core` (v3.1.1): Essential for initializing Firebase services within the app.
  - `firebase_messaging` (v15.0.2): Enables the app to receive push notifications.
  - `cloud_firestore` (v5.4.4): Allows interaction with Firestore, a scalable NoSQL database from Firebase.
  - `firebase_storage` (v12.3.4): Used for uploading and storing media files, such as images, to Firebase Storage.

### UI & UX Enhancements

- **Push Notifications**
  - `awesome_notifications`: Manages push notifications, providing a way to create rich and customizable notifications within the app.

- **Loading/Shimmer Animations**
  - `skeletonizer` (v1.1.1): Provides skeleton loading animations for a better UX during data loading periods.

- **Animations**
  - `flutter_animate` (v4.5.0): A package that provides custom animations, adding dynamic visual effects to the UI.

- **Custom Fonts**
  - `google_fonts` (v6.2.1): Allows easy integration of Google Fonts into the project, enhancing UI customization and typography.

- **Spacing**
  - `gap` (v3.0.1): Simplifies spacing and layout management by providing easy ways to add consistent spacing between elements.

- **Connectivity**
  - `internet_connection_checker` (v1.0.0+1): Checks the status of internet connectivity, alerting users when they are offline.

### Input & Feedback

- **OTP Input Fields**
  - `pinput` (v5.0.0): Provides customizable OTP input fields, improving user experience during authentication processes.

- **Toast Messages**
  - `fluttertoast` (v8.0.9): Displays brief, informative toast messages for instant user feedback.

- **Image Picker**
  - `image_picker` (v1.1.2): Facilitates picking images from the device’s gallery or camera, enabling photo uploads.

---

Each of these packages enhances specific functionalities of the Car Workshop app, ensuring a robust, responsive, and user-friendly experience.
