import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/HealthRecordsScreen/pages/healthemptyscreen.dart';
import 'package:pet_adoption_carmel/screens/HealthRecordsScreen/provider/healthprovider.dart';
import 'package:pet_adoption_carmel/screens/HealthRecordsScreen/widgets/healthwidget.dart';
import 'package:provider/provider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class HealthScreen extends StatefulWidget {
  static const routeName = 'all_records_screen';
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  void initState() {
    Provider.of<HealthProvider>(context, listen: false)
        .getAllHealthRecordData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final health = Provider.of<HealthProvider>(context);
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
          'Health Records',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: FadeInUp(
        duration: const Duration(milliseconds: 1500),
        child: health.loadingSpinner
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
            : health.records.isEmpty
                ? const HealthEmptyScreen()
                : SizedBox(
                    // height: size.height * 0.6,
                    child: ListView.builder(
                    itemCount: health.records.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return HealthWidget(
                        id: health.records[index].petid,
                        name: health.records[index].name,
                        image: health.records[index].photo,
                        helath: health.records[index].doctorName,
                        allergies: health.records[index].allergies,
                        vaccine: health.records[index].vaccine,
                        dateofvaccine: health.records[index].dateOfVaccine,
                        medicine: health.records[index].medicine,
                        mediacalhistory: health.records[index].medicalHistory,
                        doctorname: health.records[index].doctorName,
                        doctorphone: health.records[index].doctorPhone,
                        breed: health.records[index].breed,
                      );
                    },
                  )),
      ),
    );
  }
}
