import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobilno/res/colors/app_colors.dart';
import 'package:mobilno/utils/utils.dart';
import 'package:mobilno/view/search_list_screen.dart';
import '../data/services/services.dart';
import '../models/user_list_model.dart';
import 'add_new_user.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      getUserListData();
    });
    super.initState();
    setState(() {
      getUserListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey300Color,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity.w,
          height: double.infinity.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Text(
                  "Mobilno",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  width: double.infinity.w,
                  height: 50.w,
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
                          color: AppColor.grey400Color,
                          offset: const Offset(-4, -4),
                          blurRadius: 15.w,
                          spreadRadius: 1.w)
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 4.w,
                      left: 8.w,
                      top: 4.w,
                      bottom: 4.w,
                    ),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: searchController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            Utils.snackBar("Search",
                                "By Id, Ime, Prezime, Prezime, Mobilni");
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            suffixIcon: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.to(SearchListScreen(
                                      title: searchController.text));
                                  searchController.clear();
                                }
                              },
                              child: const Icon(Icons.search),
                            ),
                            labelText: "",
                            hintText: "Search",
                            suffixIconColor: AppColor.grey700Color),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Expanded(
                child: FutureBuilder(
                    future: getUserListData(),
                    builder:
                        (context, AsyncSnapshot<List<UserListModel>> snapshot) {
                      if (snapshot.hasData) {
                        List<UserListModel> sortedList = snapshot.data!;
                        sortedList
                            .sort((a, b) => a.prezime!.compareTo(b.prezime!));
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 20.w, top: 10.w),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            UserListModel user = sortedList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          id: snapshot.data![index].id,
                                          image: snapshot
                                              .data![index].slikaPutanja,
                                          firstName: snapshot.data![index].ime,
                                          lastName:
                                              snapshot.data![index].prezime,
                                          telephone:
                                              snapshot.data![index].telefon,
                                          mobile: snapshot.data![index].mobilni,
                                        ),
                                      ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    ),
                                    color: AppColor.grey300Color,
                                    border: Border.all(
                                        color: AppColor.grey400Color),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColor.grey400Color,
                                          offset: const Offset(4, 4),
                                          blurRadius: 15.w,
                                          spreadRadius: 2.w),
                                      BoxShadow(
                                          color: AppColor.whiteColor,
                                          offset: const Offset(-4, -4),
                                          blurRadius: 15.w,
                                          spreadRadius: 2.w)
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 8.w),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 4.w),
                                          child: Container(
                                            width: 40.w,
                                            height: 40.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.grey300Color,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppColor.whiteColor,
                                                    offset: const Offset(4, 4),
                                                    blurRadius: 15.w,
                                                    spreadRadius: 1.w),
                                                BoxShadow(
                                                    color:
                                                        AppColor.grey400Color,
                                                    offset:
                                                        const Offset(-4, -4),
                                                    blurRadius: 15.w,
                                                    spreadRadius: 1.w)
                                              ],
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(5.w),
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text("${index + 1}",
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              " ${user.ime}  ${user.prezime}",
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.w,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20.w),
                          itemCount: snapshot.data!.length,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}'),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(const AddNewUserScreen());
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
                padding: EdgeInsets.all(4.w),
                child: const Text("Add User"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
