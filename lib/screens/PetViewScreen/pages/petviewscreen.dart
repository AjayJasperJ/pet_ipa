import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pet_adoption_carmel/ExtraScreens/loadingscreen.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/AdoptionScreen/pages/adoplistscreen.dart';

import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/categoryscreen.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/widgets/frontcategorywidget.dart';
import 'package:pet_adoption_carmel/screens/LoginScreen/loginscreen.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/pages/petfavoutitescreen.dart';

import 'package:pet_adoption_carmel/screens/PetViewScreen/provider/petprovider.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/widgets/petwidget.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/pages/profilescreen.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/pages/supportscreen.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';
import 'package:pet_adoption_carmel/screens/ViewEventScreen/pages/eventscreen.dart';

import 'package:provider/provider.dart';

class PetViewScreen extends StatefulWidget {
  const PetViewScreen({super.key});

  @override
  State<PetViewScreen> createState() => _PetViewScreenState();
}

class _PetViewScreenState extends State<PetViewScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<PetProvider>(context, listen: false)
        .getAllPetsData(context: context);

    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);

    Provider.of<UserProvider>(context, listen: false)
        .getUserData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pet = Provider.of<PetProvider>(context);
    final category = Provider.of<CategoryProvider>(context);

    final userprovider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: purpleColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pets Adoption ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 17),
            ),
            Consumer<UserProvider>(builder: (context, value, child) {
              String userAddress = "";
              for (var i = 0; i < value.users.length; i++) {
                userAddress = value.users[i].address;
                print('${userAddress}vvvvvvvvv');
              }
              return Text(
                '$userAddress , India',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w900),
              );
            }),
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyOrdersScreen()));
                  },
                  child: Image.asset('assets/newadoption.png',
                      height: 35, width: 35)))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: purpleColor),
              currentAccountPicture: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/newprofile.png'),
              ),
              accountName:
                  Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].firstname;
                  print('${userAddress}vvvvvvvvv');
                }
                return Text(
                  userAddress,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900),
                );
              }),
              accountEmail:
                  Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].email;
                  print('${userAddress}vvvvvvvvv');
                }
                return Text(
                  userAddress,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                );
              }),
            ),
            ListTile(
              leading: Icon(
                IconlyBold.home,
                color: purpleColor,
              ),
              title: const Text(
                'Dashboard',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PetViewScreen()));
              },
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.pets,
                  color: purpleColor,
                ),
                title: const Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PetFavouritePage()));
              },
              child: ListTile(
                leading: Icon(
                  IconlyBold.heart,
                  color: purpleColor,
                ),
                title: const Text(
                  'My Favourites',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EventScreen()));
              },
              child: ListTile(
                leading: Icon(
                  IconlyBold.paper,
                  color: purpleColor,
                ),
                title: const Text(
                  'Pet Events',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyOrdersScreen()));
              },
              child: ListTile(
                leading: Icon(
                  IconlyBold.shieldDone,
                  color: purpleColor,
                ),
                title: const Text(
                  'My Adoptions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SupportScreen()));
              },
              child: ListTile(
                leading: Icon(
                  IconlyBold.message,
                  color: purpleColor,
                ),
                title: const Text(
                  'Feedback',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                IconlyBold.profile,
                color: purpleColor,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(
                IconlyBold.logout,
                color: purpleColor,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Logout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content:
                          const Text('Are you sure want to exit this app?'),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: purpleColor),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: purpleColor),
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    // size: 17,
                  ),
                  hintText: "Search ",
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  if (value != "") {
                    String searchQuery = value.toLowerCase();
                    print("hhhhhhhhh");
                    pet.getSearchData(value: searchQuery);
                  }
                },
              ),
              SizedBox(height: size.height * 0.02),
              const Text(
                'Categories',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: category.loadingSpinner
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoadingScreen(title: 'Loading'),
                          CircularProgressIndicator(
                            color: purpleColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    : category.category.isEmpty
                        ? Center(
                            child: Text(
                            'No Categories...',
                            style: TextStyle(color: purpleColor),
                          ))
                        : SizedBox(
                            height: size.height * 0.07,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: category.category.length,
                              itemBuilder: (context, intex) {
                                return FrontCategoryWidegt(
                                  id: category.category[intex].id,
                                  image: category.category[intex].image,
                                );
                              },
                            ),
                          ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Text(
                'Popular Pets Nears You',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: pet.loadingSpinner
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoadingScreen(title: 'Loading'),
                          CircularProgressIndicator(
                            color: purpleColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    : pet.pets.isEmpty
                        ? Center(
                            child: Text(
                            'No Pets...',
                            style: TextStyle(color: purpleColor),
                          ))
                        : pet.searchProducts.isEmpty &&
                                searchController.text.isNotEmpty
                            ? Center(
                                child: Text(
                                  'No Pets Avilable',
                                  style: TextStyle(color: purpleColor),
                                ),
                              )
                            : searchController.text.isNotEmpty &&
                                    pet.searchProducts.isNotEmpty
                                ? SizedBox(
                                    height: size.height * 0.6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: pet.searchProducts.length,
                                      itemBuilder: (context, intex) {
                                        return AllPetWidget(
                                          petid:
                                              pet.searchProducts[intex].petid,
                                          name: pet.searchProducts[intex].name,
                                          age: pet.searchProducts[intex].age,
                                          breed:
                                              pet.searchProducts[intex].breed,
                                          petImage:
                                              pet.searchProducts[intex].photo,
                                          gender: pet.searchProducts[intex].sex,
                                          species:
                                              pet.searchProducts[intex].species,
                                        );
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    height: size.height * 0.6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: pet.pets.length,
                                      itemBuilder: (context, intex) {
                                        return AllPetWidget(
                                          petid: pet.pets[intex].petid,
                                          name: pet.pets[intex].name,
                                          age: pet.pets[intex].age,
                                          breed: pet.pets[intex].breed,
                                          petImage: pet.pets[intex].photo,
                                          gender: pet.pets[intex].sex,
                                          species: pet.pets[intex].species,
                                        );
                                      },
                                    ),
                                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
