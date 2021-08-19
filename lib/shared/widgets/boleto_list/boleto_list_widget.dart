import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  const BoletoListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: widget.controller.boletosNotifier,
        builder: (a, boletos, b) => Column(
              children: boletos
                  .asMap()
                  .map((i, e) => MapEntry(
                      i,
                      BoletoTileWidget(
                        data: e,
                        index: i,
                        controller: widget.controller,
                      )))
                  .values
                  .toList(),
            ));
  }
}
