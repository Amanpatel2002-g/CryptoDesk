import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_seat_booking_app/views/constants.dart';

class SearchBarWidgetPage {
  static SearchBarWidget(final TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: const Text('Search'),
        suffixIcon: const Icon(Icons.search),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ConstantVariables.borderColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ConstantVariables.borderColor)
        )

      ),
    );
  }
}
