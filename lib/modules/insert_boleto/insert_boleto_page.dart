import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/buttons/label_button.dart';
import 'package:payflow/shared/widgets/dividers/divider_vertical.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({
    Key? key,
    this.barcode,
  }) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final moneyInputTextController = MoneyMaskedTextController(
      leftSymbol: "R\$", decimalSeparator: ",", thousandSeparator: ".");
  final dueDateTextController = MaskedTextController(mask: "00/00/0000");

  final barCodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null && widget.barcode != "null") {
      barCodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = InsertBoletoController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              widget.barcode!,
              style: TextStyles.buttonBoldHeading,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: "Nome do boleto",
                      validator: controller.validateName,
                      icon: Icons.description_outlined,
                      onChanged: (value) {},
                    ),
                    InputTextWidget(
                      label: "Vencimento",
                      controller: dueDateTextController,
                      validator: controller.validateVencimento,
                      icon: FontAwesomeIcons.timesCircle,
                      onChanged: (value) {},
                    ),
                    InputTextWidget(
                      label: "Valor",
                      controller: moneyInputTextController,
                      validator: (_) {
                        controller.validateValor(
                            moneyInputTextController.numberValue);
                      },
                      icon: FontAwesomeIcons.wallet,
                      onChanged: (value) {},
                    ),
                    InputTextWidget(
                      label: "Código",
                      controller: barCodeInputTextController,
                      validator: controller.validateCodigo,
                      icon: FontAwesomeIcons.barcode,
                      onChanged: (value) {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // color: AppColors.shape,
        color: AppColors.background,
        height: 57,
        child: Column(
          children: [
            Container(height: 1, color: AppColors.stroke),
            Row(
              children: [
                Expanded(
                    child: LabelButton(
                        text: "Cancelar",
                        onPressed: () {
                          Navigator.pop(context);
                        })),
                DividerVertical(),
                Expanded(
                    child: LabelButton(
                        text: "Cadastrar",
                        style: TextStyles.buttonPrimary,
                        onPressed: () {
                          controller.cadastrarBoleto();
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
