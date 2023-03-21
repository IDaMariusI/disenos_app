import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/widgets.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = <Widget>[
      const Expanded(child: MySlideshow()),
      const Expanded(child: MySlideshow()),
    ];

    return Scaffold(
      backgroundColor: Colors.purple,
      body: (isLarge) ? Column(children: children) : Row(children: children),
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    const Color color = Color(0xffFF5A7E);

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Slideshow(
      dotsUp: false,
      primaryColor: (appTheme.darkTheme) ? accentColor : color,
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
    );
  }
}
