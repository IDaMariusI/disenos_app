import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Title(),
    );
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
            Container(
              child: const Text(
                'List',
                style: TextStyle(
                  color: Color(0xffD93A30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ThingsList extends StatelessWidget {
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
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
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
