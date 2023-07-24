import 'package:ecommerce/controller/home/homescreen_controller.dart';
import 'package:ecommerce/view/widget/Home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerIMP>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listpage.length + 1, ((index) {
              int page = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomBottomAppBar(
                      iconData: controller.iconbottombar[page],
                      active: controller.currentpage == page ? true : false,
                      textButton: controller.tittlebottombar[page],
                      onPressed: (){
                        controller.changepage(page);
                      },
                    );
            }))
          ],
        ),
      ),
    );
  }
}
