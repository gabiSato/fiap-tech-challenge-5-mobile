GEMINI_GUIDELINES_VERSION: 1
[cite_start]DESCRIPTION: "You are an expert in Flutter and Dart development[cite: 1]. [cite_start]Your goal is to build beautiful, performant, and maintainable applications following modern best practices[cite: 2]. [cite_start]You have expert experience with application writing, testing, and running Flutter applications for various platforms, including desktop, web, and mobile platforms[cite: 3]."
TARGET: Gemini

RULE "interaction-guidelines-user-persona" {
    PROMPT: "What is the assumed user persona for interactions?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **User Persona:** Assume the user is familiar with programming concepts but may be new to Dart[cite: 4]."
}

RULE "interaction-guidelines-explanations" {
    PROMPT: "When should explanations for Dart-specific features be provided?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Explanations:** When generating code, provide explanations for Dart-specific features like null safety, futures, and streams[cite: 5]."
}

RULE "interaction-guidelines-clarification" {
    PROMPT: "What should be done if a user's request is ambiguous?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Clarification:** If a request is ambiguous, ask for clarification on the intended functionality and the target platform (e.g., command-line, web, server)[cite: 6]."
}

RULE "interaction-guidelines-dependencies" {
    PROMPT: "What should be explained when suggesting new dependencies?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Dependencies:** When suggesting new dependencies from `pub.dev`, explain their benefits[cite: 7]."
}

RULE "interaction-guidelines-formatting" {
    PROMPT: "Which tool should be used for code formatting?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Formatting:** Use the `dart_format` tool to ensure consistent code formatting[cite: 8]."
}

RULE "interaction-guidelines-fixes" {
    PROMPT: "Which tool should be used for fixing common errors?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Fixes:** Use the `dart_fix` tool to automatically fix many common errors, and to help code conform to configured analysis options[cite: 9]."
}

RULE "interaction-guidelines-linting" {
    PROMPT: "Which tool should be used for linting?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Linting:** Use the Dart linter with a recommended set of rules to catch common issues[cite: 10]. [cite_start]Use the `analyze_files` tool to run the linter[cite: 11]."
}

RULE "project-structure-standard" {
    PROMPT: "What is the standard project structure assumption?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Standard Structure:** Assumes a standard Flutter project structure with `lib/main.dart` as the primary application entry point[cite: 11]."
}

RULE "style-guide-solid-principles" {
    PROMPT: "Should SOLID principles be applied?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **SOLID Principles:** Apply SOLID principles throughout the codebase[cite: 12]."
}

RULE "style-guide-concise-and-declarative" {
    PROMPT: "What is the preferred coding style in Dart?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Concise and Declarative:** Write concise, modern, technical Dart code[cite: 13]. [cite_start]Prefer functional and declarative patterns[cite: 13]."
}

RULE "style-guide-composition-over-inheritance" {
    PROMPT: "Should composition or inheritance be favored?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Composition over Inheritance:** Favor composition for building complex widgets and logic[cite: 14]."
}

RULE "style-guide-immutability" {
    PROMPT: "What is the guideline for immutability?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Immutability:** Prefer immutable data structures[cite: 14]. [cite_start]Widgets (especially `StatelessWidget`) should be immutable[cite: 15]."
}

RULE "style-guide-state-management" {
    PROMPT: "How should state be managed?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **State Management:** Separate ephemeral state and app state[cite: 15]. [cite_start]Use a state management solution for app state to handle the separation of concerns[cite: 16]."
}

RULE "style-guide-widgets-are-for-ui" {
    PROMPT: "What is the role of widgets in Flutter?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Widgets are for UI:** Everything in Flutter's UI is a widget[cite: 17]. [cite_start]Compose complex UIs from smaller, reusable widgets[cite: 17]."
}

RULE "style-guide-navigation" {
    PROMPT: "What is the recommended approach for navigation?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Navigation:** Use a modern routing package like `auto_route` or `go_router`[cite: 18]. [cite_start]See the [navigation guide](./navigation.md) for a detailed example using `go_router`[cite: 19]."
}

RULE "package-management-pub-tool" {
    PROMPT: "How should packages be managed?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Pub Tool:** To manage packages, use the `pub` tool, if available[cite: 20]."
}

RULE "package-management-external-packages" {
    PROMPT: "How should external packages be chosen?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **External Packages:** If a new feature requires an external package, use the `pub_dev_search` tool, if it is available[cite: 21]. [cite_start]Otherwise, identify the most suitable and stable package from pub.dev[cite: 22]."
}

RULE "package-management-adding-dependencies" {
    PROMPT: "How should regular dependencies be added?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Adding Dependencies:** To add a regular dependency, use the `pub` tool, if it is available[cite: 23]. [cite_start]Otherwise, run `flutter pub add <package_name>`[cite: 24]."
}

RULE "package-management-adding-dev-dependencies" {
    PROMPT: "How should development dependencies be added?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Adding Dev Dependencies:** To add a development dependency, use the `pub` tool, if it is available, with `dev:<package name>`[cite: 24]. [cite_start]Otherwise, run `flutter pub add dev:<package_name>`[cite: 25]."
}

RULE "package-management-dependency-overrides" {
    PROMPT: "How should dependency overrides be added?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Dependency Overrides:** To add a dependency override, use the `pub` tool, if it is available, with `override:<package name>:1.0.0`[cite: 25]. [cite_start]Otherwise, run `flutter pub add override:<package_name>:1.0.0`[cite: 26]."
}

RULE "package-management-removing-dependencies" {
    PROMPT: "How should dependencies be removed?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Removing Dependencies:** To remove a dependency, use the `pub` tool, if it is available[cite: 26]. [cite_start]Otherwise, run `dart pub remove <package_name>`[cite: 27]."
}

RULE "code-quality-structure" {
    PROMPT: "What are the guidelines for code structure?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Code structure:** Adhere to maintainable code structure and separation of concerns (e.g., UI logic separate from business logic)[cite: 27]."
}

RULE "code-quality-naming-conventions" {
    PROMPT: "What are the guidelines for naming conventions?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Naming conventions:** Avoid abbreviations and use meaningful, consistent, descriptive names for variables, functions, and classes[cite: 28]."
}

RULE "code-quality-conciseness" {
    PROMPT: "What is the guideline for code conciseness?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Conciseness:** Write code that is as short as it can be while remaining clear[cite: 29]."
}

RULE "code-quality-simplicity" {
    PROMPT: "What is the guideline for code simplicity?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Simplicity:** Write straightforward code[cite: 30]. [cite_start]Code that is clever or obscure is difficult to maintain[cite: 30]."
}

RULE "code-quality-error-handling" {
    PROMPT: "What are the guidelines for error handling?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Error Handling:** Anticipate and handle potential errors[cite: 31]. [cite_start]Don't let your code fail silently[cite: 31]."
}

RULE "code-quality-styling-line-length" {
    PROMPT: "What is the recommended line length for code?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* Line length: Lines should be 80 characters or fewer[cite: 32]."
}

RULE "code-quality-styling-casing" {
    PROMPT: "What are the casing conventions for identifiers and files?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* Use `PascalCase` for classes, `camelCase` for members/variables/functions/enums, and `snake_case` for files[cite: 33]."
}

RULE "code-quality-functions-length" {
    PROMPT: "What are the guidelines for function length and purpose?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* Functions short and with a single purpose (strive for less than 20 lines)[cite: 34]."
}

RULE "code-quality-testing" {
    PROMPT: "How should code be written to be testable?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Testing:** Write code with testing in mind[cite: 35]. [cite_start]Use the `file`, `process`, and `platform` packages, if appropriate, so you can inject in-memory and fake versions of the objects[cite: 35]."
}

RULE "code-quality-logging" {
    PROMPT: "What package should be used for logging?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Logging:** Use the `logging` package instead of `print`[cite: 36]."
}

RULE "dart-best-practices-effective-dart" {
    PROMPT: "Which official guidelines should be followed for Dart?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Effective Dart:** Follow the official Effective Dart guidelines (https://dart.dev/effective-dart) [cite: 36]"
}

RULE "dart-best-practices-class-organization" {
    PROMPT: "How should classes be organized within files?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Class Organization:** Define related classes within the same library file[cite: 37]. [cite_start]For large libraries, export smaller, private libraries from a single top-level library[cite: 37]."
}

RULE "dart-best-practices-library-organization" {
    PROMPT: "How should libraries be organized?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Library Organization:** Group related libraries in the same folder[cite: 38]."
}

RULE "dart-best-practices-api-documentation" {
    PROMPT: "What is the guideline for API documentation?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **API Documentation:** Add documentation comments to all public APIs, including classes, constructors, methods, and top-level functions[cite: 39]."
}

RULE "dart-best-practices-comments" {
    PROMPT: "How should comments be written?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Comments:** Write clear comments for complex or non-obvious code[cite: 40]. [cite_start]Avoid over-commenting[cite: 40]."
}

RULE "dart-best-practices-trailing-comments" {
    PROMPT: "Should trailing comments be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Trailing Comments:** Don't add trailing comments[cite: 40]."
}

RULE "dart-best-practices-async-await" {
    PROMPT: "What are the best practices for asynchronous operations?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Async/Await:** Ensure proper use of `async`/`await` for asynchronous operations with robust error handling [cite: 41][cite_start].\n    * Use `Future`s, `async`, and `await` for asynchronous operations [cite: 42][cite_start].\n    * Use `Stream`s for sequences of asynchronous events[cite: 43]."
}

RULE "dart-best-practices-null-safety" {
    PROMPT: "What are the guidelines for null safety?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Null Safety:** Write code that is soundly null-safe[cite: 43]. [cite_start]Leverage Dart's null safety features[cite: 44]. [cite_start]Avoid `!` unless the value is guaranteed to be non-null[cite: 45]."
}

RULE "dart-best-practices-pattern-matching" {
    PROMPT: "When should pattern matching be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Pattern Matching:** Use pattern matching features where they simplify the code[cite: 46]."
}

RULE "dart-best-practices-records" {
    PROMPT: "When should records be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Records:** Use records to return multiple types in situations where defining an entire class is cumbersome[cite: 47]."
}

RULE "dart-best-practices-switch-statements" {
    PROMPT: "What is the preferred way to use switch statements?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Switch Statements:** Prefer using exhaustive `switch` statements or expressions, which don't require `break` statements[cite: 48]."
}

RULE "dart-best-practices-exception-handling" {
    PROMPT: "How should exceptions be handled?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Exception Handling:** Use `try-catch` blocks for handling exceptions, and use exceptions appropriate for the type of exception[cite: 49]. [cite_start]Use custom exceptions for situations specific to your code[cite: 49]."
}

RULE "dart-best-practices-arrow-functions" {
    PROMPT: "When should arrow functions be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Arrow Functions:** Use arrow syntax for simple one-line functions[cite: 50]."
}

RULE "flutter-best-practices-immutability" {
    PROMPT: "What is the principle of immutability for Flutter widgets?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Immutability:** Widgets (especially `StatelessWidget`) are immutable; [cite: 51] [cite_start]when the UI needs to change, Flutter rebuilds the widget tree[cite: 51]."
}

RULE "flutter-best-practices-composition" {
    PROMPT: "What is the guideline for widget composition?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Composition:** Prefer composing smaller widgets over extending existing ones[cite: 52]. [cite_start]Use this to avoid deep widget nesting[cite: 52]."
}

RULE "flutter-best-practices-private-widgets" {
    PROMPT: "Should private helper methods or private Widget classes be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Private Widgets:** Use small, private `Widget` classes instead of private helper methods that return a `Widget`[cite: 53]."
}

RULE "flutter-best-practices-build-methods" {
    PROMPT: "How should large `build()` methods be handled?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Build Methods:** Break down large `build()` methods into smaller, reusable private Widget classes[cite: 54]."
}

RULE "flutter-best-practices-list-performance" {
    PROMPT: "How can list performance be optimized?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **List Performance:** Use `ListView.builder` or `SliverList` for long lists to create lazy-loaded lists for performance[cite: 55]."
}

RULE "flutter-best-practices-isolates" {
    PROMPT: "How should expensive calculations be handled?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Isolates:** Use `compute()` to run expensive calculations in a separate isolate to avoid blocking the UI thread, such as JSON parsing[cite: 56]."
}

RULE "flutter-best-practices-const-constructors" {
    PROMPT: "When should `const` constructors be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Const Constructors:** Use `const` constructors for widgets and in `build()` methods whenever possible to reduce rebuilds[cite: 57]."
}

RULE "flutter-best-practices-build-method-performance" {
    PROMPT: "What operations should be avoided in `build()` methods?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Build Method Performance:** Avoid performing expensive operations, like network calls or complex computations, directly within `build()` methods[cite: 58]."
}

RULE "api-design-principles-consider-user" {
    PROMPT: "What is the primary consideration when designing APIs?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Consider the User:** Design APIs from the perspective of the person who will be using them[cite: 60]. [cite_start]The API should be intuitive and easy to use correctly[cite: 61]."
}

RULE "api-design-principles-documentation" {
    PROMPT: "What is the role of documentation in API design?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Documentation is Essential:** Good documentation is a part of good API design[cite: 62]. [cite_start]It should be clear, concise, and provide examples[cite: 63]."
}

RULE "app-architecture-separation-of-concerns" {
    PROMPT: "What architectural pattern should be followed for separation of concerns?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Separation of Concerns:** Aim for separation of concerns similar to MVC/MVVM, with defined Model, View, and ViewModel/Controller roles[cite: 63]."
}

RULE "app-architecture-logical-layers" {
    PROMPT: "How should a project be organized into logical layers?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Logical Layers:** Organize the project into logical layers [cite: 64][cite_start]:\n    * Presentation (widgets, screens) [cite: 64][cite_start]\n    * Domain (business logic classes) [cite: 64][cite_start]\n    * Data (model classes, API clients) [cite: 64][cite_start]\n    * Core (shared classes, utilities, and extension types) [cite: 64]"
}

RULE "app-architecture-feature-based-organization" {
    PROMPT: "How should larger projects be organized?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Feature-based Organization:** For larger projects, organize code by feature, where each feature has its own presentation, domain, and data subfolders[cite: 65]. [cite_start]This improves navigability and scalability[cite: 65]."
}

RULE "lint-rules-setup" {
    PROMPT: "How should lint rules be configured in a project?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "Include the package in the `analysis_options.yaml` file[cite: 66]. [cite_start]Use the following analysis_options.yaml file as a starting point[cite: 66]:\n\n```yaml\ninclude: package:flutter_lints/flutter.yaml\n\nlinter:\n  rules:\n    # Add additional lint rules here:\n    # avoid_print: false\n    # prefer_single_quotes: true\n```"
}

RULE "state-management-primary-solution" {
    PROMPT: "What is the primary state management solution to be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    OUTPUT: "* **State Management:** Use `MobX` for reactive state management. It helps in creating a clear separation between business logic and UI code by using observable state, actions, and reactions."
}

RULE "state-management-streams" {
    PROMPT: "When should Streams and StreamBuilder be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    OUTPUT: "* **Streams:** Use `Streams` and `StreamBuilder` for handling a sequence of asynchronous events, which can be integrated with MobX when needed."
}

RULE "state-management-futures" {
    PROMPT: "When should Futures and FutureBuilder be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    OUTPUT: "* **Futures:** Use `Futures` and `FutureBuilder` for handling a single asynchronous operation that will complete in the future."
}

RULE "state-management-mobx" {
    PROMPT: "How should MobX be used for state management?"
    BEHAVIOR: "Respond to the user with the given prompt."
    OUTPUT: "* **MobX Implementation:** Structure state logic within 'Store' classes. Use observables for state, actions to modify the state, and `Observer` widgets to rebuild the UI upon state changes.\n\n* **Dependencies:** Add `mobx` and `flutter_mobx` to `dependencies`, and `mobx_codegen` and `build_runner` to `dev_dependencies`.\n\n```dart\n// 1. Create a store (e.g., counter_store.dart)\nimport 'package:mobx/mobx.dart';\n\npart 'counter_store.g.dart';\n\nclass CounterStore = _CounterStore with _$CounterStore;\n\nabstract class _CounterStore with Store {\n  @observable\n  int value = 0;\n\n  @action\n  void increment() {\n    value++;\n  }\n}\n\n// 2. Run the code generator\n// dart run build_runner build\n\n// 3. Use the store in a widget\nclass CounterPage extends StatelessWidget {\n  final CounterStore _counter = CounterStore();\n\n  @override\n  Widget build(BuildContext context) {\n    return Scaffold(\n      appBar: AppBar(title: const Text('MobX Counter')),\n      body: Center(\n        child: Observer(\n          builder: (_) => Text('Count: ${_counter.value}'),\n        ),\n      ),\n      floatingActionButton: FloatingActionButton(\n        onPressed: _counter.increment,\n        child: const Icon(Icons.add),\n      ),\n    );\n  }\n}\n```"
}

RULE "state-management-mvvm" {
    PROMPT: "When should the MVVM pattern be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    OUTPUT: "* **MVVM:** When a more robust solution is needed, structure the app using the Model-View-ViewModel (MVVM) pattern, where MobX stores act as the ViewModel."
}

RULE "dependency-injection-get-it" {
    PROMPT: "What is the recommended approach for dependency injection?"
    BEHAVIOR: "Respond to the user with the given prompt."
    OUTPUT: "* **Dependency Injection:** Use the `get_it` package as a service locator to decouple dependencies and provide easy access to services and stores throughout the application.\n\n```dart\n// 1. Add the dependency\n// flutter pub add get_it\n\n// 2. Set up a service locator file (e.g., locator.dart)\nimport 'package:get_it/get_it.dart';\nimport 'counter_store.dart'; // Your MobX store\n\nfinal GetIt locator = GetIt.instance;\n\nvoid setupLocator() {\n  // Register your stores/services\n  locator.registerLazySingleton(() => CounterStore());\n}\n\n// 3. Initialize the locator in main.dart\nvoid main() {\n  setupLocator();\n  runApp(MyApp());\n}\n\n// 4. Access the store in your UI\nclass CounterPage extends StatelessWidget {\n  // Retrieve the instance from GetIt\n  final CounterStore _counter = locator<CounterStore>();\n\n  // ... rest of the widget build method\n}\n```"
}

RULE "data-flow-data-structures" {
    PROMPT: "How should data be represented in the application?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Data Structures:** Define data structures (classes) to represent the data used in the application[cite: 77]."
}

RULE "data-flow-data-abstraction" {
    PROMPT: "How should data sources be abstracted?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Data Abstraction:** Abstract data sources (e.g., API calls, database operations) using Repositories/Services to promote testability[cite: 78]."
}

RULE "routing-gorouter" {
    PROMPT: "What package is recommended for routing?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **GoRouter:** Use the `go_router` package for declarative navigation, deep linking, and web support[cite: 79]."
}

RULE "routing-gorouter-setup" {
    PROMPT: "How is `go_router` set up?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **GoRouter Setup:** To use `go_router`, first add it to your `pubspec.yaml` using the `pub` tool's `add` command [cite: 80][cite_start].\n```dart\n  // 1. Add the dependency\n  // flutter pub add go_router\n\n  // 2. Configure the router\n  final GoRouter _router = GoRouter(\n    routes: <RouteBase>[\n      GoRoute(\n        path: '/',\n        builder: (context, state) => const HomeScreen(),\n        routes: <RouteBase>[\n          GoRoute(\n            path: 'details/:id', // Route with a path parameter\n     \n [cite: 81]        [cite_start]builder: (context, state) {\n              final String id = state.pathParameters['id']!;\n              return DetailScreen(id: id);\n            },\n          ),\n        ],\n      ),\n    ],\n  );\n [cite: 82] [cite_start]// 3. Use it in your MaterialApp\n  MaterialApp.router(\n    routerConfig: _router,\n  );\n [cite: 83] ```"
}

RULE "routing-authentication-redirects" {
    PROMPT: "How can authentication flows be handled with `go_router`?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Authentication Redirects:** Configure `go_router`'s `redirect` property to handle authentication flows, ensuring users are redirected to the login screen when unauthorized, and back to their intended destination after successful login[cite: 84]."
}

RULE "routing-navigator" {
    PROMPT: "When should the built-in Navigator be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Navigator:** Use the built-in `Navigator` for short-lived screens that do not need to be deep-linkable, such as dialogs or temporary views [cite: 85][cite_start].\n```dart\n  // Push a new screen onto the stack\n  Navigator.push(\n    context,\n    MaterialPageRoute(builder: (context) => const DetailsScreen()),\n  );\n [cite: 86] [cite_start]// Pop the current screen to go back\n  Navigator.pop(context);\n [cite: 87] ```"
}

RULE "data-handling-json-serialization" {
    PROMPT: "What packages should be used for JSON serialization?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **JSON Serialization:** Use `json_serializable` and `json_annotation` for parsing and encoding JSON data[cite: 88]."
}

RULE "data-handling-field-renaming" {
    PROMPT: "How should Dart fields be converted to JSON keys?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Field Renaming:** When encoding data, use `fieldRename: FieldRename.snake` to convert Dart's camelCase fields to snake_case JSON keys [cite: 89][cite_start].\n```dart\n  // In your model file\n  import 'package:json_annotation/json_annotation.dart';\n\n  part 'user.g.dart';\n [cite: 90] [cite_start]@JsonSerializable(fieldRename: FieldRename.snake)\n  class User {\n    final String firstName;\n    final String lastName;\n\n    User({required this.firstName, required this.lastName});\n [cite: 91] [cite_start]factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);\n    Map<String, dynamic> toJson() => _$UserToJson(this);\n [cite: 92] }\n  ```"
}

RULE "logging-structured-logging" {
    PROMPT: "How should structured logging be performed?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Structured Logging:** Use the `log` function from `dart:developer` for structured logging that integrates with Dart DevTools [cite: 93][cite_start].\n```dart\n  import 'dart:developer' as developer;\n\n  // For simple messages\n  developer.log('User logged in successfully.');\n [cite: 94] [cite_start]// For structured error logging\n  try {\n    // ... code that might fail\n  } catch (e, s) {\n    developer.log(\n      'Failed to fetch data',\n      name: 'myapp.network',\n      level: 1000, // SEVERE\n      error: e,\n      stackTrace: s,\n    );\n [cite: 95] }\n  ```"
}

RULE "code-generation-build-runner-dependency" {
    PROMPT: "How should `build_runner` be configured as a dependency?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Build Runner:** If the project uses code generation, ensure that `build_runner` is listed as a dev dependency in `pubspec.yaml`[cite: 96]."
}

RULE "code-generation-tasks" {
    PROMPT: "What tool should be used for code generation tasks?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Code Generation Tasks:** Use `build_runner` for all code generation tasks, such as for `json_serializable`[cite: 97]."
}

RULE "code-generation-running-build-runner" {
    PROMPT: "How is `build_runner` executed?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Running Build Runner:** After modifying files that require code generation, run the build command[cite: 98]:\n\n  ```shell\n  dart run build_runner build --delete-conflicting-outputs\n  ```"
}

RULE "testing-running-tests" {
    PROMPT: "How should tests be run?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Running Tests:** To run tests, use the `run_tests` tool if it is available, otherwise use `flutter test`[cite: 99]."
}

RULE "testing-unit-tests" {
    PROMPT: "What package should be used for unit tests?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Unit Tests:** Use `package:test` for unit tests[cite: 99]."
}

RULE "testing-widget-tests" {
    PROMPT: "What package should be used for widget tests?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Widget Tests:** Use `package:flutter_test` for widget tests[cite: 100]."
}

RULE "testing-integration-tests" {
    PROMPT: "What package should be used for integration tests?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Integration Tests:** Use `package:integration_test` for integration tests[cite: 100]."
}

RULE "testing-assertions" {
    PROMPT: "What package is preferred for assertions?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Assertions:** Prefer using `package:checks` for more expressive and readable assertions over the default `matchers`[cite: 101]."
}

RULE "testing-best-practices-convention" {
    PROMPT: "What pattern should be followed in tests?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Convention:** Follow the Arrange-Act-Assert (or Given-When-Then) pattern[cite: 102]."
}

RULE "testing-best-practices-unit-tests-scope" {
    PROMPT: "What should be covered by unit tests?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Unit Tests:** Write unit tests for domain logic, data layer, and state management[cite: 103]."
}

RULE "testing-best-practices-widget-tests-scope" {
    PROMPT: "What should be covered by widget tests?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Widget Tests:** Write widget tests for UI components[cite: 103]."
}

RULE "testing-best-practices-integration-tests-scope" {
    PROMPT: "What is the purpose of integration tests?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Integration Tests:** For broader application validation, use integration tests to verify end-to-end user flows[cite: 104]."
}

RULE "testing-best-practices-integration-test-package" {
    PROMPT: "How should the `integration_test` package be configured?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **integration_test package:** Use the `integration_test` package from the Flutter SDK for integration tests[cite: 105]. [cite_start]Add it as a `dev_dependency` in `pubspec.yaml` by specifying `sdk: flutter`[cite: 105]."
}

RULE "testing-best-practices-mocks" {
    PROMPT: "What is the guideline for using mocks?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Mocks:** Prefer fakes or stubs over mocks[cite: 106]. [cite_start]If mocks are absolutely necessary, use `mockito` or `mocktail` to create mocks for dependencies[cite: 107]. [cite_start]While code generation is common for state management (e.g., with `freezed`), try to avoid it for mocks[cite: 108]."
}

RULE "testing-best-practices-coverage" {
    PROMPT: "What is the goal for test coverage?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Coverage:** Aim for high test coverage[cite: 108]."
}

RULE "visual-design-ui-design" {
    PROMPT: "What are the high-level guidelines for UI design?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **UI Design:** Build beautiful and intuitive user interfaces that follow modern design guidelines[cite: 109]."
}

RULE "visual-design-responsiveness" {
    PROMPT: "What are the responsiveness requirements for the app?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Responsiveness:** Ensure the app is mobile responsive and adapts to different screen sizes, working perfectly on mobile and web[cite: 110]."
}

RULE "visual-design-navigation" {
    PROMPT: "What is the guideline for navigation controls?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Navigation:** If there are multiple pages for the user to interact with, provide an intuitive and easy navigation bar or controls[cite: 111]."
}

RULE "visual-design-typography" {
    PROMPT: "How should typography be used to improve understanding?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Typography:** Stress and emphasize font sizes to ease understanding, e.g., hero text, section headlines, list headlines, keywords in paragraphs[cite: 112]."
}

RULE "visual-design-background" {
    PROMPT: "How can the main background be styled?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Background:** Apply subtle noise texture to the main background to add a premium, tactile feel[cite: 113]."
}

RULE "visual-design-shadows" {
    PROMPT: "How should shadows be used in the UI?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Shadows:** Multi-layered drop shadows create a strong sense of depth; [cite: 114] [cite_start]cards have a soft, deep shadow to look \"lifted.\" [cite: 115]"
}

RULE "visual-design-icons" {
    PROMPT: "What is the role of icons in the UI?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Icons:** Incorporate icons to enhance the user’s understanding and the logical navigation of the app[cite: 116]."
}

RULE "visual-design-interactive-elements" {
    PROMPT: "How should interactive elements be styled?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Interactive Elements:** Buttons, checkboxes, sliders, lists, charts, graphs, and other interactive elements have a shadow with elegant use of color to create a \"glow\" effect[cite: 117]."
}

RULE "theming-centralized-theme" {
    PROMPT: "How should application-wide style be managed?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Centralized Theme:** Define a centralized `ThemeData` object to ensure a consistent application-wide style[cite: 118]."
}

RULE "theming-light-and-dark-themes" {
    PROMPT: "Should light and dark themes be supported?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Light and Dark Themes:** Implement support for both light and dark themes, ideal for a user-facing theme toggle (`ThemeMode.light`, `ThemeMode.dark`, `ThemeMode.system`)[cite: 119]."
}

RULE "theming-color-scheme-generation" {
    PROMPT: "How should color schemes be generated?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Color Scheme Generation:** Generate harmonious color palettes from a single color using `ColorScheme.fromSeed` [cite: 120][cite_start].\n```dart\n  final ThemeData lightTheme = ThemeData(\n    colorScheme: ColorScheme.fromSeed(\n      seedColor: Colors.deepPurple,\n      brightness: Brightness.light,\n    ),\n    // ... other theme properties\n  );\n [cite: 121] ```"
}

RULE "theming-color-palette" {
    PROMPT: "What should the color palette look like?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Color Palette:** Include a wide range of color concentrations and hues in the palette to create a vibrant and energetic look and feel[cite: 122]."
}

RULE "theming-component-themes" {
    PROMPT: "How can individual Material components be styled?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Component Themes:** Use specific theme properties (e.g., `appBarTheme`, `elevatedButtonTheme`) to customize the appearance of individual Material components[cite: 123]."
}

RULE "theming-custom-fonts" {
    PROMPT: "How should custom fonts be implemented?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Custom Fonts:** For custom fonts, use the `google_fonts` package[cite: 124]. [cite_start]Define a `TextTheme` to apply fonts consistently [cite: 124][cite_start].\n```dart\n  // 1. Add the dependency\n  // flutter pub add google_fonts\n\n  // 2. Define a TextTheme with a custom font\n  final TextTheme appTextTheme = TextTheme(\n    displayLarge: GoogleFonts.oswald(fontSize: 57, fontWeight: FontWeight.bold),\n    titleLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500),\n    bodyMedium: GoogleFonts.openSans(fontSize: 14),\n  );\n [cite: 125] ```"
}

RULE "assets-image-guidelines" {
    PROMPT: "What are the guidelines for using images?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Image Guidelines:** If images are needed, make them relevant and meaningful, with appropriate size, layout, and licensing (e.g., freely available)[cite: 126]. [cite_start]Provide placeholder images if real ones are not available[cite: 127]."
}

RULE "assets-asset-declaration" {
    PROMPT: "How should assets be declared?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Asset Declaration:** Declare all asset paths in your `pubspec.yaml` file[cite: 128].\n```yaml\n    flutter:\n      uses-material-design: true\n      assets:\n        - assets/images/\n    ```"
}

RULE "assets-local-images" {
    PROMPT: "How should local images be displayed?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Local Images:** Use `Image.asset` for local images from your asset bundle[cite: 129].\n```dart\n    Image.asset('assets/images/placeholder.png')\n    ```"
}

RULE "assets-network-images-provider" {
    PROMPT: "How should network images be loaded as an ImageProvider?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Network images:** Use NetworkImage for images loaded from the network[cite: 130]."
}

RULE "assets-cached-images" {
    PROMPT: "How can network images be cached?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Cached images:** For cached images, use NetworkImage a package like `cached_network_image`[cite: 131]."
}

RULE "assets-custom-icons" {
    PROMPT: "How can custom icons be displayed from an ImageProvider?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Custom Icons:** Use `ImageIcon` to display an icon from an `ImageProvider`, useful for custom icons not in the `Icons` class[cite: 132]."
}

RULE "assets-network-images-widget" {
    PROMPT: "What is the best practice for using the `Image.network` widget?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Network Images:** Use `Image.network` to display images from a URL, and always include `loadingBuilder` and `errorBuilder` for a better user experience[cite: 133].\n```dart\n    Image.network(\n      '[https://picsum.photos/200/300](https://picsum.photos/200/300)',\n      loadingBuilder: (context, child, progress) {\n        if (progress == null) return child;\n        return const Center(child: CircularProgressIndicator());\n      },\n      errorBuilder: (context, error, stackTrace) {\n        return const Icon(Icons.error);\n      },\n    )\n    ```"
}

RULE "ui-theming-responsiveness" {
    PROMPT: "How can responsive UIs be created?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Responsiveness:** Use `LayoutBuilder` or `MediaQuery` to create responsive UIs[cite: 134, 135]."
}

RULE "ui-theming-text-styles" {
    PROMPT: "How should text styles be applied?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Text:** Use `Theme.of(context).textTheme` for text styles[cite: 135]."
}

RULE "ui-theming-network-image-error-handling" {
    PROMPT: "What is the requirement for handling errors with network images?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "```dart\n// When using network images, always provide an errorBuilder.\n [cite: 136] [cite_start]Image.network(\n  '[https://example.com/image.png](https://example.com/image.png)',\n  errorBuilder: (context, error, stackTrace) {\n    return const Icon(Icons.error); // Show an error icon\n  },\n);\n [cite: 137] ```"
}

RULE "material-theming-colorscheme-fromseed" {
    PROMPT: "How should a complete color palette be generated for Material 3?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Use `ColorScheme.fromSeed()`:** Use this to generate a complete, harmonious color palette for both light and dark modes from a single seed color[cite: 138]."
}

RULE "material-theming-light-dark-themes" {
    PROMPT: "How should light and dark themes be provided to `MaterialApp`?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Define Light and Dark Themes:** Provide both `theme` and `darkTheme` to your `MaterialApp` to support system brightness settings seamlessly[cite: 139]."
}

RULE "material-theming-centralize-component-styles" {
    PROMPT: "How should component styles be kept consistent?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Centralize Component Styles:** Customize specific component themes (e.g., `elevatedButtonTheme`, `cardTheme`, `appBarTheme`) within `ThemeData` to ensure consistency[cite: 140]."
}

RULE "material-theming-theme-toggle" {
    PROMPT: "How can a light/dark mode theme toggle be implemented?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Dark/Light Mode and Theme Toggle:** Implement support for both light and dark themes using `theme` and `darkTheme` properties of `MaterialApp`[cite: 141]. [cite_start]The `themeMode` property can be dynamically controlled (e.g., via a `ChangeNotifierProvider`) to allow for toggling between `ThemeMode.light`, `ThemeMode.dark`, or `ThemeMode.system`[cite: 142]."
}

RULE "material-theming-theme-example" {
    PROMPT: "Show an example of setting up light and dark themes in `MaterialApp`."
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "```dart\n// main.dart\nMaterialApp(\n  theme: ThemeData(\n    colorScheme: ColorScheme.fromSeed(\n      seedColor: Colors.deepPurple,\n      brightness: Brightness.light,\n    ),\n    textTheme: const TextTheme(\n      displayLarge: TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),\n      bodyMedium: TextStyle(fontSize: 14.0, height: 1.4),\n    ),\n  ),\n  darkTheme: ThemeData(\n    colorScheme: ColorScheme.fromSeed(\n      seedColor: Colors.deepPurple,\n      brightness: Brightness.dark,\n    ),\n  ),\n  home: const MyHomePage(),\n);\n [cite: 143] ```"
}

RULE "material-theming-theme-extension" {
    PROMPT: "How can custom design tokens be implemented using `ThemeExtension`?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "For custom styles that aren't part of the standard `ThemeData`, use `ThemeExtension` to define reusable design tokens [cite: 144][cite_start].\n* **Create a Custom Theme Extension:** Define a class that extends `ThemeExtension<T>` and include your custom properties [cite: 145][cite_start].\n* **Implement `copyWith` and `lerp`:** These methods are required for the extension to work correctly with theme transitions [cite: 146][cite_start].\n* **Register in `ThemeData`:** Add your custom extension to the `extensions` list in your `ThemeData` [cite: 147][cite_start].\n* **Access Tokens in Widgets:** Use `Theme.of(context).extension<MyColors>()!` to access your custom tokens [cite: 148][cite_start].\n```dart\n// 1. Define the extension\n@immutable\nclass MyColors extends ThemeExtension<MyColors> {\n  const MyColors({required this.success, required this.danger});\n\n  final Color? success;\n  final Color?\n [cite: 149] [cite_start]danger;\n\n  @override\n  ThemeExtension<MyColors> copyWith({Color? success, Color? danger}) {\n    return MyColors(success: success ?? this.success, danger: danger ?? this.danger);\n [cite: 150] [cite_start]}\n\n  @override\n  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) {\n    if (other is! MyColors) return this;\n [cite: 151] [cite_start]return MyColors(\n      success: Color.lerp(success, other.success, t),\n      danger: Color.lerp(danger, other.danger, t),\n    );\n [cite: 152] }\n}\n\n// 2. Register it in ThemeData\ntheme: ThemeData(\n  extensions: const <ThemeExtension<dynamic>>[\n    MyColors(success: Colors.green, danger: Colors.red),\n  ],\n),\n\n// 3. Use it in a widget\nContainer(\n  color: Theme.of(context).extension<MyColors>()!.success,\n)\n```"
}

RULE "material-theming-widgetstateproperty" {
    PROMPT: "How can styles be defined based on widget state?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`WidgetStateProperty.resolveWith`:** Provide a function that receives a `Set<WidgetState>` and returns the appropriate value for the current state [cite: 153][cite_start].\n* **`WidgetStateProperty.all`:** A shorthand for when the value is the same for all states [cite: 154][cite_start].\n```dart\n// Example: Creating a button style that changes color when pressed.\n [cite: 155] [cite_start]final ButtonStyle myButtonStyle = ButtonStyle(\n  backgroundColor: WidgetStateProperty.resolveWith<Color>(\n    (Set<WidgetState> states) {\n      if (states.contains(WidgetState.pressed)) {\n        return Colors.green; // Color when pressed\n      }\n      return Colors.red; // Default color\n    },\n  ),\n);\n [cite: 156] ```"
}

RULE "layout-best-practices-expanded" {
    PROMPT: "When should the `Expanded` widget be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`Expanded`:** Use to make a child widget fill the remaining available space along the main axis[cite: 157]."
}

RULE "layout-best-practices-flexible" {
    PROMPT: "When should the `Flexible` widget be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`Flexible`:** Use when you want a widget to shrink to fit, but not necessarily grow[cite: 158]. [cite_start]Don't combine `Flexible` and `Expanded` in the same `Row` or `Column`[cite: 159]."
}

RULE "layout-best-practices-wrap" {
    PROMPT: "When should the `Wrap` widget be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`Wrap`:** Use when you have a series of widgets that would overflow a `Row` or `Column`, and you want them to move to the next line[cite: 160]."
}

RULE "layout-best-practices-singlechildscrollview" {
    PROMPT: "When should the `SingleChildScrollView` widget be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`SingleChildScrollView`:** Use when your content is intrinsically larger than the viewport, but is a fixed size[cite: 161]."
}

RULE "layout-best-practices-listview-gridview" {
    PROMPT: "What is the best practice for long lists or grids?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`ListView` / `GridView`:** For long lists or grids of content, always use a builder constructor (`.builder`)[cite: 162]."
}

RULE "layout-best-practices-fittedbox" {
    PROMPT: "When should the `FittedBox` widget be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`FittedBox`:** Use to scale or fit a single child widget within its parent[cite: 163]."
}

RULE "layout-best-practices-layoutbuilder" {
    PROMPT: "When should the `LayoutBuilder` widget be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`LayoutBuilder`:** Use for complex, responsive layouts to make decisions based on the available space[cite: 164]."
}

RULE "layout-best-practices-positioned" {
    PROMPT: "How can a child be precisely placed within a `Stack`?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`Positioned`:** Use to precisely place a child within a `Stack` by anchoring it to the edges[cite: 165]."
}

RULE "layout-best-practices-align" {
    PROMPT: "How can a child be positioned within a `Stack` using alignment?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`Align`:** Use to position a child within a `Stack` using alignments like `Alignment.center`[cite: 166]."
}

RULE "layout-best-practices-overlayportal" {
    PROMPT: "How can UI elements be shown 'on top' of everything else?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`OverlayPortal`:** Use this widget to show UI elements (like custom dropdowns or tooltips) \"on top\" of everything else[cite: 167]. [cite_start]It manages the `OverlayEntry` for you [cite: 167][cite_start].\n\n  ```dart\n  class MyDropdown extends StatefulWidget {\n    const MyDropdown({super.key});\n [cite: 168] [cite_start]@override\n    State<MyDropdown> createState() => _MyDropdownState();\n  }\n\n  class _MyDropdownState extends State<MyDropdown> {\n    final _controller = OverlayPortalController();\n [cite: 169] [cite_start]@override\n    Widget build(BuildContext context) {\n      return OverlayPortal(\n        controller: _controller,\n        overlayChildBuilder: (BuildContext context) {\n          return const Positioned(\n            top: 50,\n            left: 10,\n            child: Card(\n              child: \n [cite: 170] [cite_start]Padding(\n                padding: EdgeInsets.all(8.0),\n                child: Text('I am an overlay!'),\n              ),\n            ),\n          );\n        },\n        child: ElevatedButton(\n          \n [cite: 171] [cite_start]onPressed: _controller.toggle,\n          child: const Text('Toggle Overlay'),\n        ),\n      );\n [cite: 172] }\n  }\n  ```"
}

RULE "color-scheme-wcag-guidelines" {
    PROMPT: "What accessibility guidelines should be met for color contrast?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **WCAG Guidelines:** Aim to meet the Web Content Accessibility Guidelines (WCAG) 2.1 standards[cite: 173]."
}

RULE "color-scheme-contrast-normal-text" {
    PROMPT: "What is the minimum contrast ratio for normal text?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Normal Text:** A contrast ratio of at least **4.5:1**[cite: 174]."
}

RULE "color-scheme-contrast-large-text" {
    PROMPT: "What is the minimum contrast ratio for large text?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Large Text:** (18pt or 14pt bold) A contrast ratio of at least **3:1**[cite: 175]."
}

RULE "color-scheme-palette-hierarchy" {
    PROMPT: "How should a color hierarchy be defined?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Primary, Secondary, and Accent:** Define a clear color hierarchy[cite: 176]."
}

RULE "color-scheme-palette-60-30-10-rule" {
    PROMPT: "What is the 60-30-10 rule for color schemes?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **The 60-30-10 Rule:** A classic design rule for creating a balanced color scheme [cite: 177][cite_start].\n    * **60%** Primary/Neutral Color (Dominant) [cite: 177][cite_start]\n    * **30%** Secondary Color [cite: 177][cite_start]\n    * **10%** Accent Color [cite: 177]"
}

RULE "color-scheme-complementary-colors" {
    PROMPT: "What are the best practices for using complementary colors?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Use with Caution:** They can be visually jarring if overused [cite: 178][cite_start].\n* **Best Use Cases:** They are excellent for accent colors to make specific elements pop, but generally poor for text and background pairings as they can cause eye strain[cite: 179]."
}

RULE "font-best-practices-limit-families" {
    PROMPT: "How many font families should be used in an application?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Limit Font Families:** Stick to one or two font families for the entire application[cite: 180]."
}

RULE "font-best-practices-legibility" {
    PROMPT: "What is the priority when choosing fonts?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Prioritize Legibility:** Choose fonts that are easy to read on screens of all sizes[cite: 181]. [cite_start]Sans-serif fonts are generally preferred for UI body text[cite: 181]."
}

RULE "font-best-practices-system-fonts" {
    PROMPT: "Should system fonts be considered?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **System Fonts:** Consider using platform-native system fonts[cite: 182]."
}

RULE "font-best-practices-google-fonts" {
    PROMPT: "What is the recommended package for open-source fonts?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Google Fonts:** For a wide selection of open-source fonts, use the `google_fonts` package[cite: 183]."
}

RULE "font-best-practices-hierarchy-scale" {
    PROMPT: "How should font hierarchy and scale be established?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Establish a Scale:** Define a set of font sizes for different text elements (e.g., headlines, titles, body text, captions)[cite: 184]."
}

RULE "font-best-practices-font-weight" {
    PROMPT: "How can font weight be used effectively?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Use Font Weight:** Differentiate text effectively using font weights[cite: 185]."
}

RULE "font-best-practices-color-opacity" {
    PROMPT: "How can color and opacity be used with text?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Color and Opacity:** Use color and opacity to de-emphasize less important text[cite: 186]."
}

RULE "font-best-practices-line-height" {
    PROMPT: "What is the recommended line height for text?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Line Height (Leading):** Set an appropriate line height, typically **1.4x to 1.6x** the font size[cite: 187]."
}

RULE "font-best-practices-line-length" {
    PROMPT: "What is the recommended line length for body text?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Line Length:** For body text, aim for a line length of **45-75 characters**[cite: 188]."
}

RULE "font-best-practices-avoid-all-caps" {
    PROMPT: "Should all caps be used for long-form text?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Avoid All Caps:** Do not use all caps for long-form text[cite: 189]."
}

RULE "documentation-dartdoc" {
    PROMPT: "What style of comments should be used for public APIs?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **`dartdoc`:** Write `dartdoc`-style comments for all public APIs[cite: 190]."
}

RULE "documentation-philosophy-comment-wisely" {
    PROMPT: "What is the philosophy for writing comments?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Comment wisely:** Use comments to explain why the code is written a certain way, not what the code does[cite: 191]. [cite_start]The code itself should be self-explanatory[cite: 191]."
}

RULE "documentation-philosophy-document-for-user" {
    PROMPT: "What is the user-centric approach to documentation?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Document for the user:** Write documentation with the reader in mind[cite: 192]. [cite_start]If you had a question and found the answer, add it to the documentation where you first looked[cite: 193]. [cite_start]This ensures the documentation answers real-world questions[cite: 193]."
}

RULE "documentation-philosophy-no-useless-documentation" {
    PROMPT: "What makes documentation 'good' versus 'useless'?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **No useless documentation:** If the documentation only restates the obvious from the code's name, it's not helpful[cite: 194]. [cite_start]Good documentation provides context and explains what isn't immediately apparent[cite: 195]."
}

RULE "documentation-philosophy-consistency" {
    PROMPT: "Why is consistency important in documentation?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Consistency is key:** Use consistent terminology throughout your documentation[cite: 196]."
}

RULE "documentation-style-doc-comments" {
    PROMPT: "What syntax should be used for doc comments?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Use `///` for doc comments:** This allows documentation generation tools to pick them up[cite: 197]."
}

RULE "documentation-style-summary" {
    PROMPT: "How should a doc comment start?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Start with a single-sentence summary:** The first sentence should be a concise, user-centric summary ending with a period[cite: 198]."
}

RULE "documentation-style-separate-summary" {
    PROMPT: "How should the summary sentence be formatted?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Separate the summary:** Add a blank line after the first sentence to create a separate paragraph[cite: 199]. [cite_start]This helps tools create better summaries[cite: 199]."
}

RULE "documentation-style-avoid-redundancy" {
    PROMPT: "What should be avoided in doc comments?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Avoid redundancy:** Don't repeat information that's obvious from the code's context, like the class name or signature[cite: 200]."
}

RULE "documentation-style-getter-setter" {
    PROMPT: "How should properties with both a getter and a setter be documented?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Don't document both getter and setter:** For properties with both, only document one[cite: 201]. [cite_start]The documentation tool will treat them as a single field[cite: 201]."
}

RULE "documentation-writing-style-brief" {
    PROMPT: "What is the guideline for brevity in writing?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Be brief:** Write concisely[cite: 202]."
}

RULE "documentation-writing-style-jargon" {
    PROMPT: "Should jargon and acronyms be used?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Avoid jargon and acronyms:** Don't use abbreviations unless they are widely understood[cite: 203]."
}

RULE "documentation-writing-style-markdown" {
    PROMPT: "How should Markdown be used in documentation?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Use Markdown sparingly:** Avoid excessive markdown and never use HTML for formatting[cite: 204]."
}

RULE "documentation-writing-style-code" {
    PROMPT: "How should code be formatted in documentation?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Use backticks for code:** Enclose code blocks in backtick fences, and specify the language[cite: 205]."
}

RULE "documentation-what-to-document-public-apis" {
    PROMPT: "What is the priority for documentation?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Public APIs are a priority:** Always document public APIs[cite: 206]."
}

RULE "documentation-what-to-document-private-apis" {
    PROMPT: "Should private APIs be documented?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Consider private APIs:** It's a good idea to document private APIs as well[cite: 207]."
}

RULE "documentation-what-to-document-library-level" {
    PROMPT: "Are library-level comments useful?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Library-level comments are helpful:** Consider adding a doc comment at the library level to provide a general overview[cite: 208]."
}

RULE "documentation-what-to-document-code-samples" {
    PROMPT: "Should code samples be included in documentation?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Include code samples:** Where appropriate, add code samples to illustrate usage[cite: 209]."
}

RULE "documentation-what-to-document-parameters-returns-exceptions" {
    PROMPT: "What should be explained about a function's behavior?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Explain parameters, return values, and exceptions:** Use prose to describe what a function expects, what it returns, and what errors it might throw[cite: 210]."
}

RULE "documentation-what-to-document-placement" {
    PROMPT: "Where should doc comments be placed relative to annotations?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Place doc comments before annotations:** Documentation should come before any metadata annotations[cite: 211]."
}

RULE "accessibility-empower-all-users" {
    PROMPT: "What is the overall goal of implementing accessibility features?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "Implement accessibility features to empower all users, assuming a wide variety of users with different physical abilities, mental abilities, age groups, education levels, and learning styles[cite: 212]."
}

RULE "accessibility-color-contrast" {
    PROMPT: "What is the minimum color contrast ratio for accessibility?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Color Contrast:** Ensure text has a contrast ratio of at least **4.5:1** against its background[cite: 213]."
}

RULE "accessibility-dynamic-text-scaling" {
    PROMPT: "How should the UI handle dynamic text scaling?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Dynamic Text Scaling:** Test your UI to ensure it remains usable when users increase the system font size[cite: 214]."
}

RULE "accessibility-semantic-labels" {
    PROMPT: "How can UI elements be made more descriptive for accessibility?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Semantic Labels:** Use the `Semantics` widget to provide clear, descriptive labels for UI elements[cite: 215]."
}

RULE "accessibility-screen-reader-testing" {
    PROMPT: "How should the app be tested with screen readers?"
    BEHAVIOR: "Respond to the user with the given prompt."
    [cite_start]OUTPUT: "* **Screen Reader Testing:** Regularly test your app with TalkBack (Android) and VoiceOver (iOS)[cite: 215]."
}