import 'package:flutter/material.dart';

void main() => runApp(CountryTableApp());

class CountryTableApp extends StatelessWidget {
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
    {
      'name': 'Canada',
      'capital': 'Ottawa',
      'continent': 'North America',
      'population': '39M',
    },
    {
      'name': 'Japan',
      'capital': 'Tokyo',
      'continent': 'Asia',
      'population': '125M',
    },
    {
      'name': 'South Africa',
      'capital': 'Pretoria',
      'continent': 'Africa',
      'population': '60M',
    },
  ];

  CountryTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Table',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CountryTableScreen(countries: countries),
    );
  }
}

class CountryTableScreen extends StatelessWidget {
  final List<Map<String, String>> countries;

  const CountryTableScreen({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries Table')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Country')),
              DataColumn(label: Text('Capital')),
              DataColumn(label: Text('Continent')),
              DataColumn(label: Text('Population')),
              DataColumn(label: Text('Action')),
            ],
            rows: countries.map((country) {
              return DataRow(
                cells: [
                  DataCell(Text(country['name']!)),
                  DataCell(Text(country['capital']!)),
                  DataCell(Text(country['continent']!)),
                  DataCell(Text(country['population']!)),
                  DataCell(
                    ElevatedButton(
                      child: Text('View'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountryDetailScreen(
                              countryName: country['name']!,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
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
