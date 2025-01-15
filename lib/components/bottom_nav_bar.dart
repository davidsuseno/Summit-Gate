import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          color: Colors.white,
          activeColor: Colors.white,
          tabActiveBorder:
              Border.all(color: Color.fromARGB(255, 0, 49, 128)),
          tabBackgroundColor: Color.fromARGB(255, 9, 2, 35),
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 8,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(icon: Icons.home_rounded, text: 'Home'),
            GButton(icon: Icons.shopping_bag_rounded, text: 'Cart'),
          ]),
    );
  }
}
