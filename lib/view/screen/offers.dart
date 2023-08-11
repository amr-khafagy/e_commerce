import 'package:ecommerce/controller/offerscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/screen/search/search.dart';
import 'package:ecommerce/view/widget/Home/customappbar.dart';
import 'package:ecommerce/view/widget/cart/cart_app_bar.dart';
import 'package:ecommerce/view/widget/itemswidget/listitems.dart';
import 'package:ecommerce/view/widget/offers/customlistitemsoffes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    return GetBuilder<OffersController>(builder: (controller) {
      return Scaffold(
          body: ListView(
            children: [
              CustomAppBar(
                searchcontroller: controller.search!,
                onchangedsearch: (val) {
                  controller.checkSearch(val);
                },
                searchtext: "54".tr,
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onPressedfavourite: () {
                  controller.goToFavourite();
                },
              ),
              HandlingDataView(
                  statuesRequest: controller.statuesRequest,
                  widget: controller.isSearch
                      ? ListItemSearch(
                    listsearchmodel: controller.listItems,
                  )
                      :  OffersListItems()

              )
            ],
          ));
    });
  }
}
