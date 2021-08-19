import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class DeleteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? style;
  const DeleteButton(
      {Key? key, required this.text, required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(height: 1, width: size.width, color: AppColors.stroke),
        Container(
          color: AppColors.white100,
          height: 56,
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                    AppColors.delete.withOpacity(0.2))),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_outline, color: AppColors.delete),
                    SizedBox(width: 18),
                  ],
                ),
                Text(
                  text,
                  style: style ?? TextStyles.buttonDelete,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
