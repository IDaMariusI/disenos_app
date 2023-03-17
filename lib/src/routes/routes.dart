import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/pages/pages.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', const SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', const HeadersPage()),
  _Route(
    FontAwesomeIcons.peopleCarryBox,
    'Animated Square',
    const AnimationsPage(),
  ),
  _Route(
    FontAwesomeIcons.circleNotch,
    'Progress Bar',
    const CircleGraphsPage(),
  ),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
];

class _Route {
  _Route(this.icon, this.title, this.page);

  final IconData icon;
  final String title;
  final Widget page;
}
