import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/categoryscreen.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/pages/petfavoutitescreen.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/pages/petviewscreen.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/pages/profilescreen.dart';

class PetBottomNavigation extends StatefulWidget {
  const PetBottomNavigation({super.key});

  @override
  State<PetBottomNavigation> createState() => _PetBottomNavigationState();
}

class _PetBottomNavigationState extends State<PetBottomNavigation> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const PetViewScreen(),
    const CategoryScreen(),
    const PetFavouritePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: GNav(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w300, color: Colors.white),
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: purpleColor,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.pets_outlined,
                  text: 'Category',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Favourites',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
