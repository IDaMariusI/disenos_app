import 'package:flutter/material.dart';

class PinterestButton {
  PinterestButton({required this.onPressed, required this.icon});

  final Function onPressed;
  final IconData icon;
}

class PinterestMenu extends StatelessWidget {
  PinterestMenu({super.key});

  final List<PinterestButton> items = [
    PinterestButton(
        onPressed: () {
          print('Pie Chart');
        },
        icon: Icons.pie_chart_outline),
    PinterestButton(
        onPressed: () {
          print('Icon Search');
        },
        icon: Icons.search_outlined),
    PinterestButton(
        onPressed: () {
          print('Notifications');
        },
        icon: Icons.notifications_outlined),
    PinterestButton(
        onPressed: () {
          print('Supervised User Circle');
        },
        icon: Icons.supervised_user_circle_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text('Hola mundo desde el menú'),
      ),
    );
  }
}
