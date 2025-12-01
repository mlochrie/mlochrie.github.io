import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'product.dart';
import 'product_card.dart';
import 'product_list.dart';

//needed for Flutter 2.5+
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      title: 'Nested JSON List App',
      home: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final String response = await rootBundle.loadString('data.json');
      final List<dynamic> data = json.decode(response);

      setState(() {
        _products = data.map((item) => Product.fromJson(item)).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bakery Items')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _products.isEmpty
          ? const Center(child: Text('No items found.'))
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductList(data: product),
                    if (product.choices != null && product.choices!.isNotEmpty)
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.choices!.length,
                          itemBuilder: (context, choiceIndex) {
                            final productChoices =
                                product.choices![choiceIndex];
                            return ProductChoiceCard(data: productChoices);
                          },
                        ),
                      ),
                    const Divider(),
                  ],
                );
              },
            ),
    );
  }
}
