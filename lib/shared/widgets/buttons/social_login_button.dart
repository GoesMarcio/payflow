import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/dividers/divider_vertical.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 18),
                  Image.asset(AppImages.google),
                  SizedBox(width: 18),
                  DividerVertical()
                ],
              )),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Entrar com o Google", style: TextStyles.buttonGray),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
