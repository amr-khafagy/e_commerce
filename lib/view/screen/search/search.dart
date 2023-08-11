import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/homecontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemSearch extends StatelessWidget {
  final List<ItemsModel> listsearchmodel;

  const ListItemSearch({Key? key, required this.listsearchmodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
Get.put(HomeControllerIMP());
    return ListView.builder(
      itemBuilder: (context, index) {
        return GetBuilder<HomeControllerIMP>(builder: (controllerIMP) {
          return HandlingDataView(statuesRequest: controllerIMP.statuesRequest, widget:InkWell(
            onTap: () {
              controllerIMP.goToProductDetails(listsearchmodel[index]);
            },
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: "${AppLinks.itemssimage}/${listsearchmodel[index]
                    .itemsImage}", height: 50, width: 50,),
              title: Text("${listsearchmodel[index].itemsName}"),
              subtitle: Text("${listsearchmodel[index].itemsPrice}\$"),
            ),
          ));
        });
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listsearchmodel.length,
    );
  }
}
