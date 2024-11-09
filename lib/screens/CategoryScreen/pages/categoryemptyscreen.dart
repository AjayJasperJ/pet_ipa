import 'package:flutter/material.dart';


class CategoryEmptyScreen extends StatefulWidget {
  const CategoryEmptyScreen({super.key});

  @override
  State<CategoryEmptyScreen> createState() => _CategoryEmptyScreenState();
}

class _CategoryEmptyScreenState extends State<CategoryEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         // const SizedBox(height: 60),
          Center(child: Image.asset('assets/ct.png',scale: 2)),
          const Center(child: Text('No Category Pets Available....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
        

        ],
      );
    

  }
}