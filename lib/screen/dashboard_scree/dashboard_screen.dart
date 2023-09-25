import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_list_app/screen/dashboard_scree/dashboard_controller.dart';
import 'package:sample_list_app/screen/user_detail_screen/user_detail_screen.dart';
import 'package:sample_list_app/utils/color_resources.dart';
import 'package:sample_list_app/widgets/custom_indicator.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = "/dash_board_screen";

  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardScreenController());
    return GetBuilder<DashBoardScreenController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorResource.secondaryColor,
              toolbarHeight: 80,
              title: const Text(
                "User List",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: ColorResource.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
            body: (controller.userList == null || controller.isLoading == true)
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView.builder(
                      // controller: controller.pageController,
                      itemCount: controller.totalPage,
                      onPageChanged: (index) async {
                        int pageNo;
                        if (index > 1) {
                          pageNo = 1;
                        } else {
                          pageNo = index + 1;
                        }
                        await controller.getUserListData(pageNo);
                      },
                      itemBuilder: (context, pageIndex) {
                        return ListView.separated(
                          itemCount: controller.valuesPerPage,
                          itemBuilder: (context, index) {
                            return ListTile(
                              tileColor: Colors.green,
                              title: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                    "${controller.userList![index].firstName}"
                                            " "
                                            "${controller.userList![index].lastName}" ??
                                        "null",
                                    style: const TextStyle(fontSize: 20)),
                              ),
                              trailing: SizedBox(
                                  width: 150,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit,
                                            color: ColorResource.black,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            Get.toNamed(
                                                UserDetailScreen.routeName,
                                                arguments: controller
                                                    .userList![index].id);
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: ColorResource.black,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete,
                                            color: ColorResource.black,
                                          ))
                                    ],
                                  )),
                              contentPadding: EdgeInsets.zero,
                              onTap: () {},
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 20);
                          },
                        );
                      },
                    ),
                  ),
            bottomNavigationBar: SizedBox(
              height: 100,
              child: Center(
                child: CustomIndicator(
                  selectedIndex: controller.currentPage - 1,
                  pageCount: controller.totalPage,
                ),
              ),
            )),
      );
    });
  }
}
