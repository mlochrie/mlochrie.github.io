import 'package:flutter/material.dart';

void main() => runApp(CountryGridApp());

class CountryGridApp extends StatelessWidget {
  final List<String> countries = [
    'United Kingdom',
    'France',
    'Germany',
    'Italy',
    'Spain',
    'Canada',
    'United States',
    'Australia',
    'Japan',
    'India',
    'Brazil',
    'South Africa',
    'China',
    'Mexico',
    'Russia',
  ];

   CountryGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Grid',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CountryGridScreen(countries: countries),
    );
  }
}

class CountryGridScreen extends StatelessWidget {
  final List<String> countries;

  const CountryGridScreen({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: countries.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3, // Width to height ratio
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryDetailScreen(
                      countryName: countries[index],
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                child: Center(
                  child: Text(
                    countries[index],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
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
        child: Text(
          'Welcome to $countryName!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
