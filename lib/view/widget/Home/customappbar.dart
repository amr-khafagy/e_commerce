import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      margin:EdgeInsets.only(top: 10.h),
      padding:EdgeInsets.symmetric(horizontal: 15.w),
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
                  hintStyle:TextStyle(fontSize: 18.sp),
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
