import 'package:get/get.dart';

validinput(String value, int min, int max, String type) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "47".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "41".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "46".tr;
    }
  }
  if (type == "password") {
    if (!regex.hasMatch(value)) {
      return "42".tr;
    }
  }
  if (value.isEmpty) {
    return "43".tr;
  }
  if (value.length < min) {
    return "44 $min".tr;
  }
  if (value.length > max) {
    return "45 $max".tr;
  }
}
