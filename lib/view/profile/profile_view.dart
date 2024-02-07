import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/assets.dart';
import 'package:ecommerce/core/utils/values_manager.dart';
import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/model/constance.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/models.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value
            ? Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // image
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
                        SizedBox(width: 24.w,),
                        // name and email
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(text: controller.userModel!.name!,color: AppColors.black,fontWeight: FontWeight.w700,),
                            SizedBox(height: 16.h,),
                            CustomText(text: controller.userModel!.email!,color: AppColors.lightGrey,),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h,),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index)=>profileSettingCard(
                    controller.profileSettingList[index],
                          () {
                        // Add action  here
                        controller.onTapProfileSetting(index);
                      },
                    ), separatorBuilder: (context,index)=>SizedBox(height:16.h ,), itemCount: controller.profileSettingList.length)
                  ],
                ),
              ),
            )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget profileSettingCard(ProfileSettingData cardData, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        padding: EdgeInsets.all(12.0.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Image.asset(cardData.image),
            SizedBox(width: 16.w),
            Text(cardData.text),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}


