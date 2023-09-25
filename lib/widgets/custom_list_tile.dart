import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final IconData iconData;
  final String text;

  const CustomListTile({super.key, required this.iconData, required this.text});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.iconData,
        size: 40,
        color: Colors.blue,
      ),
      title: Text(
        widget.text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }
}
