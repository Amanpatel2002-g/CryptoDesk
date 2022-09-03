import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_seat_booking_app/controllers/json_controller.dart';
import 'package:rest_seat_booking_app/models/json_model.dart';
import 'package:rest_seat_booking_app/views/pages/home_page.dart';

void main() {
  Get.put(JSONController());
  runApp(const MySeatBookingSystem());
}

class MySeatBookingSystem extends StatelessWidget {
  const MySeatBookingSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/homepage',
      getPages: [
        GetPage(name: '/homepage', page: () => HomePage()),
      ],
      home: const Scaffold(),
    );
  }
}
