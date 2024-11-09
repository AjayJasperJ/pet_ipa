import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/petcategoryscreen.dart';

class AllCategoryWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;

  const AllCategoryWidget(
      {super.key, required this.id, required this.name, required this.image});

  @override
  State<AllCategoryWidget> createState() => _AllCategoryWidgetState();
}

class _AllCategoryWidgetState extends State<AllCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(PetCategoryScreen.routeName, arguments: widget.id);
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ));
  }
}
