import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_list_app/screen/user_detail_screen/user_detail_screen_controller.dart';
import 'package:sample_list_app/utils/color_resources.dart';
import 'package:sample_list_app/utils/extension.dart';
import 'package:sample_list_app/utils/string_resources.dart';
import 'package:sample_list_app/widgets/custom_list_tile.dart';

class UserDetailScreen extends StatefulWidget {
  static const String routeName = "/user_detail_screen";

  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(UserDetailScreenController());
    return GetBuilder<UserDetailScreenController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: ColorResource.secondaryColor,
              toolbarHeight: 80,
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                "User Detail",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: ColorResource.white),
              ),
            ),
            body: (controller.userData == null || controller.isLoading == true)
                ? const Center(child: CircularProgressIndicator())
                : Column(children: [
                    ...[
                      const SizedBox(height: 20),
                      Image.network(
                        controller.userData!['avatar'],
                        fit: BoxFit.contain,
                      ),
                      CustomListTile(
                        iconData: Icons.person,
                        text: controller.userData!['first_name'] +
                                " " +
                                controller.userData!['last_name'] ??
                            "Null",
                      ),
                      CustomListTile(
                          iconData: Icons.email,
                          text: controller.userData!['email'] ?? "Null"),
                    ].separate(20),
                  ])),
      );
    });
  }
}
