import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:pet_adoption_carmel/screens/AdoptionScreen/models/adoptmodel.dart';

class AdoptNowProvider extends ChangeNotifier {
  String? userid;
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

  List<OrderModel> _orders = [];
  List<OrderModel> get orders {
    return [..._orders];
  }

  Future getAllOrdersData({BuildContext? context, String? userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_adoption_status.php?user_id=$userid"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_adoption_status.php?user_id=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _orders = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> orderDetails = extractedData['orders'];
        for (var i = 0; i < orderDetails.length; i++) {
          _orders.add(
            OrderModel(
              orderId: orderDetails[i]['order_id'].toString(),
              petId: orderDetails[i]['pet_id'].toString(),
              userId: orderDetails[i]['user_id'].toString(),
              age: orderDetails[i]['age'].toString(),
              name: orderDetails[i]['name'].toString(),
              date: orderDetails[i]['date'].toString(),
              color: orderDetails[i]['color'].toString(),
              dob: orderDetails[i]['dob'].toString(),
              addeddate: orderDetails[i]['addeddate'].toString(),
              sex: orderDetails[i]['sex'].toString(),
              species: orderDetails[i]['species'].toString(),
              diet: orderDetails[i]['diet'].toString(),
              behaviour: orderDetails[i]['learn quickly'].toString(),
              breed: orderDetails[i]['breed'].toString(),
              microchipid: orderDetails[i]['microchipid'].toString(),
              notes: orderDetails[i]['notes'].toString(),
              orderStatus: orderDetails[i]['order_status'].toString(),
              petStatus: orderDetails[i]['pet_status'].toString(),
              photo: orderDetails[i]['photo'].toString(),
              weight: orderDetails[i]['weight'].toString(),
            ),
          );
        }

        print('product details$_orders');
        _isLoading = false;
        print('products loading completed --->' 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product$e');
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }

  Future<void> addAdoptPet({String? petid, String? userid}) async {
    var body = {
      'petid': petid.toString(),
      'user_id': userid.toString(),
    };

    try {
      var response = await https.post(
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/PetAdoption/api/adopt_now.php?user_id=$userid&petid=$petid'),
          body: body);

      if (response.statusCode == 200) {
        // Request successful
        print('Added to cart successfully');
        print('Response: ${response.body}');
      } else {
        // Request failed with error code
        print('Failed to add to cart. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception thrown during request
      print('Failed to add to cart. Exception: $e');
    }
  }
}
