import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/widgets.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary;

    return WavesHeader(color: accentColor);
  }
}
