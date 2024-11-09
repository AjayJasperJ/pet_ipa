import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:pet_adoption_carmel/screens/HealthRecordsScreen/model/pethealthmodel.dart';

class HealthProvider extends ChangeNotifier {
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

  List<HealthRecordModel> _records = [];
  List<HealthRecordModel> get records {
    return [..._records];
  }

  Future getAllHealthRecordData({BuildContext? context, String? petId}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_health_reports.php?pet_id=$petId"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_health_reports.php?pet_id=$petId");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _records = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> healthDetails = extractedData['petDetails'];
        for (var i = 0; i < healthDetails.length; i++) {
          _records.add(
            HealthRecordModel(
              petid: healthDetails[i]['petid'].toString(),
              name: healthDetails[i]['name'].toString(),
              species: healthDetails[i]['species'].toString(),
              breed: healthDetails[i]['breed'].toString(),
              age: healthDetails[i]['age'].toString(),
              sex: healthDetails[i]['sex'].toString(),
              color: healthDetails[i]['color'].toString(),
              weight: healthDetails[i]['weight'].toString(),
              dob: healthDetails[i]['dob'].toString(),
              microchipid: healthDetails[i]['microchipid'].toString(),
              diet: healthDetails[i]['diet'].toString(),
              behaviour: healthDetails[i]['behaviour'].toString(),
              status: healthDetails[i]['status'].toString(),
              photo: healthDetails[i]['photo'].toString(),
              addeddate: healthDetails[i]['addeddate'].toString(),
              allergies: healthDetails[i]['allergies'].toString(),
              caringTips: healthDetails[i]['caring_tips'].toString(),
              dateOfVaccine: healthDetails[i]['date_of_vaccine'].toString(),
              doctorName: healthDetails[i]['doctor_name'].toString(),
              doctorPhone: healthDetails[i]['doctor_phone'].toString(),
              medicalHistory: healthDetails[i]['medical_history'].toString(),
              medicine: healthDetails[i]['medicine'].toString(),
              vaccine: healthDetails[i]['vaccine'].toString(),
            ),
          );
        }

        print('favourites details$_records');
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
