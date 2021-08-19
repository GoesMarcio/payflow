import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class ModalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? primary;
  const ModalButton(
      {Key? key, required this.text, required this.onPressed, this.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: (primary != null && primary == true)
              ? AppColors.primary
              : AppColors.shape,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(BorderSide(
              color: (primary != null && primary == true)
                  ? AppColors.primary
                  : AppColors.stroke))),
      height: 56,
      child: TextButton(
          style: (primary != null && primary == true)
              ? ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      AppColors.white100.withOpacity(0.2)))
              : null,
          onPressed: onPressed,
          child: Text(
            text,
            style: (primary != null && primary == true)
                ? TextStyles.buttonBackground
                : TextStyles.buttonHeading,
          )),
    );
  }
}
