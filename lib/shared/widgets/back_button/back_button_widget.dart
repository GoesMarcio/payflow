import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  final Color? color;
  const BackButtonWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: color == null ? AppColors.background : color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        Navigator.maybePop(context);
      },
    );
  }
}
