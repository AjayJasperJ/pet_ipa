import 'package:flutter/material.dart';




class PetEmptyScreen extends StatefulWidget {
  const PetEmptyScreen({super.key});

  @override
  State<PetEmptyScreen> createState() => _PetEmptyScreenState();
}

class _PetEmptyScreenState extends State<PetEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Center(child: Image.asset('assets/pets.png',scale: 2)),
          const Center(child: Text('No Pets are Available....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
        
          SizedBox(height: size.height*0.01),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(backgroundColor:purpleColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          //   onPressed: (){
          //     Navigator.push(context,MaterialPageRoute(builder: (context)=>const PetBottomNavigation()));
          //   }, child:Text('Select Favourite',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))

        ],
      );
    

  }
}