import 'package:ecommerce/controller/home/homecontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:ecommerce/view/screen/search/search.dart';
import 'package:ecommerce/view/widget/Home/cashbackcontainer.dart';
import 'package:ecommerce/view/widget/Home/categorieshome/listcategorieshome.dart';
import 'package:ecommerce/view/widget/Home/customtittlehome.dart';
import 'package:ecommerce/view/widget/Home/customappbar.dart';
import 'package:ecommerce/view/widget/Home/categorieshome/itemshome.dart';
import 'package:ecommerce/view/widget/Home/favouritefloatingbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerIMP());
    return GetBuilder<HomeControllerIMP>(
        builder: (controller) => SafeArea(
              child: Scaffold(
                floatingActionButton: const FavouriteFloatingButton(),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
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
                              : Column(
                                  children: [
                                    if (controller.homeBanner.isNotEmpty)
                                      CashBackContainer(
                                          tittle: controller.homeBanner[0]
                                              ["banner_title"],
                                          body: controller.homeBanner[0]
                                              ["banner_desc"]),
                                    CustomTittleHome(tittle: "53".tr),
                                    const ListCategoriesHome(),
                                    CustomTittleHome(tittle: "55".tr),
                                    const ItemsHome(),
                                  ],
                                ))
                    ],
                  ),
                ),
              ),
            ));
  }
}
