import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/widgets/widgets.dart';
import 'package:disenos_app/src/theme/theme.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (screenWidth > 500) {
      screenWidth = screenWidth - 301;
    }

    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Row(
          children: <Widget>[
            const Spacer(),
            PinterestMenu(
              show: show,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.colorScheme.secondary,
              items: <PinterestButton>[
                PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                PinterestButton(icon: Icons.search, onPressed: () {}),
                PinterestButton(icon: Icons.notifications, onPressed: () {}),
                PinterestButton(
                    icon: Icons.supervised_user_circle, onPressed: () {}),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController scrollController = ScrollController();
  double previusScroll = 0.0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > previusScroll &&
          scrollController.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      previusScroll = scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;

    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return MasonryGridView.count(
      controller: scrollController,
      crossAxisCount: count,
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

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
