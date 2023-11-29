
import 'package:ecommerce/core/service/local_database/local_storage_shared_prefs.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model.dart';
import '../../view/home_view.dart';
import '../service/firestore_user.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? email, password, name;

  final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value?.email;
  final LocalStorageData localStorageData=Get.find<LocalStorageData>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication!.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(HomeView());
    });
  }

  void facebookSignInMethod() async {
    final AccessToken result = await FacebookAuth.instance.login() as AccessToken;

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    await _auth.signInWithCredential(facebookAuthCredential).then((user) {
      saveUser(user);
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email!, password: password!).then((value)async{
        await FireStoreUser().getUserFromFireStore(value.user!.uid).then((value){
           setUser(UserModel.fromJson(value.data() as Map));
        });
      });
      Get.offAll(const ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(HomeView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel =UserModel(
      userId: user.user!.uid,
      email: user.user?.email,
      name: name ?? user.user!.displayName,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }
  void setUser(UserModel userModel)async{
    await localStorageData.setUserData(userModel);
  }
}
