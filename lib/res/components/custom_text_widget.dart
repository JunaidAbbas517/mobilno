import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomTextWidget({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity.w,
        height: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
          color: Colors.grey.shade300,
          // border: Border.all(color: Colors.grey.shade400),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(4, 4),
                blurRadius: 15.w,
                spreadRadius: 2.w),
            BoxShadow(
                color: Colors.white,
                offset: const Offset(-4, -4),
                blurRadius: 15.w,
                spreadRadius: 2.w)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  text,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
