import 'dart:developer';

import 'package:ecommerce/core/service/local_database/local_storage_shared_prefs.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController{
  var user=Get.find<LocalStorageData>();
  UserModel? get userModel => _userModel;
  final ValueNotifier<bool> _loading=ValueNotifier(false);
  ValueNotifier<bool>get loading=>_loading;
  UserModel? _userModel;
ProfileViewModel(){
  getCurrentUser();
}
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getCurrentUser();
  // }
  void signOut(){
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    user.deleteUser();
  }

  void getCurrentUser() async{
    print("adsdddddddddd");
    await user.getUser.then((value) {
      print("comiinggggg");
      _loading.value=true;
      _userModel=value;
    });
    update();
  }
}