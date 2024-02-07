import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/assets.dart';
import 'package:ecommerce/core/utils/values_manager.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/model/constance.dart';
import 'package:ecommerce/view/widgets/custom_buttom.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Checkout/checkout.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(top: true,left: false,
        child: Padding(
          padding:  EdgeInsets.only(bottom: 20.h),
          child: GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder:(controller)=>
            controller.loading.value?const CircularProgressIndicator():
            controller.allProductModel.isNotEmpty?
            Column(
              children: [
                SizedBox(height: 24.h,),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 120.h,
                                width: MediaQuery.of(context).size.width*.35,
                                child: Image.network(controller.allProductModel[index].image!,fit: BoxFit.contain),),
                          SizedBox(width: 30.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                text:controller.allProductModel[index].name!,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: 12.h,),
                              CustomText(
                                text:"${controller.allProductModel[index].price!} EGP",
                                fontSize: AppSize.s12,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,

                              ),
                              SizedBox(height: 12.h,),
                              Container(
                                height: 40.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12.r)

                                ),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 8.h,),
                                    Expanded(
                                      child: GestureDetector(
                                          onTap:(){
                                            controller.increaseQuantity(index);
                                          },
                                          child: const Icon(Icons.add,),),
                                    ),
                                    // SizedBox(width: 8.w,),
                                     Expanded(
                                       child: CustomText(
                                        alignment: Alignment.center,
                                        text: controller.allProductModel[index].quantity.toString(),
                                    ),
                                     ),
                                    // SizedBox(width: 8.w,),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        child: GestureDetector(
                                            onTap:(){
                                              controller.decreaseQuantity(index);
                                            },
                                            child: const Icon(Icons.minimize)),
                                      ),
                                    ),
                                    SizedBox(width: 8.w,),
                                  ],
                                ),
                              ),
                            ],
                          )

                        ],);

                      },
                      separatorBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(AppPadding.p16),
                        color: AppColors.gray,
                        height: 1.h,
                        width: double.infinity,
                      ),
                      itemCount: controller.allProductModel.length),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0.sp,right: 20.0.sp,top: 10.sp),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        children: [
                          const CustomText(text: "TOTAL",),
                          SizedBox(height: 12.h,),
                          Row(
                            children: [
                              CustomText(text: "${controller.price}",color: primaryColor,fontWeight: FontWeight.w700,fontSize: AppSize.s20,),
                              const CustomText(text: " EGP",color: primaryColor,),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 120.w,
                        child: CustomButton(onPress: (){
                          Get.to(()=>const Checkout());
                        },
                        color: Colors.green,
                          text: "CHECKOUT",

                        ),
                      )
                    ],
                  ),
                ),
              ],
            ):
            Center(child: SvgPicture.asset(ImageAssets.emptyCart,height: 220.h,))
          ),
        ),
      ),
    );
  }
}
