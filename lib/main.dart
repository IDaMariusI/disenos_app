import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/pages/pages.dart';
import 'package:disenos_app/src/theme/theme.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
    );
  }
}
