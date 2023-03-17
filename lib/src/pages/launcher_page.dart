import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/theme/theme.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseño en Flutter'),
      ),
      body: _OptionsList(),
      drawer: _MainMenu(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pageRoutes.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: Colors.blue),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: Colors.blue),
        title: Text(pageRoutes[index].title),
        trailing: const Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoutes[index].page),
          );
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: 200,
                width: double.infinity,
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('MV', style: TextStyle(fontSize: 50)),
                ),
              ),
            ),
            Expanded(child: _OptionsList()),
            ListTile(
              leading: const Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: Colors.blue,
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading:
                    const Icon(Icons.add_to_home_screen, color: Colors.blue),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: Colors.blue,
                  value: appTheme.customTheme,
                  onChanged: (value) => appTheme.customTheme = value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
