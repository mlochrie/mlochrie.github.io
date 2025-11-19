import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class DetailArguments {
  final bool flag;
  final String message;
  DetailArguments(this.flag, this.message);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passing Data using Named Routes',
      theme: ThemeData(primarySwatch: Colors.blue),

      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;
          return DetailScreen(
            flag: args.flag,
            message: args.message,
          );
        },
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: DetailArguments(true, "Hello from HomeScreen"),
            );
          },
          child: const Text("Next"),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final bool flag;
  final String message;

  const DetailScreen({
    super.key,
    required this.flag,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bool is: $flag"),
            Text("Message is: $message"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
