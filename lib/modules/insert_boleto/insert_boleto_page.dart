import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InsertBoletoPage extends StatelessWidget {
  final String? barcode;
  const InsertBoletoPage({
    Key? key,
    this.barcode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: BackButton(color: AppColors.input),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 93),
              child: Text(
                "Preencha os dados do boleto",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              barcode!,
              style: TextStyles.buttonBoldHeading,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
