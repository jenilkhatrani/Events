import 'dart:convert';

import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  fetchWeather() async {
    String api =
        "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/ahmedabad?unitGroup=metric&key=VUSDSK54DV5RS5L52K2VNCRT8&contentType=json";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map? weather = jsonDecode(response.body);

      return weather;
    }
    return null;
  }
}
