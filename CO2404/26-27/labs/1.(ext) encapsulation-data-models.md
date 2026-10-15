<img  align="right" src="https://github.com/UCLanCSC/CSResources/blob/main/images/general/logo.png?raw=true" style="zoom:50%" />

# CO2404: Cross Platform Development

# Lab: Encapsulation and Data Models in Dart

> **Remember:** Labs often follow on from the lectures. If you are stuck, review your lecture notes, slides or recordings, as important information is introduced throughout the module.
>

---

# Summary

By completing this lab, you should now be able to:

- Explain what encapsulation is and why it matters.
- Declare private variables in Dart using the underscore (`_`) prefix.
- Explain that Dart privacy applies to the *library* (file), not the class.
- Organise a Flutter project by placing data models in separate class files.
- Import a class from another file using a package import.
- Protect private variables using getters, setters and validation.
- Create read-only properties and computed properties.
- Prevent private collections from being modified from outside a class.
- Use a data model class to supply data to a simple Flutter user interface.

These concepts form the foundation for the data models you will use in later topics such as state management, APIs, databases and Firebase integration.

---

# Aim

The lab aims to:

1. Understand why object data should be protected.
2. Discover how Dart enforces privacy between files.
3. Practise structuring a Flutter project into separate model files.
4. Control access to private data using getters and setters.
5. Build a small data model that can be reused by a Flutter application.

---

# Intended Learning Outcome

This lab intends to contribute towards achieving ILOs 1 and 4 Develop a cross-platform application for mobile using a modern development environment, and critically evaluate solutions to problems relating to cross-platform mobile applications.

---

# Introduction

In the previous lab you created classes and used getters and setters to protect a private variable. In every example, however, the class and the code using it were written in the same file.

In real Flutter applications, classes are almost always kept in their own files. Data model classes in particular (for example `Student`, `Product` or `Order`) are shared by many screens, so it is important that their data cannot be changed in unexpected ways.

Dart handles privacy differently from languages such as Java or C#. In this lab you will investigate exactly how Dart privacy works, and then use it to build a well-structured data model.

The lab is structured so that each activity builds upon the previous one. By the end of the session you will have created a small, encapsulated data model split across multiple files and displayed it in a Flutter application.

---

# Activities

This lab is constructed to give you practical experience of private variables, separate class files and data models in Dart and Flutter.

---

# 1. Lab Overview

In this lab you will create one Flutter project and progressively build a data model for a university module.

By the end of the lab you will have:

- Created a project with a `models` folder.
- Seen how private variables behave inside a single file.
- Moved a class into its own file and imported it.
- Protected data using getters, setters and validation.
- Created read-only and computed properties.
- Protected a private list from outside modification.
- Displayed model data in a Flutter `ListView`.

---

# 2. Learning Outcomes

By completing this lab, you should be able to:

1. Explain the purpose of encapsulation.
2. Create private variables using `_`.
3. Explain the difference between class-level and library-level privacy.
4. Organise data models into separate files.
5. Import classes from other files in a Flutter project.
6. Validate data using setters and constructors.
7. Protect private collections from being modified externally.

---

# 3. Before You Start

You should have:

- Flutter installed and configured.
- Visual Studio Code or Android Studio.
- Flutter extension installed.
- Android emulator, iOS simulator or physical device.
- Completed the previous lab (Dart OOP) or be comfortable with classes, constructors, getters and setters.

> **Tip:** If Flutter is not working before you start, ask your tutor for assistance before progressing further.

---

# Activity 1 – Project Setup

## 1.1 Create the Project

Create a Flutter project called:

```text
student_model_lab
```

Organise your work using the recommended module structure:

```text
CO2404/
└── Labs/
    └── Week 2/
        └── student_model_lab/
```

---

## 1.2 Create the Models Folder

Inside the `lib` folder, create a new folder called `models`.

Your project should now contain:

```text
student_model_lab/
└── lib/
    ├── main.dart
    └── models/
```

> **Note:** Splitting code into folders such as `models`, `screens` and `widgets` is a common convention in Flutter projects. It keeps your code easy to navigate as the application grows.

---

## 1.3 Prepare main.dart

Remove the contents of `lib/main.dart` and replace them with:

```dart
void main() {
  print("Student model lab");
}
```

Run the program to confirm everything is working.

### Checkpoint

Before continuing ensure:

- The `lib/models` folder exists.
- The program runs and prints the message.

---

# Activity 2 – Private Variables in a Single File

In Dart, a variable or method is made private by starting its name with an underscore (`_`).

Replace the contents of `lib/main.dart` with:

```dart
class Student {

  double _mark;

  Student(this._mark);

}

void main() {

  Student student1 = Student(65);

  student1._mark = -999;

  print(student1._mark);

}
```

Run the program.

---

## Observe

- Does the program compile?
- Was `_mark` really private?
- Was the invalid mark accepted?

> **Important:** In Dart, privacy is applied at the **library** level, not the class level. In most projects, one `.dart` file is one library. Everything in the same file can see the underscore members of every other class in that file.

### Questions

1. What does the `_` prefix do in Dart?
2. Why was `_mark` accessible from `main()`?
3. Why is this a problem for protecting data?

---

# Activity 3 – Moving the Class to Its Own File

## 3.1 Create the Model File

Create a new file:

```text
lib/models/student.dart
```

Move the `Student` class from `main.dart` into this file:

```dart
class Student {

  double _mark;

  Student(this._mark);

}
```

---

## 3.2 Import the Class

Update `lib/main.dart`:

```dart
import 'package:student_model_lab/models/student.dart';

void main() {

  Student student1 = Student(65);

  student1._mark = -999;

  print(student1._mark);

}
```

> **Note:** `student_model_lab` is the `name` field at the top of your `pubspec.yaml`. If you chose a different project name, use that name in the import.

Run the program and read the error message carefully.

---

## 3.3 Fix the Error

Remove the two lines that access `_mark` directly so that `main()` only creates the object:

```dart
import 'package:student_model_lab/models/student.dart';

void main() {

  Student student1 = Student(65);

  print(student1);

}
```

Run the program again.

---

## Questions

1. What error did Dart report when you accessed `_mark`?
2. Why does the same code now fail when the class is in a separate file?
3. Why is `print(student1)` not very useful? (Look at the output.)
4. Why is it good practice to keep each model class in its own file?

---

# Activity 4 – Providing Access with Getters

The `Student` object now protects its data, but nothing outside the class can read the mark either. A **getter** allows controlled, read-only access.

Update `lib/models/student.dart`:

```dart
class Student {

  final String _studentId;
  String _name;
  double _mark;

  Student(this._studentId, this._name, this._mark);

  String get studentId => _studentId;

  String get name => _name;

  double get mark => _mark;

}
```

Update `main.dart`:

```dart
import 'package:student_model_lab/models/student.dart';

void main() {

  Student student1 = Student("G1234567890", "Mark", 78);

  print(student1.studentId);
  print(student1.name);
  print(student1.mark);

}
```

Run the program.

---

## Experiment

Try each of the following in `main()` and record what happens:

```dart
student1.name = "Bob";
student1.studentId = "S9999";
```

### Questions

1. Why can you read `student1.name` but not change it?

1. Why is `_studentId` declared as `final`?

1. Why should a student ID be read-only once an object has been created?
2. What is the difference between a getter and a normal public variable?

---

# Activity 5 – Controlling Changes with Setters

Some values need to change, but only in valid ways. A **setter** lets you validate data before it is stored.

Add the following setters to the `Student` class:

```dart
set name(String value) {

  if (value.trim().isEmpty) {
    throw ArgumentError("Name cannot be empty");
  }

  _name = value.trim();

}

set mark(double value) {

  if (value < 0 || value > 100) {
    throw ArgumentError("Mark must be between 0 and 100");
  }

  _mark = value;

}
```

---

## Test the Setters

Update `main.dart`:

```dart
import 'package:student_model_lab/models/student.dart';

void main() {

  Student student1 = Student("G1234567890", "Mark", 78);

  student1.mark = 85;
  print(student1.mark);

  try {
    student1.mark = 150;
  } catch (e) {
    print("Error: $e");
  }

  try {
    student1.name = "   ";
  } catch (e) {
    print("Error: $e");
  }

  print(student1.name);
  print(student1.mark);

}
```

Run the program.

---

## Questions

1. What happens when an invalid mark is assigned?
2. Why is it better to throw an error than to silently ignore invalid data?
3. What is the purpose of the `try` / `catch` block?
4. What would happen to the rest of your application if invalid marks were stored?

---

# Activity 6 – Validating in the Constructor

At the moment, the setters are protected but the constructor is not. This line is still accepted:

```dart
Student student2 = Student("S1002", "Ben", 500);
```

Test this in `main()` and confirm that the invalid mark is stored.

---

## Fix the Constructor

Dart allows you to run code in an **initialiser list** before the constructor body. Update the `Student` class:

```dart
class Student {

  final String _studentId;
  String _name;
  double _mark;

  Student(this._studentId, this._name, double mark)
      : _mark = _checkMark(mark);

  static double _checkMark(double value) {

    if (value < 0 || value > 100) {
      throw ArgumentError("Mark must be between 0 and 100");
    }

    return value;

  }

  String get studentId => _studentId;

  String get name => _name;

  double get mark => _mark;

  set name(String value) {

    if (value.trim().isEmpty) {
      throw ArgumentError("Name cannot be empty");
    }

    _name = value.trim();

  }

  set mark(double value) {
    _mark = _checkMark(value);
  }

}
```

Notice that the setter now reuses `_checkMark()` so the validation rule is written only once.

Run your tests again, including the invalid constructor call from earlier.

---

## Things to remember

1. Why was `mark` changed from `this._mark` to a normal parameter in the constructor? `this._mark` assigns the value straight into the variable with no chance to check it. A normal parameter lets the initialiser list pass the value through `_checkMark()` first and then assign the validated result to `_mark`.

2. Why is `_checkMark()` a private `static` method?

- *Private*: it is an internal helper, not part of the public interface of `Student`.
- *Static*: initialiser lists run before the object is fully constructed, so `this` is not available and instance methods cannot be called. A static method does not need an instance.

3. Why is it useful that the constructor and setter share the same validation? The rule is written once (a single source of truth). The two can never drift apart, there is less duplicated code, and bugs only need fixing in one place.

4. What would happen if you needed to change the rule to `0–120`? How many places would you need to edit? One: the `_checkMark()` method. Both the constructor and the setter would pick up the new rule automatically.

---

# Activity 7 – Computed Properties

A getter does not have to return a stored variable. It can calculate a value from the private data.

Add the following getters to the `Student` class:

```dart
String get grade {

  if (_mark >= 70) return "First";
  if (_mark >= 60) return "Upper Second (2:1)";
  if (_mark >= 50) return "Lower Second (2:2)";
  if (_mark >= 40) return "Third";

  return "Fail";

}

bool get hasPassed => _mark >= 40;
```

Test in `main()`:

```dart
Student student1 = Student("S1001", "Alice", 78);

print("${student1.name}: ${student1.grade}");
print("Passed: ${student1.hasPassed}");

student1.mark = 35;

print("${student1.name}: ${student1.grade}");
print("Passed: ${student1.hasPassed}");
```

---

## Extension

Add a `toString()` method so that `print(student1)` produces useful output:

```dart
@override
String toString() => "$_studentId - $_name ($_mark)";
```

Run `print(student1);` again and compare it with the output from Activity 3.

### Questions

1. Why is `grade` not stored in its own variable?
2. What could go wrong if `grade` was a stored variable?
3. How do computed properties help keep data consistent?
4. Why is `hasPassed` a getter rather than a method?

---

# Activity 8 – A Second Model with a Private List

Models often contain collections of other models. Create a new file:

```text
lib/models/module.dart
```

Add:

```dart
import 'student.dart';

class Module {

  final String _code;
  final String _title;
  final List<Student> _students = [];

  Module(this._code, this._title);

  String get code => _code;

  String get title => _title;

  List<Student> get students => _students;

  void addStudent(Student student) {
    _students.add(student);
  }

  double get averageMark {

    if (_students.isEmpty) return 0;

    double total = 0;

    for (Student student in _students) {
      total += student.mark;
    }

    return total / _students.length;

  }

}
```

> **Note:** `module.dart` imports `student.dart` using a **relative** import because both files are in the same folder. `main.dart` uses a **package** import because it is in a different folder. Both styles work, but you should be consistent within a project.

---

## Test the Module

Update `main.dart`:

```dart
import 'package:student_model_lab/models/module.dart';
import 'package:student_model_lab/models/student.dart';

void main() {

  Module module = Module("CO2404", "Cross Platform Development");

  module.addStudent(Student("G1234567890", "Mark", 78));
  module.addStudent(Student("G0987654321", "Bob", 41));
  module.addStudent(Student("G5678901234", "Chloe", 55));

  print("${module.code}: ${module.title}");
  print("Students: ${module.students.length}");
  print("Average: ${module.averageMark}");

}
```

Run the program.

---

## Find the Problem

The list `_students` is private, but the `students` getter returns the list itself. Add the following to `main()` and run it:

```dart
module.students.clear();

print("Students: ${module.students.length}");
```

### Things to consider

1. What happened to the students in the module? They were all removed. The module now contains no students.

2. Why did the private `_students` variable not protect the list? Privacy protects the *variable name*, not the *object* it refers to. The getter returned a reference to the same list, so outside code could call `clear()`, `add()` and `remove()` on it directly.

3. Which method should be used to add students to the module? `addStudent()`.

4. Why might this cause bugs in a large application? Any part of the application could change the list, bypassing the rules in the `Module` class. Bugs would be hard to trace because there is no single place where the list changes, and the data could end up in an unexpected or invalid state.

---

# Activity 9 – Protecting the Private List

Return a read-only view of the list instead of the list itself.

Replace the `students` getter in `module.dart` with:

```dart
List<Student> get students => List.unmodifiable(_students);
```

Run the program again, including the `module.students.clear()` line.

> **Tip:** `List.unmodifiable()` creates a read-only copy. Code outside the class can still loop over the students, but changes must go through `addStudent()`.

---

## Add a Remove Method

Add a method that removes a student by ID:

```dart
void removeStudent(String studentId) {
  _students.removeWhere((s) => s.studentId == studentId);
}
```

Test it:

```dart
module.removeStudent("S1002");
print("Students: ${module.students.length}");
```

### Questions

1. What happens now when `module.students.clear()` is called? Remove the clear() method and continue.
2. Why is it useful that all changes go through `addStudent()` and `removeStudent()`?
3. Where could you add validation (for example, preventing duplicate student IDs)?

### Things to consider

How does this protect the integrity of the data? The module's data can only change in valid ways, through methods that the class controls and checks.

> [!NOTE]
>
> `List.unmodifiable()` makes a copy of the list structure each time the getter is called. This is fine for this lab. Also note that the `Student` objects inside are still shared, but their setters validate input, so they are still protected.

---

# Activity 10 – Displaying the Model in Flutter

Now use your data model in a Flutter user interface. 

> [!TIP]
>
> This might be the first time you are seeing Flutter UI code. This will be covered further in the module. The importance of this right now, is for you to be able to view what you have just learnt in this lab activity.

Replace the contents of `lib/main.dart` with:

```dart
import 'package:flutter/material.dart';
import 'package:student_model_lab/models/module.dart';
import 'package:student_model_lab/models/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Module module = Module("CO2404", "Cross Platform Development");

    module.addStudent(Student("G1234567890", "Mark", 78));
  	module.addStudent(Student("G0987654321", "Bob", 41));
  	module.addStudent(Student("G5678901234", "Chloe", 55));
    module.addStudent(Student("G5678956478", "Dave", 61));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("${module.code}: ${module.title}"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Average mark: ${module.averageMark.toStringAsFixed(1)}",
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: module.students.length,
                itemBuilder: (context, index) {

                  Student student = module.students[index];

                  return ListTile(
                    title: Text(student.name),
                    subtitle: Text("${student.studentId} - ${student.grade}"),
                    trailing: Text(student.mark.toString()),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

Run the application. You should see a list of students with their ID, grade and mark.

### Checkpoint

Before continuing ensure:

- The application launches without errors.
- All four students are displayed.
- The average mark is shown at the top of the screen.
- No code in `main.dart` accesses a variable beginning with `_`.

### Things to consider

1. The user interface uses the public getters `name`, `studentId`, `grade` and `mark` on `Student`, and `code`, `title`, `students` and `averageMark` on `Module`.
2. What would you need to change if the `Student` class stored the mark as a `String` internally? Only the `Student` class. For example, the getter could convert the value (`double get mark => double.parse(_mark);`). As long as the getter still returns a `double`, the user interface would not need to change.
3. Why is it helpful that the user interface knows nothing about how `Student` stores its data? The two parts are loosely coupled. The internal implementation can be changed, fixed or improved without breaking any screens, which makes the application easier to maintain and extend.

---

# Activity 11 – Building Your Own Model

Create a new data model of your own choosing, in its own file within `lib/models/`.

Suggested ideas:

- `Product` (name, price, stock level)
- `BankAccount` (account number, balance)
- `Book` (title, author, ISBN, copies available)
- `Task` (title, due date, completed)

---

## Requirements

Your model must:

- Be in a separate file inside `lib/models/`.
- Have at least three private variables.
- Have at least one `final` private variable exposed through a getter only.
- Have at least one setter containing validation.
- Validate data in the constructor.
- Have at least one computed property.
- Be created and used from `main.dart` without accessing any private variable.

Display at least one object from your model in the Flutter application.

---

# Extension Challenges

## Challenge 1 – Protected Business Rules

Create a `BankAccount` model with a private `_balance`. Do not provide a setter. Instead, provide `deposit(double amount)` and `withdraw(double amount)` methods that reject invalid amounts and prevent the balance from going below zero.

This is safer because with a public variable, any code could set the balance to any value, including a negative number, without a deposit or withdrawal ever happening. With no setter, the balance can only change through methods that enforce the business rules (positive amounts, no overdrafts). The rules live in one place, and the balance cannot be corrupted from outside.

---

## Challenge 2 – Converting to and from a Map

Add the following to the `Student` class:

```dart
Map<String, dynamic> toMap() {
  return {
    "studentId": _studentId,
    "name": _name,
    "mark": _mark,
  };
}

factory Student.fromMap(Map<String, dynamic> map) {
  return Student(
    map["studentId"],
    map["name"],
    map["mark"],
  );
}
```

Create a student, convert it to a map, then create a second student from that map. Research why models often need these methods when working with APIs and databases such as Firebase.

> [!NOTE]
>
> APIs return data as JSON and databases such as Firebase Firestore store data as maps/documents, not as Dart objects. `toMap()` converts a model into a form that can be sent or stored, and `fromMap()` rebuilds a model from received data. This keeps the conversion logic inside the model, so the rest of the application works with proper typed objects.

> [!CAUTION]
>
> **Common gotcha:** JSON numbers like `78` are decoded as `int`, not `double`, so passing `map["mark"]` straight into a `double` parameter can cause a runtime type error. A safer version is:
>
> ```dart
> factory Student.fromMap(Map<String, dynamic> map) {
>   return Student(
>     map["studentId"] as String,
>     map["name"] as String,
>     (map["mark"] as num).toDouble(),
>   );
> }
> ```

---

## Challenge 3 – Immutable Models

Make the `Student` class immutable by removing all setters and making every variable `final`. Add a `copyWith()` method that returns a new `Student` with selected values changed:

```dart
Student student2 = student1.copyWith(mark: 90);
```

**When might an immutable model be preferable?**

- The object is shared by many parts of the app, so nobody can change it unexpectedly.
- State management in Flutter often detects change by comparing old and new objects; creating a new object makes changes easy to detect and triggers UI rebuilds correctly.
- It is easier to reason about and test, and safer when working with asynchronous code.

**When might setters be preferable?** For objects that change very frequently and where creating a new object each time would be wasteful or awkward.

---

## Challenge 4 – Duplicate Protection

Update `Module.addStudent()` so that a student with an existing ID cannot be added twice. Decide whether the method should throw an error or return a `bool`, and justify your choice.

> [!NOTE]
>
> Throws an error
>
> ```dart
> void addStudent(Student student) {
>   if (_students.any((s) => s.studentId == student.studentId)) {
>     throw ArgumentError("Student ${student.studentId} is already in this module");
>   }
>   _students.add(student);
> }
> ```
>
> *Throw* when a duplicate means a programming mistake that should never be ignored.
>
> Returns a bool
>
> ```dart
> bool addStudent(Student student) {
>   if (_students.any((s) => s.studentId == student.studentId)) {
>     return false;
>   }
>   _students.add(student);
>   return true;
> }
> ```
>
> Return `bool`* when duplicates are an expected situation (for example, a user entering an ID in a form) and the caller wants to handle it gracefully, such as showing a message, without exception handling.

---

# Reflection

1. What does the `_` prefix do in Dart? Makes a variable, method or class private to its library (file).

2. Why is Dart privacy described as "library-level"? Because privacy is enforced at the boundary of a library (usually a single `.dart` file), not at the boundary of a class. Everything in the same file can see each other's private members.

3. Why are data models usually kept in separate files? It gives real privacy between the model and the code that uses it, makes models reusable across screens, and keeps the project organised, maintainable and testable.

4. What is the purpose of a getter? To give controlled, read-only access to a value, which may be stored or calculated, without exposing the underlying variable.

5. What is the purpose of a setter? To allow a value to be changed in a controlled way, validating the new value before storing it.

6. Why should validation be placed inside the model class? So the rules are enforced everywhere the model is used, in one place, and cannot be bypassed or forgotten by code elsewhere in the application.

7. What is a computed property? A getter that calculates its value from other data in the object (such as `grade` from `_mark`) rather than storing it, so it is always consistent.

8. Why can returning a private list from a getter still be unsafe? The getter returns a reference to the same list, so outside code can modify it directly. The variable is private but the object it points to is not protected. Returning `List.unmodifiable(_list)` fixes this.

9. What is encapsulation? Bundling data with the methods that work on it, and hiding the internal details so that the data can only be accessed or changed through a controlled public interface.

10. How does encapsulation help when several screens use the same data model? All screens use the same public interface and the same validation rules, so data stays consistent. The model's internals can change without breaking any screen, and one screen cannot accidentally corrupt data that another relies on.

---
