import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/values_manager.dart';
import 'package:ecommerce/model/constance.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;

  final String? hint;


  final  onSave;
  final  validator;
  final TextEditingController? textEditingController;
   const CustomTextFormField({super.key,
    this.text,
    this.hint,
    this.onSave,
    this.validator,
  this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text!,
          fontSize: AppSize.s14,
          color: AppColors.darkGray,
         ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          controller: textEditingController,
          onTapOutside: (event){
            FocusManager.instance.primaryFocus!.unfocus();
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor), // Color of the underline when focused
            ),

            fillColor: Colors.white,
          ),cursorColor: primaryColor,
        )
      ],
    );
  }
}
