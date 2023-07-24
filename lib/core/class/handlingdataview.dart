import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatuesRequest statuesRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statuesRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statuesRequest == StatuesRequest.loading
        ?  Center(
            child: Lottie.asset(AppImageAsset.loadin,width:250,height: 250 ),
          )
        : statuesRequest == StatuesRequest.offlinefailure
            ?  Center(
                child: Lottie.asset(AppImageAsset.lostconnection,width:250,height: 250),
              )
            : statuesRequest == StatuesRequest.serverfailure
                ?  Center(
                    child: Lottie.asset(AppImageAsset.serverfailure,width:250,height: 250),
                  )
                : statuesRequest == StatuesRequest.failure
                    ?  Center(
                        child:Lottie.asset(AppImageAsset.nodata,width:250,height: 250),
                      )
                    : widget;
  }
}
