import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilno/res/colors/app_colors.dart';

class InternetExceptionWidget extends StatefulWidget {
  const InternetExceptionWidget({Key? key}) : super(key: key);

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 40.w),
          Icon(
            Icons.cloud_off,
            color: AppColor.grey400Color,
            size: 60.w,
          ),
          SizedBox(height: 20.w),
          Text(
            "We are unable to show result.\nPlease check your data\nconnection.",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.grey700Color),
          ),
          SizedBox(height: 40.w),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              color: AppColor.grey300Color,
              boxShadow: [
                BoxShadow(
                    color: AppColor.grey400Color,
                    offset: const Offset(4, 4),
                    blurRadius: 15.w,
                    spreadRadius: 1.w),
                BoxShadow(
                    color: AppColor.whiteColor,
                    offset: const Offset(-4, -4),
                    blurRadius: 15.w,
                    spreadRadius: 1.w)
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
              child: Text(
                "Retry",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.grey700Color),
              ),
            ),
          )
        ],
      ),
    );
  }
}
