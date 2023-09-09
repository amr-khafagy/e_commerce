import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOfCart extends StatelessWidget {
  final String itemImage;
  final String? itemName;
  final String? itemprice;
  final String? numberOfItem;
  final void Function()? addToCart;
  final void Function()? removerFromCart;

  const CardOfCart(
      {Key? key,
      required this.itemImage,
      required this.itemName,
      required this.numberOfItem,
      required this.itemprice,
      required this.addToCart,
      required this.removerFromCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Card(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                   imageUrl:itemImage,
                    fit: BoxFit.cover,
                  width:120.w,
                    height:120.h,
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Text(itemName!),
                      subtitle: Text(
                        itemprice!,
                        style:  TextStyle(fontSize: 20.sp),
                      ),
                    )),
                Column(
                  children: [
                    IconButton(
                        onPressed: addToCart, icon: const Icon(Icons.add)),
                    Text(numberOfItem!),
                    IconButton(
                        onPressed: removerFromCart,
                        icon: const Icon(Icons.remove))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
