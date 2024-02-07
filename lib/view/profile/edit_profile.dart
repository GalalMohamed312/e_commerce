import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/navigator.dart';
import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/values_manager.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_text_form_field.dart';

class EditProfile extends StatelessWidget {
   EditProfile({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
       elevation: 0.0,
       leading:  IconButton(onPressed: (){
         AppNavigator.pop(context: context);

       }, icon: const Icon(Icons.arrow_back_ios,color: AppColors.black,)),
      ),
      body: GetBuilder<ProfileViewModel>  (

        builder: (controller) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.h,
                          padding: EdgeInsets.all(AppPadding.p8),
                          decoration: BoxDecoration(
                            // color: Colors.green,
                              shape: BoxShape.circle,
                              border:  Border.all(color:controller.userModel!.pic!.isEmpty ?AppColors.black : Colors.transparent)
                          ),
                          child:controller.userModel!.pic!.isEmpty? Image.asset(ImageAssets.user,):
                          Image.network(controller.userModel!.pic!)
                          ,
                        ),
                        Positioned(
                          right: 0.sp,
                          top: 0.sp,
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              padding: EdgeInsets.all(AppPadding.p4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                // color: Colors.green,
                                  shape: BoxShape.circle,border:Border.all(color: Colors.grey.shade300)
                              ),
                              child: Icon(Icons.camera_alt_outlined,size: 20.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormField(
                      text: 'Name',
                      onSave: (value) {
                        controller.userModel!.name = value;
                      },
                      textEditingController: controller.name ,
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
                      onSave: (value) {
                        controller.userModel!.email = value;
                      },
                      textEditingController: controller.email,
                      validator: (value) {
                        if (value == null) {
                          print("ERROR");
                        }
                      },
                    ),
                    SizedBox(
                      height: AppSize.s24,
                    ),
                    // CustomTextFormField(
                    //   text: 'Password',
                    //   hint: '**********',
                    //   onSave: (value) {
                    //     controller.userModel.= value;
                    //   },
                    //   validator: (value) {
                    //     if (value == null) {
                    //       print('error');
                    //     }
                    //   },
                    // ),
                    SizedBox(
                      height: AppSize.s24,
                    ),
                    CustomButton(
                      onPress: () {
                        _formKey.currentState!.save();

                        if (_formKey.currentState!.validate()) {
                          controller.updateUserData();
                        }
                      },
                      text: 'Update',
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
      ),
    );
  }
}
