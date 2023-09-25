
import 'package:flutter/material.dart';
import 'package:sample_list_app/utils/color_resources.dart';

class CustomIndicator extends StatefulWidget {
  final int selectedIndex;
  final int pageCount;

  const CustomIndicator(
      {super.key, required this.selectedIndex, required this.pageCount});

  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      padding: const EdgeInsets.all(8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.pageCount,
        itemBuilder: (context, index) {
          return indicator(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 3);
        },
      ),
    );
  }

  Widget indicator(int indexValue) {
    return widget.selectedIndex == indexValue
        ? Container(
      height: 4,
      width: 10,
      decoration: const BoxDecoration(
          color: ColorResource.secondaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8))),
    )
        : Container(
      height: 8,
      width: 8,
      decoration: const BoxDecoration(
          color: ColorResource.primaryColor, shape: BoxShape.circle),
    );
  }
}