import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/buttons/delete_button.dart';
import 'package:payflow/shared/widgets/buttons/modal_button.dart';

class BottomSheetBoletoWidget extends StatelessWidget {
  final BoletoModel data;
  final int index;
  final BoletoListController controller;

  const BottomSheetBoletoWidget(
      {Key? key,
      required this.data,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("#,##0.00", "pt_BR");

    return BottomSheet(
      enableDrag: false,
      backgroundColor: AppColors.white100,
      builder: (BuildContext context) {
        return Container(
          height: 260,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Container(
                    height: 2,
                    width: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.input,
                    )),
              ),
              Text.rich(
                TextSpan(
                    text: "O boleto ",
                    style: TextStyles.titleHeading,
                    children: [
                      TextSpan(
                          text: "${data.name}\n",
                          style: TextStyles.titleBoldHeading,
                          children: []),
                      TextSpan(
                          text: "no valor de ",
                          style: TextStyles.titleHeading,
                          children: []),
                      TextSpan(
                          text: data.value == null
                              ? "R\$ ${oCcy.format(0.0)}\n"
                              : "R\$ ${oCcy.format(data.value)}\n",
                          style: TextStyles.titleBoldHeading,
                          children: []),
                      TextSpan(
                          text: "foi pago?",
                          style: TextStyles.titleHeading,
                          children: [])
                    ]),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: ModalButton(
                      text: "Ainda não",
                      onPressed: () async {
                        await controller.setBoletoPaid(data, false);
                        Navigator.pop(context);
                      },
                    )),
                    Container(width: 16),
                    Expanded(
                        child: ModalButton(
                      text: "Sim",
                      onPressed: () async {
                        await controller.setBoletoPaid(data, true);
                        Navigator.pop(context);
                      },
                      primary: true,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
              ),
              DeleteButton(
                text: 'Deletar boleto',
                onPressed: () async {
                  await controller.deleteBoleto(data);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
      onClosing: () {
        print("fechei");
      },
    );
  }
}
