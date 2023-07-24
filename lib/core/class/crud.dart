import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatuesRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = json.decode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatuesRequest.serverfailure);
      }
    } else {
      return const Left(StatuesRequest.offlinefailure);
    }
  }
}
