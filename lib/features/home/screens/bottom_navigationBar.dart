import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shop_up/common_widgets/AppIcons.dart';
import 'package:shop_up/features/home/screens/home_screen.dart';
import 'package:shop_up/utils/colors.dart';

import '../../cart/screens/cart_screen.dart';
import '../../orders/screens/order_screen.dart';
import '../../profile/screens/profile_screen.dart';

class BottomNavigationbar extends StatefulWidget {
   BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: pages[_selectedIndex],



      bottomNavigationBar: SalomonBottomBar(

        unselectedItemColor: Appcolors.white_color.withOpacity(0.5),
        selectedItemColor: Appcolors.white_color,
        backgroundColor: Appcolors.primary_color,

        currentIndex: _selectedIndex,
        onTap: (position){
          setState(() {
            _selectedIndex = position;
          });
        },
        items: [
          SalomonBottomBarItem(

              title: const Text('Home'),
              icon: const Icon(AppIcons.home)
          ),
          SalomonBottomBarItem(

              title: const Text('Cart'),
              icon: const Icon(AppIcons.cart)
          ),
          SalomonBottomBarItem(

              title: const Text('Order'),
              icon: const Icon(AppIcons.order)
          ),
          SalomonBottomBarItem(

              title: const Text('Profile'),
              icon: const Icon(Icons.person)
          ),
        ],
      ),



    );
  }
}
