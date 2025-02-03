import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchPage'),
      ),
      body: TextFormField(
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Search...'),
      ),
    );
  }
}
