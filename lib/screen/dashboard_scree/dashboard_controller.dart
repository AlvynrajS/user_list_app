import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_list_app/model/user_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:sample_list_app/utils/app_utils.dart';

class DashBoardScreenController extends GetxController with StateMixin {
  List<Data>? userList;
  final int valuesPerPage = 6;
  int currentPage = 0;
  int totalPage = 0;
  final PageController pageController = PageController();
  bool isLoading = false;

  @override
  void onInit() async {
    await getUserListData(currentPage);
    super.onInit();
  }

  Future getUserListData(int pageNo) async {
    change(isLoading = true);
    try {
      final response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=$pageNo"));
      if (response.statusCode == 200) {
        var userJsonList = jsonDecode(response.body);
        final List<dynamic> userData = userJsonList['data'];
        final int totalPages = userJsonList['total_pages'];
        userList = userData.map((data) => Data.fromJson(data)).toList();
        change(currentPage = userJsonList['page']);
        change(userList);
        change(totalPage = totalPages);
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
