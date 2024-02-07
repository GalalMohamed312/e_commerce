import 'dart:developer';

import 'package:ecommerce/core/service/firestore_user.dart';
import 'package:ecommerce/core/service/local_database/local_storage_shared_prefs.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/view/profile/edit_profile.dart';
import 'package:ecommerce/view/profile/orders_history.dart';
import 'package:ecommerce/view/profile/shopping_address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/models.dart';
import '../utils/assets.dart';

class ProfileViewModel extends GetxController{
  var user=Get.find<LocalStorageData>();
  UserModel? get userModel => _userModel;
  final ValueNotifier<bool> _loading=ValueNotifier(false);
  ValueNotifier<bool>get loading=>_loading;
  UserModel? _userModel;
  List<ProfileSettingData> get profileSettingList=>_profileSettingList;
  final List<ProfileSettingData>_profileSettingList=[
    ProfileSettingData(text: "Edit Profile", image: ImageAssets.user),
    ProfileSettingData(text: "Shopping Address", image: ImageAssets.address),
    ProfileSettingData(text: "Orders History", image: ImageAssets.shoppingHistory),
    ProfileSettingData(text: "Log Out", image: ImageAssets.logout),

  ];

  TextEditingController? name=TextEditingController(),email=TextEditingController();
  final LocalStorageData localStorageData=Get.find<LocalStorageData>();
ProfileViewModel(){
  getCurrentUser();
}

  void signOut(){
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    user.deleteUser();
  }

  void getCurrentUser() async{
    await user.getUser.then((value) {
      _userModel=value;
      _loading.value=true;
      print(value);
      setEmailAndName();
    });
    update();
  }

  void onTapProfileSetting(int index){
  switch (index){
    case 0: {
      Get.to(EditProfile());
      break;
    }
    case 1: {
      Get.to(ShoppingAddress());
      break;
    }
    case 2: {
      Get.to(OrdersHistory());
      break;
    }
    case 3:{
      signOut();
      break;
    }

  }
  update();
  }

  void setEmailAndName() async{
   name?.text=_userModel!.name!;
   email?.text=userModel!.email!;
    update();
  }

  void setUser(UserModel userModel)async{
    await localStorageData.setUserData(userModel);
    update();
  }


  void updateEmail() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        print(email!.text);
        print(user.email);
        await user.updateEmail(email!.text);
        print('Email updated successfully');
      } catch (e) {
        print('Error updating email: $e');
        // Handle the error here
      }
    } else {
      print('User is null');
      // Handle the case where the user is not signed in
    }
  }

  updateUserData()async{
  if(name!.text!=_userModel!.name){
    _userModel!.name=name!.text;
  }
  print(email!.text);
  print(_userModel!.email);
  if(email!.text.isNotEmpty)
    {
      print("changeeeeeee");
      try{
        print("tryyyyyyyy");
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: "ga@gmail.com", password:"12345678").then((value)async{
          print("loginnnnnnnnn");
          print(value.user!.email);
          print(FirebaseAuth.instance.currentUser!.emailVerified);
          await FirebaseAuth.instance.currentUser!.updateEmail(email!.text).then((value){
            print(email!.text);
            _userModel!.email=email!.text;
            FireStoreUser().updateUserFromFireStore(_userModel!);
            setUser(_userModel!);
            SnackBar(content: Text("success"),);

          }).catchError((e){
            print(e.toString());
          });
        }).catchError((onError){
          print("errorrr== $onError");
        });
        // await FirebaseAuth.instance.currentUser.
      } catch (e) {
        print('Error sending email verification: $e');
        return;
      }
    }

    update();
  }

}