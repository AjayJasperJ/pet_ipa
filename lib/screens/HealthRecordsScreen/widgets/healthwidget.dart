import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';

class HealthWidget extends StatefulWidget {
  final String id;
  final String name;
  final String helath;
  final String image;
  final String breed;
  final String vaccine;
  final String dateofvaccine;
  final String medicine;
  final String allergies;
  final String mediacalhistory;
  final String doctorname;
  final String doctorphone;
  const HealthWidget(
      {super.key,
      required this.helath,
      required this.id,
      required this.name,
      required this.image,
      required this.breed,
      required this.vaccine,
      required this.dateofvaccine,
      required this.mediacalhistory,
      required this.allergies,
      required this.doctorname,
      required this.doctorphone,
      required this.medicine});

  @override
  State<HealthWidget> createState() => _HealthWidgetState();
}

class _HealthWidgetState extends State<HealthWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  widget.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  widget.breed,
                  style: TextStyle(
                      color: purpleColor, fontWeight: FontWeight.w400),
                ),
                leading: Image.network(widget.image),
              ),
            ),
          ),
          Card(
            color: purpleColor,

            //     height: size.height*0.14,

            //     decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(15),

            //  ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                'Vaccine  :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                widget.vaccine,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                'Date of Vaccine  :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                widget.dateofvaccine,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                'Medicine  :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                widget.medicine,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                'Allergies  :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                widget.allergies,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                'Medical History  :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                widget.mediacalhistory,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                'Doctor Name  :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                widget.doctorname,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                'Doctor Phone  :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                widget.doctorphone,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
