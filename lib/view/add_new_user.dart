import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mobilno/data/services/services.dart';

import '../res/colors/app_colors.dart';
import '../utils/utils.dart';

class AddNewUserScreen extends StatefulWidget {
  const AddNewUserScreen({Key? key}) : super(key: key);

  @override
  State<AddNewUserScreen> createState() => _AddNewUserScreenState();
}

class _AddNewUserScreenState extends State<AddNewUserScreen> {
  final _formKey = GlobalKey<FormState>();
  File? image;
  String? imagePath;
  final fname = TextEditingController();
  final lname = TextEditingController();
  final telephone = TextEditingController();
  final mobile = TextEditingController();
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
                          if (_formKey.currentState!.validate() &&
                              imagePath != null) {
                            addNewUserData(
                              fname: fname.text,
                              lname: lname.text,
                              telephone: telephone.text,
                              mobile: mobile.text,
                              image: image!,
                            );
                            _formKey.currentState!.reset();
                          }
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
                              child: Icon(Icons.save, size: 15.w),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60.w),
                InkWell(
                  onTap: () async {
                    try {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.camera);

                      if (image == null) return;
                      imagePath = image.path;
                      final imageTemp = File(image.path);

                      setState(() => this.image = imageTemp);
                    } on PlatformException catch (e) {
                      debugPrint('Failed to pick image: $e');
                    }
                  },
                  child: Container(
                    width: 150.w,
                    height: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
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
                    child: image != null
                        ? Image.file(
                            image!,
                            width: 148.w,
                            height: 148.w,
                          )
                        : Icon(
                            Icons.image,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                  ),
                ),
                SizedBox(height: 10.w),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 80.w),
                        TextFormField(
                          controller: fname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              Utils.snackBar("Input", "First Name is required");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Ime",
                            suffixIconColor: AppColor.grey700Color,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.w),
                        TextFormField(
                          controller: lname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              Utils.snackBar("Input", "Last Name is required");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Prezime",
                            suffixIconColor: AppColor.grey700Color,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.w),
                        TextFormField(
                          controller: telephone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              Utils.snackBar(
                                  "Input", "Telephone number is required");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "telefon",
                            suffixIconColor: AppColor.grey700Color,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.w),
                        TextFormField(
                          controller: mobile,
                          validator: (value) {
                            if (value!.isEmpty) {
                              Utils.snackBar(
                                  "Input", "Mobile number is required");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "mobilni",
                            suffixIconColor: AppColor.grey700Color,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.w),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
