import 'dart:convert';

import 'package:clima/utilities/constants.dart';
import 'package:http/http.dart';

class Network {
  Network(this.latitude, this.longitude);
  final double latitude;
  final double longitude;

  Future getData() async {
    Response response = await get(
        'https://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$weatherAPI&q=$latitude,$longitude');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
