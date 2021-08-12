import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [
            AnimatedCard(
              curve: Curves.easeOutCirc,
              direction: AnimatedCardDirection.top,
              duration: Duration(milliseconds: 400),
              child: Container(
                width: double.maxFinite,
                height: 40,
                color: AppColors.primary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boletos, __) =>
                      BoletoInfoWidget(size: boletos.length)),
            ),
          ],
        ),
        Container(
          height: size.height - 90 - 152 - 52 - 24 - 6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      children: [
                        Text("Meus boletos",
                            style: TextStyles.titleBoldHeading),
                      ],
                    ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BoletoListWidget(controller: controller),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
