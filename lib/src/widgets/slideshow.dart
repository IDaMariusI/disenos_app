import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/models/models.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
  });

  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (dotsUp)
                _Dots(
                  totalSlides: slides.length,
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                ),
              Expanded(child: _Slides(slides: slides)),
              if (!dotsUp)
                _Dots(
                  totalSlides: slides.length,
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                ),
            ],
          ),
        ),
      ),
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
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
  const _Dots({
    required this.totalSlides,
    required this.primaryColor,
    required this.secondaryColor,
  });

  final int totalSlides;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides,
            (i) => _Dot(
                  i,
                  primaryColor,
                  secondaryColor,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(this.index, this.primaryColor, this.secondaryColor);

  final int index;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: ((pageViewIndex >= (index - 0.5)) &&
                (pageViewIndex < (index + 0.5)))
            ? primaryColor
            : secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
