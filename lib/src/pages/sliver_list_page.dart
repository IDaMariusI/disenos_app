import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _NewListButton(),
          ),
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            maxHeight: 200,
            minHeight: 170,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Title(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...items,
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight, maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => (minHeight < maxHeight) ? minHeight : maxHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return (maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child);
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: <Widget>[
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: const Color(0xffF7CDD5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                color: Color(0xffD93A30),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem(this.title, this.color);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class _NewListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xffED6762),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
      ),
    );

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {},
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
