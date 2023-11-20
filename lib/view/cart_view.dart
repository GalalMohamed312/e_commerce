import 'package:ecommerce/view/widgets/custom_buttom.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>name=[
      "as",
      "sf",
      "ffe"
    ];
    List<int>price=[
      5,
     6,7
    ];
    List<String>image=[
      "assets/images/chaire.png",
      "assets/images/chaire.png",
      "assets/images/chaire.png",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(top: true,left: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
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
                              child: Image.asset(image[index],fit: BoxFit.fill),),
                        const SizedBox(width: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text:name[index],
                              fontSize: 16.0,
                            ),
                            const SizedBox(height: 10,),
                            CustomText(
                              text:"\$ ${price[index]}",
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
                                      onTap:(){},
                                      child: const Icon(Icons.add)),
                                  const SizedBox(width: 10,),
                                  const CustomText(
                                    alignment: Alignment.center,
                                    text: "1",
                                  ),
                                  const SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap:(){},
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 30.0),
                                      child: Icon(Icons.minimize),
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
                    itemCount: image.length),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        CustomText(text: "TOTAL",),
                        SizedBox(height: 10,),
                        CustomText(text: "\$ 100",color: Colors.green,),
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
    );
  }
}
