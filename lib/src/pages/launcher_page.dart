import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      itemCount: 20,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: Colors.blue),
      itemBuilder: (context, index) => ListTile(
        leading: const FaIcon(FontAwesomeIcons.slideshare, color: Colors.blue),
        title: const Text('Hola Mundo'),
        trailing: const Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {},
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                value: false,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_to_home_screen, color: Colors.blue),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: Colors.blue,
                value: false,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
