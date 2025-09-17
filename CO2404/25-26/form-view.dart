import 'package:flutter/material.dart';

void main() => runApp(CountryFormApp());

class CountryFormApp extends StatelessWidget {
  const CountryFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CountryFormScreen(),
    );
  }
}

class CountryFormScreen extends StatefulWidget {
  const CountryFormScreen({super.key});

  @override
  CountryFormScreenState createState() => CountryFormScreenState();
}

class CountryFormScreenState extends State<CountryFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String countryName = '';
  String capital = '';
  String continent = '';
  String population = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CountryDetailScreen(countryName: countryName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Country')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Country Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a country name' : null,
                onSaved: (value) => countryName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Capital'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a capital' : null,
                onSaved: (value) => capital = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Continent'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a continent' : null,
                onSaved: (value) => continent = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Population'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter population' : null,
                onSaved: (value) => population = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _submitForm, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryDetailScreen extends StatelessWidget {
  final String countryName;

  const CountryDetailScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(countryName)),
      body: Center(
        child: Text('Welcome to $countryName!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
