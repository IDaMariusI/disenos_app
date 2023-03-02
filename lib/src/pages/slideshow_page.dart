import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:disenos_app/src/widgets/widgets.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Slideshow(
        dotsUp: false,
        primaryColor: const Color(0xffFF5A7E),
        secondaryColor: Colors.grey,
        primaryBullet: 20.0,
        secondaryBullet: 12.0,
        slides: <Widget>[
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}
