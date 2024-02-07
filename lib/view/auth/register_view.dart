
import 'package:ecommerce/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';
import 'login_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomText(
                text: "Sign Up,",
                fontSize: 30.sp,
              ),
              SizedBox(
                height: AppSize.s24,
              ),
              CustomTextFormField(
                text: 'Name',
                hint: 'Galal',
                onSave: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
               SizedBox(
                height: AppSize.s24,
              ),
              CustomTextFormField(
                text: 'Email',
                hint: 'galal123@gmail.com',
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              SizedBox(
                height: AppSize.s24,
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
              SizedBox(
                height: AppSize.s24,
              ),
              CustomButton(
                onPress: () {
                  _formKey.currentState!.save();

                  if (_formKey.currentState!.validate()) {
                    controller.createAccountWithEmailAndPassword();
                  }
                },
                text: 'SIGN Up',
              ),
              SizedBox(
                height: AppSize.s24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
