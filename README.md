# Mobile Calculator
## Basic Overview
It is a basic calculator designed for basically Android. It can perform basic tasks listed below:
1. Addition
2. Substraction
3. Multiplication
4. Division
5. Exponential calculations
6. Logarithmic Calculations
7. Trignometric Calculations

__Preview:__

<img width="411" alt="Monosnap Android Emulator - flutter_emulator:5554 2025-05-31 20-50-22" src="https://github.com/user-attachments/assets/e8bcfea9-cd4d-4781-a496-7186bcde4639" />

I is made using the framework by flutter. And verified its functioning on android simulator.

Also note that you have to swipe to lowest to get option for getting history.

## List of Technologies and frameworks used
This uses multiple technologies:
1. Programming Language: Dart
2. Framework: Flutter
3. Widgets and components: MaterialApp, Scaffold, Container, Column, Row, Text, ElevatedButtons, wrap, padding, sizedBox etc
4. Libraries: math_expressions/math_expressions.dart, flutter/material.dart
5. Target and Devloper Device: Android (iOS simulator wasnt running!) and macOS respectively
6. IDE: VS code
7. simulator: from Xcode and android Studio

## Setup Instruction
I'll be writing instruction assuming the developer system is mac:
* __Install Xcode__:It is a pre-requisite for Flutter setup on your mac. You can follow https://developer.apple.com/xcode/ 
* __Install Cocoapods__:Again pre-requisite for Flutter setup. You can follow https://guides.cocoapods.org/using/getting-started.html
* __Install a IDE__:You'll need it for editing codes in convinience. Preferably, VScode from https://code.visualstudio.com
* __Install Android Stodio__: Basically, you will need it for android simulator on VS Code. Download it from https://developer.android.com/studio
* __Install Flutter SDK__: You have 2 methods for this-  
  * manually through Terminal
  * Directly through VS Code
     you can follow https://docs.flutter.dev/get-started/install/macos
* clone the git repo, which you will simulate.
* connect a physical phone or simulate android, so that the device is visible in bottom right section of the VS code.
* command to the terminal "flutter pub get" to install all the dependencies before running the app.
* click F5 while being on main.dart file inside lib. And it should start a new window in phone simulating the coded app.

## Features implemented

### 1. Basic Arithmetic Operations
- Supports:
  - Addition (`+`)
  - Subtraction (`-`)
  - Multiplication (`×`)
  - Division (`÷`)
- Decimal input supported via (`.`)

### 2. Advanced Mathematical Functions
- **Square root** via `√` (mapped internally to `sqrt()`)
- **Exponentiation** using `^`
- **Mathematical constants**:
  - `π` (Pi ≈ 3.14)
  - `e` (Euler’s number ≈ 2.71)
- **Logarithmic and Trigonometric Functions**:
  - `log` (natural log)
  - `sin`, `cos`, `tan` (evaluated in radians)

### 3. Expression Evaluation
- Uses the [`math_expressions`](https://pub.dev/packages/math_expressions) package
- Parses and evaluates expressions with proper operator precedence
- Supports parenthesis and complex expressions

### 4. Calculation History
- Stores each evaluated expression with its result
- Displays history in a custom styled `AlertDialog`
- Includes options to:
  - Close the history window
  - Clear the history (logic placeholder included)

### 5. Dark Mode UI
- Styled using dark-themed colors
- Buttons use `ElevatedButton` with custom colors and rounded corners
- Text and layout optimized for dark backgrounds

### 6. Special Controls
- `C` – Clear all inputs
- `⌫` – Backspace (delete last character)
- `=` – Evaluate current expression
- `History` – View all previous expressions and results
## Challenges and solutions
The couple challenges and their solution that i encountered during its development are:
1. __setup__:setup of the flutter was a complete headache! it took a day for that. Basically some of programs were not up to date sometimes, or some pakages have not been correctly installed in others.
2. __fitting all buttons__: I struggled in that, as there were too many buttons i had to put on but the space was not allowing that. I was not willing to make another page and complicate it more. So i finally used SingleChildScrollView object for fitting it in with appropriate sized.
3. __Choosing Colour__: I spent a great deal of time in choosing colours. Basically there were many and was hard to choose the best. I was time-consuming part.


## Future enhancments
* button to change the mode to degrees. currently it is in radians mode by default.
* __Scientific Notation support__: enable input so that all the answers is in scientific notation mode
* __Answer Keyword__: so that one can use that to use answer of previous expression.
* __Toggling the theme__: from dark to light mode!
* __individual history delete__: so that user can delete saparate calculations and need not to delete it all at once.
* __support for rotated view__


