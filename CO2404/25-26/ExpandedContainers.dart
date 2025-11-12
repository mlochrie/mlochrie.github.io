import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetExpandedContainers());
}


class WidgetExpandedContainers extends StatelessWidget {
  const WidgetExpandedContainers({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("My APP Bar"), backgroundColor: Colors.red),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Container(color: Colors.blue)),
                    Expanded(child: Container(color: Colors.lightGreen)),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.fitWidth),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
