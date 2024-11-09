import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/BottomNavigationScreen/bottomnavigationscreen.dart';


class AdoptionNowScreen extends StatefulWidget {
  const AdoptionNowScreen({super.key});

  @override
  State<AdoptionNowScreen> createState() => _AdoptionNowScreenState();
}

class _AdoptionNowScreenState extends State<AdoptionNowScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         // const SizedBox(height: 60),
          Center(child: Image.asset('assets/ty.png',scale: 1)),
          const Center(child: Text('Adopt a Pet Successfully....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          SizedBox(height: size.height*0.02),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: purpleColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            onPressed: (){
           Navigator.push(context,MaterialPageRoute(builder: (context)=>const PetBottomNavigation()));

            }, child: const Text('OK',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
        

        ],
      )
    ,
    );
     

  }
}