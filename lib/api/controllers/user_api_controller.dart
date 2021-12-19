import 'dart:convert';

import 'package:elancer_api/api/api_settings.dart';
import 'package:elancer_api/models/api_base_response.dart';
import 'package:elancer_api/models/category.dart';
import 'package:elancer_api/models/category_detials.dart';
// import 'package:elancer_api/models/category_detials.dart';
import 'package:elancer_api/models/user.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
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
    var response = await http.get(
      url,
      headers: {
        // HttpHeaders.authorizationHeader: SharedPrefController().token,
        // HttpHeaders.authorizationHeader: "Bearer ${SharedPrefController().token}",
        // HttpHeaders.acceptHeader: 'application/json',
        'Accept': 'application/json',
        'Authorization': '${SharedPrefController().token}',
        // 'lang': SharedPrefController().language
        // HttpHeaders.acceptLanguageHeader:SharedPrefController().language
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<CategoryDetials>> getCategoryDetials(int id) async {
    var url = Uri.parse(ApiSettings.categoriesdetials + id.toString());
    print("==========================");
    var response = await http.get(
      url,
      headers: {
        // HttpHeaders.authorizationHeader: SharedPrefController().token,
        // HttpHeaders.authorizationHeader: "Bearer ${SharedPrefController().token}",
        // HttpHeaders.acceptHeader: 'application/json',
        'Accept': 'application/json',
        'Authorization': '${SharedPrefController().token}',
        // 'lang': SharedPrefController().language
        // HttpHeaders.acceptLanguageHeader:SharedPrefController().language
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      var categoriesJsonArray1;
      categoriesJsonArray1 = jsonDecode(response.body)['list'] as List;
      print(categoriesJsonArray1.toString());
      // try{
      //   List<CategoryDetials> dd=categoriesJsonArray1
      //       .map((jsonObject) => CategoryDetials.fromJson(jsonObject))
      //       .toList().cast<CategoryDetials>();
      //   print(dd.length);
      // }catch(Exception){
      //   print("===================Error==========");
      //   print(Exception);
      // }

      return categoriesJsonArray1
          .map((jsonObject) => CategoryDetials.fromJson(jsonObject))
          .toList().cast<CategoryDetials>();
    }
    return [];
  }
}
