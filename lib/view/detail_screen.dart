import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobilno/view/update_user_screen.dart';
import '../data/services/services.dart';
import '../res/components/custom_text_widget.dart';
import 'home_screen.dart';

class DetailScreen extends StatelessWidget {
  final int? id;
 final  String? firstName;
  final String? lastName;
  final String? telephone;
  final  String? mobile;
  final String? image;
  const DetailScreen({
    Key? key,
    this.id,
    this.firstName,
    this.lastName,
    this.telephone,
    this.mobile,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity.w,
          height: double.infinity.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.w, left: 16.w),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(4, 4),
                                  blurRadius: 15.w,
                                  spreadRadius: 1.w),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(-4, -4),
                                  blurRadius: 15.w,
                                  spreadRadius: 1.w)
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Icon(Icons.arrow_back_ios_new, size: 15.w),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.w, right: 16.w),
                      child: InkWell(
                        onTap: () {
                          deleteUser(id!);
                          Get.to(const HomeScreen());
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(4, 4),
                                  blurRadius: 15.w,
                                  spreadRadius: 1.w),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(-4, -4),
                                  blurRadius: 15.w,
                                  spreadRadius: 1.w)
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Icon(Icons.delete, size: 15.w),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60.w),
                Container(
                  width: 150.w,
                  height: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                    image: DecorationImage(
                        image: NetworkImageWithRetry("$image"), fit: BoxFit.cover),
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(4, 4),
                          blurRadius: 15.w,
                          spreadRadius: 1.w),
                      BoxShadow(
                          color: Colors.white,
                          offset: const Offset(-4, -4),
                          blurRadius: 15.w,
                          spreadRadius: 1.w)
                    ],
                  ),
                ),
                SizedBox(height: 80.w),
                CustomTextWidget(text: 'Ime: $firstName', onTap: () {}),
                SizedBox(height: 30.w),
                CustomTextWidget(text: 'Prezime: $lastName', onTap: () {}),
                SizedBox(height: 30.w),
                CustomTextWidget(text: 'Telefon: $telephone', onTap: () {}),
                SizedBox(height: 30.w),
                CustomTextWidget(text: 'Mobilni: $mobile', onTap: () {}),
                SizedBox(height: 30.w),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(UpdateUserScreen(
            id: id,
            pic: image,
            firstName: firstName,
            lastName: lastName,
            mobile: mobile,
            telephone: telephone,
          ));
        },
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            height: 40.w,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              border: Border.all(color: Colors.grey.shade400),
              color: Colors.grey.shade300,
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    offset: const Offset(4, 4),
                    blurRadius: 15.w,
                    spreadRadius: 1.w),
                BoxShadow(
                    color: Colors.white,
                    offset: const Offset(-4, -4),
                    blurRadius: 15.w,
                    spreadRadius: 1.w)
              ],
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Update"),
                    Icon(
                      Icons.edit,
                      size: 16.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
