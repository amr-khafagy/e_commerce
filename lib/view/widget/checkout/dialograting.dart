import 'package:ecommerce/controller/orders/orderarchieve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';



// show the dialog
void showDialogRating(BuildContext context,String ordersid) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => RatingDialog(
        initialRating: 1.0,
        // your app's name?
        title: const Text(
          'Rating Dialog',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        // encourage your user to leave a high rating?
        message: const Text(
          'Tap a star to set your rating. Add more description here if you want.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        // your app's logo?
        image: Image.asset("assets/images/logo.png",width: 200,height: 200,),
        submitButtonText: 'Submit',
        commentHint: 'Set your custom comment hint',
        onCancelled: () => print('cancelled'),
        onSubmitted: (response) {
          OrderArchieveController controller=Get.find();
          controller.submitRating(ordersid,response.rating,response.comment);
        },
      ));
}
