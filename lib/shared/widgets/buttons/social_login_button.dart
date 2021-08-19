import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/dividers/divider_vertical.dart';

class SocialLoginButton extends StatefulWidget {
  final VoidCallback onTap;

  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  _SocialLoginButtonState createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  int _state = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        animateButton();
        widget.onTap();
        // stopButton();
      },
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
                setUpButtonChild(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return Text("Entrar com o Google", style: TextStyles.buttonGray);
    } else if (_state == 1) {
      return Container(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.grey),
          strokeWidth: 3,
        ),
      );
    } else {
      return Icon(Icons.check, color: AppColors.grey);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });
  }

  void stopButton() {
    setState(() {
      _state = 2;
    });
  }
}
