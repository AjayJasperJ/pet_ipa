import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/ViewEventScreen/pages/peteventdetailsscreen.dart';

class AllEventsWidget extends StatefulWidget {
  final String id;
  final String eventname;
  final String eventdate;
  final String eventtime;
  final String eventlocation;
  final String description;
  final String registrationDeadline;
  final String organizerName;
  final String organizerEmail;
  final String organizerPhone;

  const AllEventsWidget(
      {required this.id,
      required this.eventname,
      required this.eventdate,
      required this.eventtime,
      required this.eventlocation,
      required this.description,
      required this.registrationDeadline,
      required this.organizerName,
      required this.organizerEmail,
      required this.organizerPhone,
      super.key});

  @override
  State<AllEventsWidget> createState() => _AllEventsWidgetState();
}

class _AllEventsWidgetState extends State<AllEventsWidget> {
  File? file;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(EventDetailsScreen.routeName,
                  arguments: widget.id);
            },
            child: Card(
              color: Colors.grey[200],
              elevation: 7,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  side: BorderSide(color: Colors.green, width: 0)),
              margin: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/events.png',
                        width: 40,
                        height: 40,
                      ),
                    ),

                    // Image.asset(
                    //   payslipIcon,
                    //   width: 35,
                    //   height: 35
                    // ),
                    title: const Text(
                      'Pet Event',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Event Name : ${widget.eventname}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: purpleColor),
                    ),
                  ),
                  Container(
                    height: size.height * 0.05,
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.eventlocation,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          '(${widget.eventdate})'.substring(0, 12),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                            color: Colors.grey[200],
                            // height: size.height*0.03,
                            // width: size.width*0.20,
                            //  decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.grey) ,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                widget.organizerName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )),
                            )),
                        Card(
                            color: Colors.grey[200],
                            // height: size.height*0.03,
                            // width: size.width*0.20,
                            // decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.grey) ,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(widget.organizerEmail,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12))),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.03,
            width: size.width * 0.3,
            margin: EdgeInsets.only(right: size.width * 0.04),
            decoration: BoxDecoration(
                color: purpleColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  // bottomLeft: Radius.circular(10)
                )),
            child: Center(
              child: Text(
                widget.registrationDeadline,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
