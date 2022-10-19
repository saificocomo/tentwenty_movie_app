import 'package:flutter/material.dart';

import '../utlis/app_color.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  double buttonWidth;
  CustomButton({Key? key, required this.buttonText, required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * buttonWidth,
      decoration: BoxDecoration(
        color: AppColors.liteBlueColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
        ),
      ),
    );
  }
}
