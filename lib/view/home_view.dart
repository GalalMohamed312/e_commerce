import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/assets.dart';
import 'package:ecommerce/core/utils/values_manager.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core/view_model/home_view_model.dart';
import '../model/constance.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {

  const HomeView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) =>
      controller.loading.value
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(height: 24.h,),
                CustomText(text: "What device are you looking for?",
                  fontSize: AppSize.s30,
                  fontWeight: FontWeight.w700,),
                SizedBox(height: 24.h,),
                _searchTextFormField(),
                SizedBox(
                  height: 24.h,
                ),
                const CustomText(
                  text: "Categories",
                ),

                SizedBox(
                  height: 24.h,
                ),
                _listViewCategory(),
                SizedBox(
                  height: 24.h,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Best Selling",
                      fontSize: AppSize.s18,
                    ),
                    CustomText(
                      text: "See all",
                      fontSize: AppSize.s16,
                    ),
                  ],
                ),

                _listViewMobiles(context),
                _listViewLaptops(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(

        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "  Search your item",
            labelStyle:TextStyle(
              color: AppColors.lightGrey,
              fontSize: AppSize.s14,
            ),
            hintStyle: TextStyle(
              color: AppColors.lightGrey,
              fontSize: AppSize.s14,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.sp),
              child: SvgPicture.asset(
                ImageAssets.search, color: AppColors.lightGrey,),
            )
        ),
        cursorColor: primaryColor,
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) =>
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              itemCount: controller.categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage((controller.categoryModel[index]
                                .image!)),
                            fit: BoxFit.fill,
                          )
                      ),
                      height: 60.h,
                      width: 60.w,

                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomText(
                      text: controller.categoryModel[index].name!,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) =>
               SizedBox(
                width: 16.w,
              ),
            ),
          ),
    );
  }
  Widget _listViewMobiles(context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: .6,
        crossAxisCount: 2,
        children: List.generate(controller.productModel.length, (index) => GestureDetector(
          onTap: () {
            Get.to(DetailsView(
              model: controller.productModel[index],
            ));
          },
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: AppPadding.p4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1.0.w,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(AppPadding.p8),
                    color: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        controller.productModel[index].images![0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.sp,left: 8.sp),
                  child: CustomText(
                    text: controller.productModel[index].name!,
                    alignment: Alignment.centerLeft,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.sp,left: 8.sp),
                  child: CustomText(
                    text: controller.productModel[index].storage!,
                    color: Colors.grey,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.sp,left: 8.sp),
                      child: CustomText(
                        text: "${controller.productModel[index].price}",
                        color: primaryColor,
                        alignment: Alignment.centerLeft,
                        fontWeight: FontWeight.w700,
                        fontSize: AppSize.s24,
                      ),
                    ),
                    CustomText(
                      text: " EGP",
                      fontSize: AppSize.s12,
                      color: primaryColor,
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
                SizedBox(height: 8.h,),
              ],
            ),
          ),
        )),
      ),
    );
  }
  Widget _listViewLaptops(context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: .6,
        crossAxisCount: 2,
        children: List.generate(controller.laptopModel.length, (index) => GestureDetector(
          onTap: () {
            Get.to(DetailsView(
              model: controller.laptopModel[index],
            ));
          },
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: AppPadding.p4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1.0.w,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(AppPadding.p8),
                    color: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        controller.laptopModel[index].images![0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.sp,left: 8.sp),
                  child: CustomText(
                    text: controller.laptopModel[index].name!,
                    alignment: Alignment.centerLeft,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.sp,left: 8.sp),
                  child: CustomText(
                    text: controller.laptopModel[index].storage!,
                    color: Colors.grey,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.sp,left: 8.sp),
                      child: CustomText(
                        text: "${controller.laptopModel[index].price}",
                        color: primaryColor,
                        alignment: Alignment.centerLeft,
                        fontWeight: FontWeight.w700,
                        fontSize: AppSize.s24,
                      ),
                    ),
                    CustomText(
                      text: " EGP",
                      fontSize: AppSize.s12,
                      color: primaryColor,
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
                SizedBox(height: 8.h,),
              ],
            ),
          ),
        )),
      ),
    );
  }


}
