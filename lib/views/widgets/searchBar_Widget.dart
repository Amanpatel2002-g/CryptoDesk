import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_seat_booking_app/views/constants.dart';

class SearchBarWidgetPage {
  static SearchBarWidget(List<String> restList) {
    return Autocomplete<String>(optionsBuilder: ((textEditingValue) {
      if (textEditingValue.text.isEmpty) {
        return const Iterable<String>.empty();
      } else {
        return restList.where((word) =>
            word.toLowerCase().contains(textEditingValue.text.toLowerCase()));
      }
    }
    ),
    fieldViewBuilder: ((context, controller, focusNode, onFieldSubmitted) {
      return TextField(
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onFieldSubmitted,
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
    }),);
  }
}
