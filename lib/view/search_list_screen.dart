import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilno/models/search_model.dart';

import '../data/services/services.dart';
import '../res/colors/app_colors.dart';
import 'detail_screen.dart';

class SearchListScreen extends StatelessWidget {
  final String? title;
  const SearchListScreen({Key? key, this.title}) : super(key: key);

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
                ],
              ),
              SizedBox(height: 10.w),
              Expanded(
                child: FutureBuilder(
                    future: searchUser(title!),
                    builder:
                        (context, AsyncSnapshot<List<SearchModel>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 20.w, top: 10.w),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        id: snapshot.data![index].id,
                                        image:
                                            snapshot.data![index].slikaPutanja,
                                        firstName: snapshot.data![index].ime,
                                        lastName: snapshot.data![index].prezime,
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
                                  border:
                                      Border.all(color: AppColor.grey400Color),
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
                                                  color: AppColor.grey400Color,
                                                  offset: const Offset(-4, -4),
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
                                            " ${snapshot.data![index].ime}  ${snapshot.data![index].prezime}",
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
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20.w),
                          itemCount: snapshot.data!.length,
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
