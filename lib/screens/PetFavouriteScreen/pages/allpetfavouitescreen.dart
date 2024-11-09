import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/ExtraScreens/errorscreen.dart';
import 'package:pet_adoption_carmel/ExtraScreens/loadingscreen.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';

import 'package:provider/provider.dart';

class AllFavouritesScreen extends StatefulWidget {
  static const routeName = 'all_favourites_screen';

  const AllFavouritesScreen({
    super.key,
  });

  @override
  State<AllFavouritesScreen> createState() => _AllFavouritesScreenState();
}

class _AllFavouritesScreenState extends State<AllFavouritesScreen> {
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<FavouriteProvider>(context, listen: false).getAllFavouritesData(
        context: context, userId: userProvider.currentUserId);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final favourites = Provider.of<FavouriteProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Favourites',
                style: TextStyle(fontSize: 14),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        body: favourites.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : favourites.isError
                ? ErrorScreen(title: favourites.isError.toString())
                : favourites.favourites.isEmpty
                    ? const Text(
                        'No Products ',
                      )
                    : favourites.favourites.isEmpty
                        ? const Center(child: Text("No Products"))
                        : ListView.builder(
                            itemCount: favourites.favourites.length,
                            itemBuilder: (ctx, index) {
                              print(favourites.favourites.length.toString());
                              return null;
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
