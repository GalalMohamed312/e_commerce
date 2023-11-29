import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value
            ? SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // image
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: controller.userModel!.pic!.isEmpty
                              ? const AssetImage(
                              "assets/images/Icon_User.png")
                              : NetworkImage(
                              controller.userModel!.pic!) as ImageProvider<Object>,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    // name and email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: controller.userModel!.name!),
                        const SizedBox(height: 10,),
                        CustomText(text: controller.userModel!.email!),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 100,),
                card(
                  CardData(text: "Edit Profile", image: "assets/images/Icon_Cart.png"),
                      () {
                    // Add action for "Edit Profile" here
                    print("Tapped on Edit Profile");
                  },
                ),
                const SizedBox(height: 20,),
                card(
                  CardData(text: "Shopping Address", image: "assets/images/Icon_Cart.png"),
                      () {
                    // Add action for "Edit Profile" here
                    print("Tapped on Edit Profile");
                  },
                ),
                const SizedBox(height: 20,),
                card(
                  CardData(text: "Orders History", image: "assets/images/Icon_Cart.png"),
                      () {
                    // Add action for "Edit Profile" here
                    print("Tapped on Edit Profile");
                  },
                ),
                const SizedBox(height: 20,),
                card(
                  CardData(text: "Cards", image: "assets/images/Icon_Cart.png"),
                      () {
                    // Add action for "Edit Profile" here
                    print("Tapped on Edit Profile");
                  },
                ),
                const SizedBox(height: 20,),
                card(
                  CardData(text: "Notification", image: "assets/images/Icon_Cart.png"),
                      () {
                    // Add action for "Edit Profile" here
                    print("Tapped on Edit Profile");
                  },
                ),
                const SizedBox(height: 20,),
                card(
                  CardData(text: "Log Out", image: "assets/images/Icon_Cart.png"),
                      () {
                   controller.signOut();
                  },
                ),
              ],
            ),
          ),
        )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget card(CardData cardData, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(cardData.image),
            const SizedBox(width: 10),
            Text(cardData.text),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class CardData {
  final String text;
  final String image;

  CardData({required this.text, required this.image});
}
