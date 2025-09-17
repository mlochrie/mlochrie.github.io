import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Map<String, String>> countries = [
    {
      'name': 'United Kingdom',
      'capital': 'London',
      'continent': 'Europe',
      'population': '67M',
    },
    {
      'name': 'France',
      'capital': 'Paris',
      'continent': 'Europe',
      'population': '65M',
    },
    {
      'name': 'Germany',
      'capital': 'Berlin',
      'continent': 'Europe',
      'population': '83M',
    },
    {
      'name': 'India',
      'capital': 'New Delhi',
      'continent': 'Asia',
      'population': '1.4B',
    },
    {
      'name': 'Brazil',
      'capital': 'Brasília',
      'continent': 'South America',
      'population': '214M',
    },
    {
      'name': 'Australia',
      'capital': 'Canberra',
      'continent': 'Oceania',
      'population': '26M',
    },
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Cards',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CountryCardScreen(countries: countries),
    );
  }
}

class CountryCardScreen extends StatelessWidget {
  final List<Map<String, String>> countries;

  const CountryCardScreen({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries')),
      body: ListView.builder(
        itemCount: countries.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final country = countries[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Icon(Icons.flag, size: 40),
              title: Text(
                country['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Capital: ${country['capital']}'),
                  Text('Continent: ${country['continent']}'),
                  Text('Population: ${country['population']}'),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CountryDetailScreen(countryName: country['name']!),
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
