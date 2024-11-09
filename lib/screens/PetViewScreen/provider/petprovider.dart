import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;
import 'package:pet_adoption_carmel/screens/PetViewScreen/models/petmodel.dart';

class PetProvider with ChangeNotifier {
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

  List<PetModel> _pets = [];
  List<PetModel> get pets {
    return [..._pets];
  }

  List<PetModel> _searchProducts = [];
  List<PetModel> get searchProducts {
    return [..._searchProducts];
  }

  List<PetModel> _filteredProducts = [];
  List<PetModel> get filteredProducts {
    return [..._filteredProducts];
  }

  Future getAllPetsData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption/api/viewallpets.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption/api/viewallpets.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pets = [];
        _filteredProducts = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> petDetails = extractedData['petDetails'];
        for (var i = 0; i < petDetails.length; i++) {
          _pets.add(
            PetModel(
              petid: petDetails[i]['petid'].toString(),
              name: petDetails[i]['name'].toString(),
              age: petDetails[i]['age'].toString(),
              aid: petDetails[i]['aid'].toString(),
              breed: petDetails[i]['breed'].toString(),
              color: petDetails[i]['color'].toString(),
              dob: petDetails[i]['dob'].toString(),
              addeddate: petDetails[i]['addeddate'].toString(),
              behaviour: petDetails[i]['behaviour'].toString(),
              diet: petDetails[i]['diet'].toString(),
              microchipid: petDetails[i]['microchipid'].toString(),
              notes: petDetails[i]['notes'].toString(),
              photo: petDetails[i]['photo'].toString(),
              sex: petDetails[i]['sex'].toString(),
              species: petDetails[i]['species'].toString(),
              status: petDetails[i]['status'].toString(),
              weight: petDetails[i]['weight'].toString(),
            ),
          );
        }

        print('pet details$_pets');
        _isLoading = false;
        print('cateogory products loading completed --->' 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Pet Data is one by one loaded the pet$e');
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }

  Future<void> getSearchData({dynamic value}) async {
    _isLoading = true;
    var response = await https.get(
      Uri.parse(
          "http://campus.sicsglobal.co.in/Project/PetAdoption/api/search_pet.php?keyword=$value"),
    );

    print(
        "http://campus.sicsglobal.co.in/Project/PetAdoption/api/search_pet.php?keyword=$value");

    if (response.statusCode == 200) {
      var responseBody = response.body;

      print(responseBody);

      _searchProducts = [];

      var extractedData = json.decode(response.body);
      //  print(json.decode(response.body) + 'printed extrated data');
      final List<dynamic> petDetails = extractedData['petDetails'];
      for (var i = 0; i < petDetails.length; i++) {
        _searchProducts.add(
          PetModel(
            petid: petDetails[i]['petid'].toString(),
            name: petDetails[i]['name'].toString(),
            age: petDetails[i]['age'].toString(),
            aid: petDetails[i]['aid'].toString(),
            breed: petDetails[i]['breed'].toString(),
            color: petDetails[i]['color'].toString(),
            dob: petDetails[i]['dob'].toString(),
            addeddate: petDetails[i]['addeddate'].toString(),
            behaviour: petDetails[i]['behaviour'].toString(),
            diet: petDetails[i]['diet'].toString(),
            microchipid: petDetails[i]['microchipid'].toString(),
            notes: petDetails[i]['notes'].toString(),
            photo: petDetails[i]['photo'].toString(),
            sex: petDetails[i]['sex'].toString(),
            species: petDetails[i]['species'].toString(),
            status: petDetails[i]['status'].toString(),
            weight: petDetails[i]['weight'].toString(),
          ),
        );
      }

      print('product details search$_searchProducts');
      print('products loading completed --->' 'loading data');
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }

    _isLoading = false;
    notifyListeners();
  }
}
