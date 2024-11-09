import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/screens/AdoptionScreen/pages/adoplistscreen.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/categoryscreen.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/petcategoryscreen.dart';
import 'package:pet_adoption_carmel/screens/HealthRecordsScreen/pages/healthscreen.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/pages/petfavoutitescreen.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/pages/allpetscreen.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/pages/petdetailsscreen.dart';
import 'package:pet_adoption_carmel/screens/ViewEventScreen/pages/eventscreen.dart';
import 'package:pet_adoption_carmel/screens/ViewEventScreen/pages/peteventdetailsscreen.dart';

var customRoutes = <String, WidgetBuilder>{
  'all_pet_screen': (context) => const AllPetScreen(),
  'pets_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return PetDetailsScreen(
      id: id,
    );
  },
  'event_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return EventDetailsScreen(
      id: id,
    );
  },
  'all_orders_screen': (context) => const MyOrdersScreen(),
  'all_records_screen': (context) => const HealthScreen(),
  'all_favourites_screen': (context) => const PetFavouritePage(),
  'all_category_screen': (context) => const CategoryScreen(),
  'event_screen': (context) => const EventScreen(),
  'all_categoryproduct_screen': (context) {
    var data = ModalRoute.of(context)!.settings.arguments;
    if (data is String) {
      return PetCategoryScreen(cate: data);
    } else if (data is Map<String, dynamic>) {
      return PetCategoryScreen(cate: data['category_id']);
    } else {
      print('Unexpected argument type: ${data.runtimeType}');
      return const Scaffold(
        body: Center(
          child: Text(''),
        ),
      );
    }
  },
};
