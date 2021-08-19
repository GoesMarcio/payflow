import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController(paid: true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height - 90 - 152,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      children: [
                        Text("Meus extratos",
                            style: TextStyles.titleBoldHeading),
                        Expanded(
                          child: Container(),
                        ),
                        ValueListenableBuilder<List<BoletoModel>>(
                            valueListenable: controller.boletosNotifier,
                            builder: (_, boletos, __) => Text(
                                "${boletos.length} pagos",
                                style: TextStyles.captionBody))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      color: AppColors.stroke,
                    ),
                  ),
                  SingleChildScrollView(
                      child: BoletoListWidget(controller: controller))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
