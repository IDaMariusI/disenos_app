import 'package:flutter/material.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PinterestGrid(),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  PinterestGrid({super.key});

  final List<int> items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) {
          return _PinterestItem(index: index);
        });
  }
}

class _PinterestItem extends StatelessWidget {
  const _PinterestItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}
