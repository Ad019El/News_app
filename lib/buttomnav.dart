import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/models/news_old.dart';
import 'package:new_app/views/account_view.dart';
import 'package:new_app/views/favorite_view.dart';
import 'package:new_app/views/home/home_view.dart';
import 'package:new_app/views/search_view.dart';

class ButtomNav extends StatefulWidget {
  const ButtomNav({Key? key}) : super(key: key);

  @override
  _ButtomNavState createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  @override
  int _selectedIndex = 0;

  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavView = [
    HomeView(),
    SearchView(),
    FavoriteView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _bottomNavView.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: _navBarList
            .map(
              (e) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  e.icon,
                  width: 24.0,
                ),
                activeIcon: SvgPicture.asset(
                  e.activeIcon,
                  width: 24.0,
                ),
                title: Text(e.title),
              ),
            )
            .toList(),
      ),
    );
  }
}

class NavBarItem {
  final String icon;
  final String activeIcon;
  final String title;
  NavBarItem(
      {required this.icon, required this.activeIcon, required this.title});
}

List<NavBarItem> _navBarList = [
  NavBarItem(
    icon: "assets/home.svg",
    activeIcon: "assets/home_2.svg",
    title: "Home",
  ),
  NavBarItem(
    icon: "assets/search.svg",
    activeIcon: "assets/search_2.svg",
    title: "Search",
  ),
  NavBarItem(
    icon: "assets/favorite.svg",
    activeIcon: "assets/favorite_2.svg",
    title: "Favorite",
  ),
  NavBarItem(
    icon: "assets/account.svg",
    activeIcon: "assets/account_2.svg",
    title: "Account",
  ),
];
