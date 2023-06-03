import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobilno/res/colors/app_colors.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.blackColor,
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
    );
  }
}
