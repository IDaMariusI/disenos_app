import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:disenos_app/src/widgets/widgets.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PinterestGrid(),
          _PinterestMenuLocation(),
        ],
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 30,
      child: Container(
        width: screenWidth,
        child: Align(
          child: PinterestMenu(),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  PinterestGrid({super.key});

  final List<int> items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (context, index) {
        return _PinterestItem(index: index);
      },
    );
  }
}

class _PinterestItem extends StatelessWidget {
  const _PinterestItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final double height = (index % 5 + 1) * 100;

    return Container(
      height: height,
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
