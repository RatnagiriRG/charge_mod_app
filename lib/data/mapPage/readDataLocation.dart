import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:technical_round_chargemod/data/mapPage/getLocationDetails.dart';

class fetch_locationData {
  late GetLocationModel getLocationModel;

  Future<GetLocationModel> ReadDataFromJson() async {
    try {
      final jsonData = await rootBundle
          .loadString("lib/data/mapPage/dummy_Locationdata.json");

      
      final Response = jsonDecode(jsonData);
      getLocationModel = GetLocationModel.fromJson(Response);
      print(Response);
    } catch (e) {
      throw Exception(e);
    }

    return getLocationModel;
  }
}
