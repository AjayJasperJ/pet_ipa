import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:pet_adoption_carmel/screens/CategoryScreen/models/categoryeachmodel.dart';

class CategoryEachProvider extends ChangeNotifier {
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

  List<PetCategoryModel> _petcategory = [];
  List<PetCategoryModel> get petcategory {
    return [..._petcategory];
  }

  Future getAllPetCategoryData(
      {BuildContext? context, String? categoryId}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_pets_category.php?category_id=$categoryId"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_pets_category.php?category_id=$categoryId");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _petcategory = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> petCategoryDetails = extractedData['petDetails'];
        for (var i = 0; i < petCategoryDetails.length; i++) {
          _petcategory.add(
            PetCategoryModel(
              petid: petCategoryDetails[i]['petid'].toString(),
              name: petCategoryDetails[i]['name'].toString(),
              species: petCategoryDetails[i]['species'].toString(),
              breed: petCategoryDetails[i]['breed'].toString(),
              age: petCategoryDetails[i]['age'].toString(),
              sex: petCategoryDetails[i]['sex'].toString(),
              color: petCategoryDetails[i]['color'].toString(),
              aid: petCategoryDetails[i]['aid'].toString(),
              dob: petCategoryDetails[i]['dob'].toString(),
              diet: petCategoryDetails[i]['diet'].toString(),
              addeddate: petCategoryDetails[i]['addeddate'].toString(),
              behaviour: petCategoryDetails[i]['behaviour'].toString(),
              microchipid: petCategoryDetails[i]['microchipid'].toString(),
              notes: petCategoryDetails[i]['notes'].toString(),
              photo: petCategoryDetails[i]['photo'].toString(),
              status: petCategoryDetails[i]['status'].toString(),
              weight: petCategoryDetails[i]['weight'].toString(),
            ),
          );
        }

        print('category details$_petcategory');
        _isLoading = false;
        print('category loading completed --->' 'loading data');
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
