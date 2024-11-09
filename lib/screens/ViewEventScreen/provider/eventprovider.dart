import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:pet_adoption_carmel/screens/ViewEventScreen/model/eventmodel.dart';

class EventProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<EventModel> _events = [];
  List<EventModel> get events {
    return [..._events];
  }

  Future getAllEventsData({BuildContext? context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_events.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_events.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _events = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> eventDetails = extractedData['events'];
        for (var i = 0; i < eventDetails.length; i++) {
          _events.add(
            EventModel(
              id: eventDetails[i]['id'].toString(),
              eventName: eventDetails[i]['eventName'].toString(),
              eventDate: eventDetails[i]['eventDate'].toString(),
              eventTime: eventDetails[i]['eventTime'].toString(),
              eventLocation: eventDetails[i]['eventLocation'].toString(),
              description: eventDetails[i]['description'].toString(),
              registrationDeadline:
                  eventDetails[i]['registrationDeadline'].toString(),
              organizerName: eventDetails[i]['organizerName'].toString(),
              organizerEmail: eventDetails[i]['organizerEmail'].toString(),
              organizerPhone: eventDetails[i]['organizerPhone'].toString(),
            ),
          );
        }

        print('favourites details$_events');
        _isLoading = false;
        print('Favourites loading completed --->' 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in fav prod -->>' + e.toString());
      print('Favourite Data is one by one loaded the favouite$e');
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}
