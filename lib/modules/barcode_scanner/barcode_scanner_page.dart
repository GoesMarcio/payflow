import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/back_button/back_button_widget.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/buttons/label_button.dart';
import 'package:payflow/shared/widgets/dividers/divider_vertical.dart';

class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  final controller = BarCodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto",
            arguments: controller.status.barcode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarCodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Escaneie o código de barras do boleto",
                    style: TextStyles.buttonBackground),
                leading: BackButtonWidget(),
                centerTitle: true,
              ),
              body: Column(children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                )
              ]),
              bottomNavigationBar: Container(
                height: 56,
                color: AppColors.shape,
                child: Row(
                  children: [
                    Expanded(
                        child: LabelButton(
                            text: "Digitar código do boleto",
                            onPressed: () async {
                              // await Navigator.pushNamed(
                              // context, "/insert_boleto");
                              dispose();
                              await Navigator.pushNamed(
                                  context, '/insert_boleto');
                              Navigator.pop(context);
                            })),
                    DividerVertical(),
                    Expanded(
                        child: LabelButton(
                            text: "Adicionar da galeria",
                            onPressed: () {
                              dispose();
                              controller.scanWithImagePicker();
                            })),
                  ],
                ),
              ),
            ),
          ),
          ValueListenableBuilder<BarCodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    title: "Não foi possível identificar um código de barras.",
                    subtitle:
                        "Tente escanear novamente ou digite o código do seu boleto.",
                    primaryText: "Escanear novamente",
                    primaryOnPressed: () {
                      controller.scanWithCamera();
                    },
                    secondText: "Digitar código do boleto",
                    secondOnPressed: () async {
                      dispose();
                      await Navigator.pushNamed(context, '/insert_boleto');
                      Navigator.pop(context);
                    },
                  );
                } else {
                  return Container(
                      color: Colors.transparent, height: 1, width: 1);
                }
              }),
        ],
      ),
    );
  }
}
