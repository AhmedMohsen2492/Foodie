# Foodie Mobile Application

## Description
The Foodie mobile application is a platform that allows users to manage their dietary information and track the nutritional content of their meals. Key features of the application include:

1. **User Registration and Authentication**: Users can sign up for the application by providing their email and password. The application uses Firebase Authentication to securely save user account information.

2. **Personal Information Management**: After sign-up, users can enter their personal information, including height, weight, age, name, gender, and any medical conditions.

3. **Login and Home Screen**: Users can log in to the application if they have an existing account. Logged-in users are taken directly to the home screen.

4. **Food Tracking**: On the home screen, users can upload images of their meals. The application uses computer vision techniques to detect the food elements in the image and allows users to input the quantity of each food item. The application then calculates the nutritional information of the meal and determines whether it is healthy based on the user's personal information. All the user's meal data is stored in the Firebase Firestore database.

5. **Personal Information Editing and Logout**: Users can edit their personal information and log out of the application.

6. **Chatbot Integration**: The application integrates a chatbot, powered by the Gemini chatbot from Google, to provide users with information and answer questions.

7. **Food Ingredient Lookup**: Users can search for the nutritional information of individual food items or combinations of food items using an auto-complete feature.

## Technology Stack
- Mobile Platform: iOS and Android
- Frontend: React Native
- Backend: Firebase (Authentication, Firestore)
- Computer Vision: TensorFlow Lite or similar library
- Chatbot: Gemini chatbot from Google
- Auto-complete: Suggestion engine library (e.g., Algolia, Elasticsearch)

## Setup and Installation
1. Create a Firebase project and enable the Authentication and Firestore services.
2. Integrate the Firebase SDK into the React Native application.
3. Implement the user registration, login, and personal information management features using Firebase Authentication and Firestore.
4. Integrate the computer vision library to detect food elements in uploaded images.
5. Implement the food tracking and nutritional information calculation logic.
6. Integrate the Gemini chatbot and the auto-complete feature for food ingredient lookup.
7. Build and distribute the application to the respective app stores (App Store and Google Play Store).

## Future Enhancements
- Meal planning and recommendation features
- Integration with fitness tracking devices
- Social features to share meals and connect with friends
- Offline functionality for data tracking and meal logging
