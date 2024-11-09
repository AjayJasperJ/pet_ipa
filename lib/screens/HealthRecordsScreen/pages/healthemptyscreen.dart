import 'package:flutter/material.dart';

class HealthEmptyScreen extends StatefulWidget {
  const HealthEmptyScreen({super.key});

  @override
  State<HealthEmptyScreen> createState() => _HealthEmptyScreenState();
}

class _HealthEmptyScreenState extends State<HealthEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        Center(child: Image.asset('assets/hh.png', scale: 1)),
        const Text(
          'No Health Records....!',
          style: TextStyle(fontWeight: FontWeight.bold),
        )

        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(backgroundColor:purpleColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        //   onPressed: (){
        //     Navigator.push(context,MaterialPageRoute(builder: (context)=>const PetBottomNavigation()));
        //   }, child:Text('Go Back',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
      ],
    );
  }
}
