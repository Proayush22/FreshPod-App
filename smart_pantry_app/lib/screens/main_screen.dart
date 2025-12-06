import 'package:flutter/material.dart';
import 'package:smart_pantry_app/screens/grocery_list_screen.dart';
import 'package:smart_pantry_app/screens/home_screen.dart';
import 'package:smart_pantry_app/screens/my_containers_screen.dart';
import 'package:smart_pantry_app/screens/pantry_screen.dart';
import 'package:smart_pantry_app/widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const PantryScreen(),
    const GroceryListScreen(),
    const MyContainersScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
