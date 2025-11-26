import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: "Test",
      home: Week6Activity(),
    );
  }
}

class Week6Activity extends StatelessWidget {
  const Week6Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My View"),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text("top container"),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.purple,
                    child: Center(child: Text("left container")),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: const Center(
                      child: Text("right container"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text("bottom container"),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
