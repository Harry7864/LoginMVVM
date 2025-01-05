import 'package:flutter/material.dart';

import '../models/country_model.dart';

class CountryDetailView extends StatelessWidget {
  final Country country;

  const CountryDetailView({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(country.flagUrl, width: 200),
            const SizedBox(height: 20),
            Text("Country: ${country.name}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Currency: ${country.currency}",
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
