import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/buttons/label_button.dart';
import 'package:payflow/shared/widgets/dividers/divider_vertical.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryText;
  final VoidCallback primaryOnPressed;
  final String secondText;
  final VoidCallback secondOnPressed;
  const BottomSheetWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.primaryText,
      required this.primaryOnPressed,
      required this.secondText,
      required this.secondOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          color: Colors.transparent,
          child: Container(
              // color: Colors.transparent,
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Container(
                color: AppColors.shape,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: TextStyles.buttonBoldHeading,
                            children: [
                              TextSpan(
                                text: "\n$subtitle",
                                style: TextStyles.buttonHeading,
                              )
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(height: 1, color: AppColors.stroke),
                    Container(
                      height: 56,
                      child: Row(
                        children: [
                          Expanded(
                              child: LabelButton(
                            text: primaryText,
                            onPressed: primaryOnPressed,
                            style: TextStyles.buttonPrimary,
                          )),
                          DividerVertical(),
                          Expanded(
                              child: LabelButton(
                                  text: secondText,
                                  onPressed: secondOnPressed)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
