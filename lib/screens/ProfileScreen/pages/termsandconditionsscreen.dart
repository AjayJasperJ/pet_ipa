import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';


class TermsandConditions extends StatefulWidget {
  const TermsandConditions({super.key});

  @override
  State<TermsandConditions> createState() => _TermsandConditionsState();
}

class _TermsandConditionsState extends State<TermsandConditions> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: purpleColor,
        title: const Text('Terms & Conditions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1 . Adoption Fee :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
              const Text('Only local farmers, producers, artisans, and vendors who meet the markets criteria may participate.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
              SizedBox(height: size.height*0.02),
                const Text('2 . Application Approvaly :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Specify that adoption is subject to approval of an adoption application. Explain the process and criteria for approval.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
               SizedBox(height: size.height*0.02),
              const Text('3 .Animal Welfare Commitment :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                const Text('Ensure the adopter agrees to provide proper care, including food, water, shelter, veterinary care, and socialization.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height*0.02),
                 const Text('4 .Prohibition of Breeding :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Include a clause prohibiting the breeding of the adopted pet unless otherwise agreed upon by the adoption agency.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                    SizedBox(height: size.height*0.02),
                 const Text('5 .Return Policy :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Outline the procedure for returning the pet if the adoption doesnt work out, including any timeframe for returns and potential fees.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                     SizedBox(height: size.height*0.02),
                 const Text('6 .Microchipping and Identification :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Require the adopter to ensure the pet is microchipped and registered with accurate contact information.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height*0.02),
                 const Text('7 Education and Resources :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Provide educational materials and resources to help the adopter care for their new pet properly.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
               SizedBox(height: size.height*0.02),
                 const Text('8 .Termination of Adoption:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Outline circumstances under which the adoption agreement may be terminated by either party.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
            
            ]
            ,
          ),
        ),
      ),
    );
  }
}