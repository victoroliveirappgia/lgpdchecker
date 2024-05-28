import 'package:easycomply/pages/dashboard.dart';
import 'package:easycomply/pages/checklist.dart';
import 'package:easycomply/pages/lgpd.dart';
import 'package:easycomply/pages/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int initialPageIndex;
  const HomePage({Key? key, required this.initialPageIndex}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    
    _currentIndex = widget.initialPageIndex;
    _pageController = PageController(initialPage: widget.initialPageIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _pageChangeHandler,
        children: [
          Dashboard(),
          Checklist(),
          LGPD(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/dashboard.png')),
            label: 'Dashboard',
            backgroundColor: Color(0xFF1A3F6D),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/checklist.png')),
            label: 'Checklist',
            backgroundColor: Color(0xFF1A3F6D),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/lgpd.png')),
            label: 'LGPD',
            backgroundColor: Color(0xFF1A3F6D),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/profile.png')),
            label: 'Profile',
            backgroundColor: Color(0xFF1A3F6D),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xff0887E3),
        onTap: (int index) => _goToPage(index),
      ),
    );
  }

  void _goToPage(int index) {
    setState(() {
      _currentIndex = index;
    });

    _pageController.jumpToPage(index);
  }

  void _pageChangeHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
