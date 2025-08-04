class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

class QuizData {
  static List<Question> questions = [
    Question(
      question: "What programming language is Flutter built with?",
      options: ["Java", "Dart", "Kotlin", "Swift"],
      correctAnswerIndex: 1,
      explanation: "Flutter is built with Dart, a client-optimized language for fast apps on any platform.",
    ),
    Question(
      question: "Which widget is used to create a scrollable list of widgets?",
      options: ["Column", "Row", "ListView", "Stack"],
      correctAnswerIndex: 2,
      explanation: "ListView is used to create a scrollable list of widgets that are created on demand.",
    ),
    Question(
      question: "What is the purpose of StatefulWidget in Flutter?",
      options: [
        "To create widgets that never change",
        "To create widgets that can change over time",
        "To create static UI elements",
        "To create database connections"
      ],
      correctAnswerIndex: 1,
      explanation: "StatefulWidget is used to create widgets that can change over time, maintaining state that might change during the lifetime of the widget.",
    ),
    Question(
      question: "Which of the following is NOT a Flutter layout widget?",
      options: ["Container", "Column", "HttpClient", "Stack"],
      correctAnswerIndex: 2,
      explanation: "HttpClient is not a layout widget; it's used for making HTTP requests. Container, Column, and Stack are all layout widgets.",
    ),
    Question(
      question: "What does the 'hot reload' feature do in Flutter development?",
      options: [
        "Restarts the entire application",
        "Updates the UI without losing the app state",
        "Compiles the app for production",
        "Clears the app cache"
      ],
      correctAnswerIndex: 1,
      explanation: "Hot reload updates the UI by injecting updated source code files into the running Dart VM without losing the app state.",
    ),
    Question(
      question: "Which widget would you use to add padding around another widget?",
      options: ["Margin", "Spacer", "Padding", "Inset"],
      correctAnswerIndex: 2,
      explanation: "The Padding widget is used to add padding (empty space) around another widget.",
    ),
    Question(
      question: "What is the main function of the MaterialApp widget?",
      options: [
        "To create material design buttons",
        "To set up the basic structure for a material design app",
        "To animate transitions between screens",
        "To handle user input"
      ],
      correctAnswerIndex: 1,
      explanation: "MaterialApp sets up the basic structure for a material design app, including themes, navigation, and more.",
    ),
    Question(
      question: "Which state management solution is built into Flutter?",
      options: ["Redux", "MobX", "Provider", "setState"],
      correctAnswerIndex: 3,
      explanation: "setState is the built-in state management solution in Flutter. The others are third-party packages.",
    ),
    Question(
      question: "What is the purpose of the pubspec.yaml file in a Flutter project?",
      options: [
        "To define the app's UI layout",
        "To configure app permissions",
        "To specify dependencies and assets",
        "To store user data"
      ],
      correctAnswerIndex: 2,
      explanation: "The pubspec.yaml file is used to specify dependencies, assets, fonts, and other metadata for a Flutter project.",
    ),
    Question(
      question: "Which widget would you use to create a button with an icon and text in Flutter?",
      options: ["RaisedButton", "FlatButton", "ElevatedButton", "IconButton"],
      correctAnswerIndex: 2,
      explanation: "ElevatedButton can be customized with both an icon and text using the icon parameter.",
    ),
  ];
}