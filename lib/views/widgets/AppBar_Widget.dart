import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_seat_booking_app/views/constants.dart';

class AppBarWidgetPage {
  static dynamic appBarWidget(String titleString) {
    return AppBar(
      title: Text(
        titleString,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: ConstantVariables.appBarColor,
    );
  }
}
