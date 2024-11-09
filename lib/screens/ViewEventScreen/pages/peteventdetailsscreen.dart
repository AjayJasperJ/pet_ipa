import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/ViewEventScreen/provider/eventprovider.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatefulWidget {
  static const routeName = 'event_details_screen';
  final String id;
  const EventDetailsScreen({super.key, required this.id});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final event = Provider.of<EventProvider>(context, listen: false);
    final eventData = Provider.of<EventProvider>(context)
        .events
        .firstWhere((element) => element.id == widget.id);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarHeight: 70,
          backgroundColor: purpleColor,
          title: const Text(
            'Pet Event Details',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.grey[300],
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/events.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        title: Text(
                          'Pet Event Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: purpleColor),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Card(
                        // height
                        //: size.height*0.30,

                        // decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                        //        color:GreyColor,
                        //  ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Event Name  :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            eventData.eventName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Event date  :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            eventData.eventDate,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Event Time  :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            eventData.eventTime,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Registation Deadline  :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            eventData.registrationDeadline,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Description:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            eventData.description,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Column(
                        children: [
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Expanded(
                                              flex: 2,
                                              child: Text(
                                                'Organizer Name  :',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                eventData.organizerName,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Expanded(
                                              flex: 2,
                                              child: Text(
                                                'Organizer Email  :',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                eventData.organizerEmail,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Expanded(
                                              flex: 2,
                                              child: Text(
                                                'Organizer Phone  :',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                eventData.organizerPhone,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
