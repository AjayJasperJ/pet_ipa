import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/BottomNavigationScreen/bottomnavigationscreen.dart';

class AdoptionEmptyScreen extends StatefulWidget {
  const AdoptionEmptyScreen({super.key});

  @override
  State<AdoptionEmptyScreen> createState() => _AdoptionEmptyScreenState();
}

class _AdoptionEmptyScreenState extends State<AdoptionEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        Center(child: Image.asset('assets/adopempty.png', scale: 2)),
        const Center(
          child: Text(
            'Your Adoption Pet List is Empty....!',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PetBottomNavigation()));
            },
            child: const Text(
              'Back Home',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
