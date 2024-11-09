import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/ExtraScreens/loadingscreen.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/categoryemptyscreen.dart';
import 'package:pet_adoption_carmel/screens/ViewEventScreen/provider/eventprovider.dart';
import 'package:pet_adoption_carmel/screens/ViewEventScreen/widgets/alleventwidgets.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
    static const routeName = 'event_screen';
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
     @override
  void initState() {
    Provider.of<EventProvider>(context, listen: false)
        .getAllEventsData(context: context);
   

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final event=Provider.of<EventProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:purpleColor,
        title: const Text('Events',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
    body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height*0.02),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child:  Text(' Pets Events Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: FadeInUp(
               duration:  const Duration(milliseconds: 1500),
              child: event.loadingSpinner
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const LoadingScreen(title: 'Loading'),
                                CircularProgressIndicator(
                                  color: purpleColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                             
                              ],
                            )
                          :event.events.isEmpty
                              ?const CategoryEmptyScreen()
                              : SizedBox(
                                //  height: size.height * 0.6,
                                  child: ListView.builder(
                                    
                                    scrollDirection: Axis.vertical,
                                    itemCount: event.events.length,
                                    itemBuilder: (context, intex) {
                                       return AllEventsWidget(
                             id:event.events[intex].id,
                             eventname: event.events[intex].eventName,
                             eventlocation: event.events[intex].eventLocation,
                             eventdate: event.events[intex].eventDate,
                             eventtime: event.events[intex].eventTime,
                             organizerName: event.events[intex].organizerName,
                             organizerPhone: event.events[intex].organizerPhone,
                             organizerEmail: event.events[intex].organizerEmail,
                             description: event.events[intex].description,
                             registrationDeadline: event.events[intex].registrationDeadline,
                           );
                                    },
                                  ),
                                ),
            ),
          ),
        ],
      ),     
   
    );
  }
}