import 'package:flutter/material.dart';

import '../../model/constance.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final  onPress;

  const CustomButton({super.key,
    required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius:   BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10),
      onPressed: onPress,
      color: primaryColor,
      child: CustomText(
        alignment: Alignment.center,
        text: text,
        color: Colors.white,
      ),
    );
  }
}
