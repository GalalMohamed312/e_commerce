import 'package:ecommerce/view/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/view_model/auth_view_model.dart';
import '../../model/constance.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';


class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: context.height*.1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Welcome,",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: const CustomText(
                        text: "Sign Up",
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'iamdavid@gmail.com',
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: 'Password',
                  hint: '**********',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPress: () {
                    _formKey.currentState!.save();

                    if (_formKey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                  text: 'SIGN IN',
                ),
                const SizedBox(
                  height: 40,
                ),
                const CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButtonSocial(
                  text: 'Sign In with Facebook',
                  onPress: () {
                    controller.facebookSignInMethod();
                  },
                  imageName: 'assets/images/facebook.png',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButtonSocial(
                  text: 'Sign In with Google',
                  onPress: () {
                    controller.googleSignInMethod();
                  },
                  imageName: 'assets/images/google.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
