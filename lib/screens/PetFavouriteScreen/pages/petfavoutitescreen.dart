import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/pages/favouriteemptyscreen.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/widgets/petfavwidget.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';

import 'package:provider/provider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class PetFavouritePage extends StatefulWidget {
  static const routeName = 'all_favourites_screen';
  const PetFavouritePage({super.key});

  @override
  State<PetFavouritePage> createState() => _PetFavouritePageState();
}

class _PetFavouritePageState extends State<PetFavouritePage> {
  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<FavouriteProvider>(context, listen: false).getAllFavouritesData(
        context: context, userId: userProvider.currentUserId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final favpet = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // ignore: prefer_const_constructors
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: purpleColor,
        title: const Text(
          'Favouitres',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: FadeInUp(
        duration: const Duration(milliseconds: 1500),
        child: favpet.loadingSpinner
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingScreen(title: 'Loading'),
                  CircularProgressIndicator(
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            : favpet.favourites.isEmpty
                ? const EmptyfavScreen()
                : SizedBox(
                    // height: size.height * 0.6,
                    child: GridView.builder(
                    itemCount: favpet.favourites.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.98,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return AllFavouriteWidget(
                        id: favpet.favourites[index].petid,
                        name: favpet.favourites[index].name,
                        image: favpet.favourites[index].photo,
                        breedname: favpet.favourites[index].breed,
                        favid: favpet.favourites[index].favid,
                      );
                    },
                  )),
      ),
    );
  }
}
