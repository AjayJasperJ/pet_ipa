import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/ExtraScreens/errorscreen.dart';
import 'package:pet_adoption_carmel/ExtraScreens/loadingscreen.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/provider/petprovider.dart';

import 'package:provider/provider.dart';

class AllPetScreen extends StatefulWidget {
  static const routeName = 'all_pet_screen';

  const AllPetScreen({
    super.key,
  });

  @override
  State<AllPetScreen> createState() => _AllPetScreenState();
}

class _AllPetScreenState extends State<AllPetScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<PetProvider>(context, listen: false)
        .getAllPetsData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final pet = Provider.of<PetProvider>(context);
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
                'Category Products',
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
        body: pet.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : pet.isError
                ? ErrorScreen(title: pet.isError.toString())
                : pet.pets.isEmpty
                    ? const Text(
                        'No Products ',
                      )
                    : pet.pets.isEmpty
                        ? const Center(child: Text("No Pets"))
                        : ListView.builder(
                            itemCount: pet.pets.length,
                            itemBuilder: (ctx, index) {
                              print(pet.pets.length.toString());
                              return null;
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
