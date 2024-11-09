import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/Helpers/providers.dart';
import 'package:pet_adoption_carmel/Helpers/routes.dart';
import 'package:pet_adoption_carmel/screens/Splashscreen/splashscreen.dart';


import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:multiprovider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pet Adoption Center',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor:purpleColor),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        routes: customRoutes
          
          
      ),
    );
  }
}
