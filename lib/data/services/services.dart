import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilno/res/app_url/app_url.dart';
import 'package:mobilno/utils/utils.dart';

import '../../models/search_model.dart';
import '../../models/user_list_model.dart';

import 'package:http/http.dart' as http;

import '../../view/home_screen.dart';

Future<List<UserListModel>> getUserListData() async {

  final response = await http.get(Uri.parse(AppUrl.allUserListUrl));

  if (response.statusCode == 200) {
    final List result = json.decode(response.body);
    return result.map((e) => UserListModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

addNewUserData({
  required String fname,
  required String lname,
  required String telephone,
  required String mobile,
  required File image,
}) async {
  try {
    var request = http.MultipartRequest(
        'POST',Uri.parse(AppUrl.addUserUrl));

    request.headers.addAll({
      'Content-type': 'multipart/formdata',
      "Accept": "application/json"
    });
    request.fields['Ime'] = 'blah';

  request.fields  ["Ime"] = fname;
  request.fields [ "Prezime"] = lname;
  request.fields [ "Telefon"] =  telephone;
  request.fields [ "Mobilni" ]= mobile;

    request.files.add(await http.MultipartFile.fromPath('ImageFile',image.path));
    var response =  await request.send();

    var serverResponse = await http.Response.fromStream(response);
    final responseData = json.decode(serverResponse.body);

    if(response.statusCode == 200 || response.statusCode == 201){
      Get.to(const HomeScreen());
      return responseData;

    }else{
      return responseData;
    }
  } catch (e) {
    debugPrint("Error occurred: $e");
    return Future.error(e);
  }
}

Future deleteUser(int id) async {
  final response = await http.delete(Uri.parse("${AppUrl.deleteUserUrl}$id"));

  if (response.statusCode == 200) {
    Utils.toastMessage("User Deleted Successfully");
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<SearchModel>>  searchUser(String title) async {
  final response = await http.get(Uri.parse("${AppUrl.searchUserUrl}$title"));
  if (response.statusCode == 200) {
    final List result = json.decode(response.body);
    return result.map((e) => SearchModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

updateUserData({
  required String id,
  required String firstName,
  required String lastName,
  required String telephone,
  required String mobile,
   File? image,
}) async {
  try {
    var request = http.MultipartRequest(
        'PUT',Uri.parse(AppUrl.updateUserUrl));

    request.headers.addAll({
      'Content-type': 'multipart/formdata',
      "Accept": "application/json"
    });

    request.fields  ["Id"] = id;
    request.fields  ["Ime"] = firstName;
    request.fields [ "Prezime"] = lastName;
    request.fields [ "Telefon"] =  telephone;
    request.fields [ "Mobilni" ]= mobile;

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('ImageFile', image.path));
    }
    var response =  await request.send();
    debugPrint('dfgh ${response.statusCode}');
    var serverResponse = await http.Response.fromStream(response);
    debugPrint('dfgh ${serverResponse.body}');
    final responseData = json.decode(serverResponse.body);
    debugPrint('dfgh ${response.statusCode}');
    if(response.statusCode == 200){
      return responseData;

    }else{
      return responseData;
    }
  } catch (e) {
    debugPrint("Error occurred: $e");
    rethrow;
  }
}
