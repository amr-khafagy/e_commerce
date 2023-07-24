import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';



class TestController extends GetxController{
  TestData testData =TestData(Get.find());
List data=[];
late StatuesRequest statuesRequest;
getData() async{
  statuesRequest=StatuesRequest.loading;
  var response=await testData.getData();
  print("=============================== Controller $response ") ;
  statuesRequest=handlingData(response);
if(StatuesRequest.success==statuesRequest){
  data.addAll(response['data']);
}
update();
}
@override
  void onInit(){
  getData();
  super.onInit();
}
}