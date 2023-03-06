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
        width: 250,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: -5,
            ),
          ],
        ),
        child: _MenuItems(menuItems: items),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({required this.menuItems});

  final List<PinterestButton> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) =>
              _PinterestMenuButton(index: index, item: menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  const _PinterestMenuButton({required this.index, required this.item});

  final int index;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {
    return Container(child: Icon(item.icon),);
  }
}
