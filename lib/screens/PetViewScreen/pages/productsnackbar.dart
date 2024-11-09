  import 'package:flutter/material.dart';

import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';



class ProductSnackBar {
  productSnackbar({
    required BuildContext context,
  }) {
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/newdog1.png',height: 35,width: 35),
                const SizedBox(width: 20),
                const Text(
                  'Pet Already in Adoption List',
                  style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),
                ),
             
              ],
            ),
          
          ),
         
        ],
      ),
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
     
    );
  }

  generalSnackbar({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(text),
        ),
      ),

      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: purpleColor,  
      duration: const Duration(milliseconds:1500),
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   textColor: CustomColor.whitecolor,
      //   label: 'View cart',
      //   onPressed: () {},
      // ),
    ));
  }

  successsnackbar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(text),
        ),
      ),

      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: purpleColor,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'View cart',
        onPressed: () {},
      ),
    ));
  }
}
 