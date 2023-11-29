import 'dart:convert';

import 'package:ecommerce/model/constance.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocalStorageData extends GetxController{
  Future<UserModel?>get getUser async{
   try{
     UserModel userModel=await _getUserData();
     if(userModel==null)return null;
     return userModel;
   }
   catch(e){
     print(e.toString());
   }
   return null;
  }

  setUserData(UserModel userModel)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString(cachedUserData, json.encode(userModel.toJson()));
  }
  _getUserData()async{
    SharedPreferences pefs=await SharedPreferences.getInstance();
    var data= pefs.getString(cachedUserData);
    return UserModel.fromJson(json.decode(data!));
  }
  deleteUser()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.clear();
  }
}