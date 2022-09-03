import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_seat_booking_app/controllers/json_controller.dart';
import 'package:rest_seat_booking_app/views/constants.dart';
import 'package:rest_seat_booking_app/views/widgets/AppBar_Widget.dart';
import 'package:rest_seat_booking_app/views/widgets/searchBar_Widget.dart';

import '../../models/json_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JSONController jsonController = Get.find();

  Jsonmodel? obj;
  bool isloaded = false;
  void getdata() async {
    obj = await jsonController.jsonToData();
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBarWidgetPage.appBarWidget("This is the titleString"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SearchBarWidgetPage.SearchBarWidget(_controller),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height - 50,
                  child: isloaded
                      ? ListView.builder(
                          itemCount: obj == null ? 14 : obj!.restarants.length,
                          itemBuilder: ((context, index) {
                            if (obj != null) {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: ConstantVariables.tileColour,
                                  child: ListTile(
                                    title: Text(obj!.restarants[index].name),
                                    subtitle:
                                        Text(obj!.restarants[index].typeOfFood),
                                    trailing: Text(
                                      obj!.restarants[index].rating.toString(),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const Text("no widget found");
                            }
                          }),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                )
              ],
            ),
          )),
    );
  }
}
