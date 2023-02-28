import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/circle_graphs_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: CircleGraphsPage(),
    );
  }
}
