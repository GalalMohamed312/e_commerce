
import 'package:ecommerce/view/widgets/custom_buttom.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../model/constance.dart';
import '../model/product_model.dart';

class DetailsView extends StatelessWidget {
  final ProductModel? model;

  const DetailsView({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network(
              model!.image!,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomText(
                      text: model!.name!,
                      fontSize: 26,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Size',
                              ),
                              CustomText(
                                text: model!.sized!,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Color',
                              ),
                              Container(
                                width: 30,
                                height: 20,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: 'Details',
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: model!.description!,
                      fontSize: 18,
                      color: Colors.grey.shade400,
                    ),
                    CustomText(
                      text: model!.description!,
                      fontSize: 18,
                      color: Colors.grey.shade400,
                    ),
                    CustomText(
                      text: model!.description!,
                      fontSize: 18,
                      color: Colors.grey.shade400,
                    ),
                    CustomText(
                      text: model!.description!,
                      fontSize: 18,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "PRICE ",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10,),
                    CustomText(
                      text: ' \$${model!.price!}',
                      color: primaryColor,
                      fontSize: 18,
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 180,
                  height: 90,
                  child: CustomButton(
                    onPress: () {},
                    text: 'Add',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
