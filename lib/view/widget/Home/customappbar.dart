import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String searchtext;
  final void Function(String)? onchangedsearch;
  final void Function()? onPressedfavourite;
  final void Function()? onPressedSearch;
  final TextEditingController searchcontroller;

  const CustomAppBar({Key? key,
    required this.searchtext,
    this.onPressedSearch,
    required this.onPressedfavourite,
    this.onchangedsearch, required this.searchcontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onchangedsearch,
              controller:searchcontroller,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: onPressedSearch),
                  hintText: (searchtext),
                  hintStyle: const TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.grey[200]),
            ),
          ),
        ],
      ),
    );
  }
}
