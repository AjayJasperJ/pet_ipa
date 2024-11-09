import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';

class AllOrdersWidget extends StatefulWidget {
  final String orderid;
  final String petid;
  final String petname;
  final String orderstatus;
  final String date;
  final String image;
  final String species;
  final String breed;

  const AllOrdersWidget(
      {super.key,
      required this.orderid,
      required this.petid,
      required this.petname,
      required this.orderstatus,
      required this.date,
      required this.image,
      required this.breed,
      required this.species});

  @override
  State<AllOrdersWidget> createState() => _AllOrdersWidgetState();
}

class _AllOrdersWidgetState extends State<AllOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.image), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.petname,
                      style: TextStyle(
                          color: purpleColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      widget.breed,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(widget.species),
                    SizedBox(height: size.height * 0.01),
                    Container(
                        height: 30,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.green[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          widget.orderstatus,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
