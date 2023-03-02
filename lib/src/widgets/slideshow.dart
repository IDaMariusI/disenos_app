import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12.0,
    this.secondaryBullet = 12.0,
  });

  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor = primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor =
                  secondaryColor;

              Provider.of<_SlideshowModel>(context).primaryBullet =
                  primaryBullet;
              Provider.of<_SlideshowModel>(context).secondaryBullet =
                  secondaryBullet;

              return _CreateSlideshowStructure(dotsUp: dotsUp, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CreateSlideshowStructure extends StatelessWidget {
  const _CreateSlideshowStructure({
    required this.dotsUp,
    required this.slides,
  });

  final bool dotsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsUp) _Dots(totalSlides: slides.length),
        Expanded(child: _Slides(slides: slides)),
        if (!dotsUp) _Dots(totalSlides: slides.length),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({required this.slides});

  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.slide);

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.totalSlides});

  final int totalSlides;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);

    double size = 0.0;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      size = ssModel.primaryBullet;
      color = ssModel.primaryColor;
    } else {
      size = ssModel.secondaryBullet;
      color = ssModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  double _primaryBullet = 12.0;
  double _secondaryBullet = 12.0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;

  double get currentPage => _currentPage;
  set currentPage(double page) {
    _currentPage = page;
    notifyListeners();
  }

  double get primaryBullet => _primaryBullet;
  set primaryBullet(double size) {
    _primaryBullet = size;
    notifyListeners();
  }

  double get secondaryBullet => _secondaryBullet;
  set secondaryBullet(double size) {
    _secondaryBullet = size;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set primaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  Color get secondaryColor => _secondaryColor;
  set secondaryColor(Color color) {
    _secondaryColor = color;
    notifyListeners();
  }
}
