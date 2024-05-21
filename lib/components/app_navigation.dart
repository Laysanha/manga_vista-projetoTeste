import 'package:flutter/material.dart';
import '../pages/page_category.dart';
import '../pages/page_home.dart';
import '../pages/page_library.dart';
import 'custom_app_bar.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const PageHome(),
    const PageLibraly(),
    const PageCategory(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(showButtons: true),
        //backgroundColor: const Color.fromARGB(254, 254, 254, 254),
        body: IndexedStack(
          index: _currentPageIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: _onTapped,
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                activeIcon: Icon(Icons.book),
                label: 'Biblioteca'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                activeIcon: Icon(Icons.grid_view_sharp),
                label: 'Categorize'
            ),
          ],
        )
    );
  }
}

