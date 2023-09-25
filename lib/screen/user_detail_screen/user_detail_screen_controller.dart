import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_list_app/model/user_detail_model.dart';
import 'package:sample_list_app/utils/app_utils.dart';

class UserDetailScreenController extends GetxController with StateMixin {
  int id = Get.arguments;
  Map<String, dynamic>? userData;
  bool isLoading = false;

  @override
  void onInit() async {
    await getUserListData(id);
    super.onInit();
  }

  Future getUserListData(int userId) async {
    change(isLoading = true);
    try {
      final response =
          await http.get(Uri.parse("https://reqres.in/api/users/$userId"));
      if (response.statusCode == 200) {
        var userDetail = jsonDecode(response.body);
         userData = userDetail['data'];
      } else {
        AppUtils.errorSnackbar(
            response.statusCode.toString(), response.body, true);
      }
      change(isLoading = false);
    } catch (e) {
      AppUtils.errorSnackbar("", e.toString(), true);
    }
    change(isLoading = false);
  }
}
