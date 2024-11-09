import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/widgets/categorywidget.dart';

import 'package:provider/provider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = 'all_category_screen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final category = Provider.of<CategoryProvider>(context);
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
          'Category Pets',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Category Pets Nears You',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: category.loadingSpinner
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
                    : category.category.isEmpty
                        ? const Center(
                            child: Text(
                            'No Categoeies...',
                            style: TextStyle(color: Colors.green),
                          ))
                        : SizedBox(
                            //height: size.height * 0.6,
                            child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: category.category.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // childAspectRatio: 0.98,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              return AllCategoryWidget(
                                id: category.category[index].id,
                                name: category.category[index].name,
                                image: category.category[index].image,
                              );
                            },
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
