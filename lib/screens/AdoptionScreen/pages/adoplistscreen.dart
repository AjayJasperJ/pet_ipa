import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/AdoptionScreen/pages/adoptionemptyscreen.dart';
import 'package:pet_adoption_carmel/screens/AdoptionScreen/provider/adoptionprovider.dart';
import 'package:pet_adoption_carmel/screens/AdoptionScreen/widgets/orderwidget.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';

import 'package:provider/provider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class MyOrdersScreen extends StatefulWidget {
  static const routeName = 'all_orders_screen';
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<AdoptNowProvider>(context, listen: false)
        .getAllOrdersData(context: context, userid: userProvider.currentUserId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final order = Provider.of<AdoptNowProvider>(context);
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
          'My Adoptions',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.01),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'My Adoptions Nears You',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: order.loadingSpinner
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
                    : order.orders.isEmpty
                        ? const AdoptionEmptyScreen()
                        : SizedBox(
                            //height: size.height * 0.6,
                            child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: order.orders.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return AllOrdersWidget(
                                orderid: order.orders[index].orderId,
                                petid: order.orders[index].petId,
                                petname: order.orders[index].name,
                                image: order.orders[index].photo,
                                breed: order.orders[index].breed,
                                date: order.orders[index].date,
                                species: order.orders[index].species,
                                orderstatus: order.orders[index].orderStatus,
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
