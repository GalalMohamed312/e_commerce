import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/assets.dart';
import 'package:ecommerce/core/utils/values_manager.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/widgets/custom_buttom.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../model/constance.dart';
import '../model/models.dart';
import '../model/product_model.dart';

class DetailsView extends StatelessWidget {
  final  model;
  late final List<DeviceDetailsData> _mobileDetails;

  DetailsView({Key? key, required this.model}) : super(key: key) {
    _mobileDetails = [
      DeviceDetailsData(
          text: "Screen",
          image: ImageAssets.smartPhoneIcon,
          details: model.screen!),
      DeviceDetailsData(
          text: model.runtimeType==ProductModel?"Camera":"Graphic Card",
          image: ImageAssets.camera,
          details:  model.runtimeType==ProductModel?model.camera!:model.graphicsCard),
      DeviceDetailsData(
          text: "Storage/Ram",
          image: ImageAssets.storage,
          details: model.storage!),
      DeviceDetailsData(
          text: "Processor",
          image: ImageAssets.processor,
          details: model.processor!),
      DeviceDetailsData(
          text: "Battery",
          image: ImageAssets.battery,
          details: model.battery!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          //image
          Container(
            color: Colors.grey.shade100,
            width: MediaQuery.of(context).size.width,
            height: 250,
            padding: EdgeInsets.all(AppPadding.p16),
            child: Image.network(
              model.images![0],
              fit: BoxFit.contain,
            ),
          ),
          //mobile details
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(AppPadding.p16),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name!,
                      fontSize: AppSize.s24,
                      fontWeight: FontWeight.w700,
                    ),

                    SizedBox(
                      height: 24.h,
                    ),
                    CustomText(
                      text: 'Details',
                      fontSize: AppSize.s16,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            cardDetails(cardDetailsData: _mobileDetails[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 16.h,
                            ),
                        itemCount: _mobileDetails.length)
                  ],
                ),
              ),
            ),
          ),
          //checkout
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 10, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                     CustomText(
                      text: "PRICE ",
                      fontSize: AppSize.s24,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: ' ${model.price!}',
                          color: primaryColor,
                          fontSize: AppSize.s16,
                        ),
                        CustomText(
                          text: ' EGP',
                          color: primaryColor,
                          fontSize: AppSize.s12,
                        ),
                      ],
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => Container(
                    padding: EdgeInsets.all(20.sp),
                    width: 180.w,
                    height: 90.h,
                    child: CustomButton(
                      onPress: () {
                        controller.addProductToCart(
                          CartProductModel(
                            name: model.name,
                            image: model.images![0],
                            price: model.price!,
                            quantity: 1,
                            id: model.id,
                          ),
                        );
                      },
                      text: 'Add',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardDetails({required DeviceDetailsData cardDetailsData}) {
    return Container(
      height: 50.h,
      // padding: EdgeInsets.all(AppPadding.p12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.gray,
          )),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r)),
                color: primaryColor,
              ),
              child: Image.asset(
                cardDetailsData.image,
                color: AppColors.white,
              )),
          SizedBox(width: 16.w),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: AppPadding.p16),
          //   child: CustomText(
          //     text: "${cardDetailsData.text}: ",
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.p16),
              child: CustomText(text: cardDetailsData.details, maxLine: 1),
            ),
          ),
        ],
      ),
    );
  }
}
