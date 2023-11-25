import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/widgets/custom_buttom.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(top: true,left: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder:(controller)=> Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 120,
                                width: MediaQuery.of(context).size.width*.35,
                                child: Image.network(controller.allProductModel[index].image!,fit: BoxFit.fill),),
                          const SizedBox(width: 30,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                text:controller.allProductModel[index].name!,
                                fontSize: 16.0,
                              ),
                              const SizedBox(height: 10,),
                              CustomText(
                                text:"\$ ${controller.allProductModel[index].price!}",
                                fontSize: 12.0,
                                color: Colors.green,
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                height: 40,
                                color: Colors.grey.shade200,
                                child:  Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 10,),
                                    GestureDetector(
                                        onTap:(){
                                          controller.increaseQuantity(index);
                                        },
                                        child: const Icon(Icons.add)),
                                    const SizedBox(width: 10,),
                                     CustomText(
                                      alignment: Alignment.center,
                                      text: controller.allProductModel[index].quantity.toString(),
                                    ),
                                    const SizedBox(width: 10,),
                                    GestureDetector(
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: GestureDetector(
                                            onTap:(){
                                              controller.decreaseQuantity(index);
                                            },
                                            child: const Icon(Icons.minimize)),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                  ],
                                ),
                              ),
                            ],
                          )

                        ],);

                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10.0,
                          ),
                      itemCount: controller.allProductModel.length),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        children: [
                          const CustomText(text: "TOTAL",),
                          const SizedBox(height: 10,),
                          CustomText(text: "\$ ${controller.price}",color: Colors.green,),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: CustomButton(onPress: (){},
                        color: Colors.green,
                          text: "CHECKOUT",

                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
