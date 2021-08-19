import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/bottom_sheet_boleto/bottom_sheet_boleto_widget.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  final int index;
  final BoletoListController controller;

  const BoletoTileWidget({
    Key? key,
    required this.data,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("#,##0.00", "pt_BR");

    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text("${data.name!}", style: TextStyles.titleListTile),
          subtitle:
              Text("Vence em ${data.dueDate!}", style: TextStyles.captionBody),
          trailing: Text.rich(TextSpan(
              text: "R\$ ",
              style: TextStyles.trailingRegular,
              children: [
                TextSpan(
                    text: data.value == null
                        ? oCcy.format(0.0)
                        : oCcy.format(data.value),
                    style: TextStyles.trailingBold)
              ])),
          onTap: () async {
            await showModalBottomSheet(
                barrierColor: Colors.black.withOpacity(0.6),
                context: context,
                builder: (BuildContext context) => BottomSheetBoletoWidget(
                      data: data,
                      index: index,
                      controller: controller,
                    ));
            await controller.getBoletos(controller.paid);
          },
        ),
      ),
    );
  }
}
