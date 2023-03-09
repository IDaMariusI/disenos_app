import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  PinterestButton({required this.onPressed, required this.icon});

  final Function() onPressed;
  final IconData icon;
}

class PinterestMenu extends StatelessWidget {
  PinterestMenu({super.key});

  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print('Pie Chart');
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print('Icon Search');
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print('Notifications');
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('Supervised User Circle');
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: _PinterestMenuBackground(
          child: _MenuItems(menuItems: items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
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
        (index) => _PinterestMenuButton(index, menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  const _PinterestMenuButton(this.index, this.item);

  final int index;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<_MenuModel>(context).selectedIndex;

    double size;
    Color color;

    if (selectedItem == index) {
      size = 35.0;
      color = Colors.black;
    } else {
      size = 25.0;
      color = Colors.blueGrey;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedIndex = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
