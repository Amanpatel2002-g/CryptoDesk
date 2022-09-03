import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rest_seat_booking_app/models/json_model.dart';

class JSONController extends GetxController {

  Future<Jsonmodel> jsonToData() async {
    final String response = await rootBundle.loadString('assets/restaurant.json');
    return jsonmodelFromJson(response);
  }


}
