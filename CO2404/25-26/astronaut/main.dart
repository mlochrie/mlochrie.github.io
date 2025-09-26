import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'astros.dart';
import 'astronaut.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<List<AstronautModel>> _doGetAstronauts() async {
    http.Response response = await http.get(
      Uri.parse('http://api.open-notify.org/astros.json'),
    );
    return Astros.fromJson(jsonDecode(response.body)).people;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("FutureBuilder with async/await and Data Model"),
        ),
        body: Center(
          child: FutureBuilder<List<AstronautModel>>(
            future: _doGetAstronauts(),
            builder:
                (
                  BuildContext context,
                  AsyncSnapshot<List<AstronautModel>> snapshot,
                ) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView(
                      children: snapshot.data!
                          .map(
                            (a) => ListTile(
                              title: Text(a.name),
                              subtitle: Text(a.craft),
                            ),
                          )
                          .toList(),
                    );
                  }
                },
          ),
        ),
      ),
    );
  }
}
