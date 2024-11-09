import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/pages/editprofilescreen.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/pages/supportscreen.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/pages/termsandconditionsscreen.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
   void initState() {
    Provider.of<UserProvider>(context,listen: false).getUserData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: purpleColor,
        title: const Text('Profile',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
         Container(height: 200,width: double.infinity,decoration: BoxDecoration(color: purpleColor,borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
          const Stack(
  children: [
    CircleAvatar(
      backgroundColor: Color(0xff00A3FF),
      backgroundImage: AssetImage("assets/newprofile.png"),
      radius: 60.0,
    ),
    // Positioned(
    //   right: 5,
    //   bottom: 0,
    //   child: Container(
    //     child: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 20,),
    //     padding: EdgeInsets.all(7.5),
    //     decoration: BoxDecoration(
    //       border: Border.all(
    //       width: 1,
    //       color: Colors.white
    //     ),
    //     borderRadius: BorderRadius.circular(90.0),
    //     color: Colors.grey[200]
    //     )
    //   )
    // )
  ]
),
          Consumer<UserProvider>(builder: (context, value, child) {
                String userName = "";
                for (var i = 0; i < value.users.length; i++) {
                  userName = value.users[i].firstname;
                }
                return Text(
                  userName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                );
              }),
           
         ],
       ),
         ),
         const SizedBox(height: 30,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
               
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Email',style: TextStyle(fontWeight: FontWeight.w900),),
                     Consumer<UserProvider>(builder: (context, value, child) {
                String userName = "";
                for (var i = 0; i < value.users.length; i++) {
                  userName = value.users[i].email;
                }
                return Text(
                  userName,
                  style: const TextStyle(
                      color: Colors.black,
                      
                      fontWeight: FontWeight.bold),
                );
              }),
                    ],
                  ),
                   const SizedBox(height: 20),
                
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Date of Birth',style: TextStyle(fontWeight: FontWeight.w900)),
                      Consumer<UserProvider>(builder: (context, value, child) {
                String userName = "";
                for (var i = 0; i < value.users.length; i++) {
                  userName = value.users[i].dob;
                }
                return Text(
                  userName,
                  style: const TextStyle(
                      color: Colors.black,
                      
                      fontWeight: FontWeight.bold),
                );
              }),
                    ],
                  ),
                    const SizedBox(height: 20),
                
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Gender',style: TextStyle(fontWeight: FontWeight.w900)),
                      Consumer<UserProvider>(builder: (context, value, child) {
                String userName = "";
                for (var i = 0; i < value.users.length; i++) {
                  userName = value.users[i].gender;
                }
                return Text(
                  userName,
                  style: const TextStyle(
                      color: Colors.black,
                      
                      fontWeight: FontWeight.bold),
                );
              }),
                    ],
                  ),
                    const SizedBox(height: 20),
               
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Phone',style: TextStyle(fontWeight: FontWeight.w900)),
                      Consumer<UserProvider>(builder: (context, value, child) {
                String userName = "";
                for (var i = 0; i < value.users.length; i++) {
                  userName = value.users[i].phone;
                }
                return Text(
                  userName,
                  style: const TextStyle(
                      color: Colors.black,
                      
                      fontWeight: FontWeight.bold),
                );
              }),
                    ],
                  )
                ],
                
              ),
            ),
           ),
          
         ),
         const SizedBox(height: 20),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>const ProfileEditScreen()));
            },
             child: const Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Row(
                 
                  children: [
                    Icon(IconlyLight.profile,color: Colors.red,),
                    SizedBox(width: 20),
                    Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.w900),)
                  ],
                ),
              ),
             ),
           ),
         ),
            const SizedBox(height: 10),
          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: InkWell
           (
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>const SupportScreen()));
            },
             child: const Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Row(
                 
                  children: [
                    Icon(IconlyLight.bookmark,color: Colors.blue,),
                    SizedBox(width: 20),
                    Text('Support',style: TextStyle(fontWeight: FontWeight.w900),)
                  ],
                ),
              ),
             ),
           ),
         ),
            const SizedBox(height: 10),
          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>const TermsandConditions()));
            },
             child: const Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Row(
                 
                  children: [
                    Icon(IconlyLight.shieldDone,color: Colors.green),
                    SizedBox(width: 20),
                    Text('Terms & Conditions',style: TextStyle(fontWeight: FontWeight.w900),)
                  ],
                ),
              ),
             ),
           ),
         )
        ],
      ),
    );
  }
}