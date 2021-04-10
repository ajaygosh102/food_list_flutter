import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'file:///C:/AndroidProjects/TestTemp/flutter_app_mock/lib/config/server_addresses.dart';

class ApiServices {
  ///FoodList
  Future<Response> getFoodList({Map<String, String> params}) async {
    try {
      var response = await http
          .get(Uri.https(ServerAddresses.authority, ServerAddresses.foodList));
      print('Food list response------------$response');
      return response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
