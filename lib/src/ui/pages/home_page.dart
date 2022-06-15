import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/ui/views/account_view.dart';
import 'package:home_kitchen_user_app/src/ui/views/cart_view.dart';
import 'package:home_kitchen_user_app/src/ui/views/home_view.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

import '../../base/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map<String, Widget>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    _selectedPageIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    _pages = [
      {
        'page': HomeView(
          selectedPageIndex: _selectedPageIndex,
          callBack: (v) {
            _selectedPageIndex = v;
            setState(() {});
          },
        ),
      },
      {'page': const CartView()},
      {'page': const AccountView()},
    ];
    super.initState();
  }

  BottomNavigationBarItem _getBottomNavbarItem({required Widget widget}) {
    return BottomNavigationBarItem(
      icon: widget,
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        onTap: _selectPage,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.orange,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: const Color(0xFFD3CFCA),
        items: [
          _getBottomNavbarItem(
            widget: Padding(
              padding: const EdgeInsets.symmetric(vertical: .0),
              child: Image.asset(
                AppAssets.blackImage,
                width: 41,
                height: 36,
              ),
            ),
          ),
          _getBottomNavbarItem(
            widget: const Icon(Icons.shopping_cart_outlined),
          ),
          _getBottomNavbarItem(
            widget: const Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
