
import 'package:pet_adoption_carmel/screens/AdoptionScreen/provider/adoptionprovider.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/provider/categoryeachprovider.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:pet_adoption_carmel/screens/HealthRecordsScreen/provider/healthprovider.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/provider/petprovider.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/feedbackprovider.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';
import 'package:pet_adoption_carmel/screens/ViewEventScreen/provider/eventprovider.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => PetProvider()),
  ChangeNotifierProvider(create: (context) => FavouriteProvider()),
  ChangeNotifierProvider(create: (context)=>CategoryProvider()),
  ChangeNotifierProvider(create: (context)=>CategoryEachProvider()),
  ChangeNotifierProvider(create: (context)=>AdoptNowProvider()),
  ChangeNotifierProvider(create: (context)=>UserProvider()),
  ChangeNotifierProvider(create: (context)=>EventProvider()),
  ChangeNotifierProvider(create: (context)=>FeedbackProvider()),
  ChangeNotifierProvider(create: (context)=>HealthProvider()),
];
