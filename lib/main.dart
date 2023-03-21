import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/models/models.dart';
import 'package:disenos_app/src/pages/pages.dart';
import 'package:disenos_app/src/theme/theme.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(2)),
          ChangeNotifierProvider<LayoutModel>(create: (_) => LayoutModel()),
        ],
        child: const MyApp(),
      ),
    );

// void main() => runApp(
//       ChangeNotifierProvider(
//         create: (_) => ThemeChanger(2),
//         child: const MyApp(),
//       ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        },
      ),
    );
  }
}
