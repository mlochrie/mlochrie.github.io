import 'package:flutter/material.dart';

void main() => runApp(CountryListApp());

class CountryListApp extends StatelessWidget {
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

  CountryListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Navigator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CountryListScreen(countries: countries),
    );
  }
}

class CountryListScreen extends StatelessWidget {
  final List<String> countries;

  const CountryListScreen({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Countries')),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(Icons.flag),
              title: Text(countries[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CountryDetailScreen(countryName: countries[index]),
                  ),
                );
              },
            ),
          );
        },
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
