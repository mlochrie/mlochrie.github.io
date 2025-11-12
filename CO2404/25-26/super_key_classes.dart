import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Super Parameter Example')),
        body: const Column(
          children: [
            WelcomeCard(
              title: 'Hello, CO2404 Welcome',
              color: Colors.teal,
              icon: Icons.star,
            ),
            BaseCard(title: "Hello Co2404 Base", color: Colors.green)
          ],
        ),
      ),
    );
  }
}

class BaseCard extends StatelessWidget {
  final String title;
  final Color color;

  const BaseCard({
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class WelcomeCard extends BaseCard {
  final IconData icon;

  // - `super.title`, `super.color`, `super.key` → forwarded to BaseCard
  // - `required this.icon` → new parameter for this subclass
  const WelcomeCard({
    required super.title,
    required super.color,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // You can reuse BaseCard's build logic + add your own
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(width: 12),
        super.build(context), // optional: reuse the base build method
      ],
    );
  }
}
