# Flutter Bootcamp Apps

This is the repository for the apps created during the [The Complete Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/) taught by [The App Brewery](https://github.com/londonappbrewery).

## I am Rich

This is the very first app build, it shows how Flutter apps are structured, some concepts of the `MaterialApp`, `Scaffold` and `Image` widgets. It also convers assets and app icons.

[Source](/im_rich)

![I Am Right app screenshot](screenshots/iamrich.png)

## Mi Card

A business card as an app. This app covers some concepts of layout (columns and rows), custom fonts, Material icons and text styling.

[Source](/mi_card)

![MiCard app screenshot](screenshots/micard.png)

## Dicee

A dice rolling app. This app covers the concept of stateless and stateful widgets.

[Source](/dicee)

![Dicee app screenshot](screenshots/dicee.png)

## Xylophone

A music app. This app covers the concept of Flutter packages.

This app uses the [audioplayers](https://pub.dev/packages/audioplayers) package.

[Source](/xylophone)

![Xylophone app screenshot](screenshots/xylophone.png)

## Quizzler

A quiz app. This app covers some Object Oriented Programming concepts with Dart and code organization.

> During the course it was suggested to use the [rflutter_alert](https://pub.dev/packages/rflutter_alert) package, but I decided to use the native `AlertDialog` class

[Source](/quizzler)

![Quizzler app screenshot](screenshots/quizzler.png)

## Destini

A choose your own adventure game. This app is really similar to `Quizzler`, but it was made as a challenge instead of a step-by-step guide.

[Source](/destini)

![Destini app screenshot](screenshots/destini.png)

## BMI Calculator

An app that calculates your BMI. This app covers some code organization, Dart concepts, and widget design and refactoring.

> This project was based on the [Ruben Vaalt design](https://dribbble.com/shots/4585382-Simple-BMI-Calculator)

[Source](/bmi)

![BMI Calculator main screen](screenshots/bmi.png) ![BMI Calculator result screen](screenshots/bmi2.png)

## Clima

A weather app. This app covers more Dart concepts, networking and also navigation (which include passing data between screens).

[Source](/clima)

![Clima main screen](screenshots/clima1.png) ![Clima city screen](screenshots/clima2.png)

## Bitcoin Ticker

A crypto app that displays exchange rates between Bitcoin and your selected currency. This app covers the use of `FutureBuilder` and the use of Cupertino widgets. The data is fetched fron [CoinAPI](https://www.coinapi.io/).

> As this app requires an api key, I used the [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) package as a way to hide the api key from the version control

[Source](/bitcoin_ticker)

![Bitcoin ticker app screenshot](screenshots/bitcoin_ticker.png)

## Flash Chat

A chatting app. This app covers named routes and animations.

For this project, I did some changes by myself:

* Instead of depending on the [modal_progress_hud](https://pub.dev/packages/modal_progress_hud) package, I've created my own widget to show a progress HUD.
* Back button on login screen and registration screen
* Show Firebase errors to the user
* Better form validation for required fields
* Refactored the login and registration screen into a single screen
* Detecting already authenticated user, giving the option to continue or sign out
* Added a date to the messages to be able to sort them
* Show a indicator when sending a message
* Handling empty messages

[Source](/flash_chat)

![Flash Chat welcome screenshot](screenshots/flash_chat_welcome.png) ![Flash Chat login screenshot](screenshots/flash_chat_login.png) ![Flash Chat authenticated screenshot](screenshots/flash_chat_authenticated.png) ![Flash Chat messages screenshot](screenshots/flash_chat_messages.png)

## Todoey

A todo app. This app covers state management.

For this project, I did some changes by myself:

* Added swipe to remove
* Show a snackbar to let the user undo the removal of a task
* Show an indicator when adding a task
* First implemented the persistence layer using [SQFlite](https://pub.dev/packages/sqflite), then switched to [Hive](https://pub.dev/packages/hive)

[Source](/todoey)

![Todoey screenshot](screenshots/todoey1.png) ![Todoey screenshot](screenshots/todoey2.png) ![Todoey screenshot](screenshots/todoey3.png) ![Todoey screenshot](screenshots/todoey4.png)