import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/pages.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideshowPage();

  Widget get currentPage => _currentPage;
  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}
