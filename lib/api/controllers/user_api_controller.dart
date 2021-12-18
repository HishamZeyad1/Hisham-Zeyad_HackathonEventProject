import 'dart:convert';

import 'package:elancer_api/api/api_settings.dart';
import 'package:elancer_api/models/api_base_response.dart';
import 'package:elancer_api/models/category.dart';
import 'package:elancer_api/models/user.dart';
import 'package:http/http.dart' as http;

class UserApiController {
  Future<List<User>> getUsers() async {
    var url = Uri.parse(ApiSettings.users);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      ApiBaseResponse apiResponse = ApiBaseResponse.fromJson(jsonResponse);
      return apiResponse.list;
    } else {
      //SHOW MESSAGE
    }
    return [];
  }

  Future<List<Category>> getCategories() async {
    var url = Uri.parse(ApiSettings.categories);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['data'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
}
