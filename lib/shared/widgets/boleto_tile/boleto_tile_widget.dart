import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: Container(
        // color: Colors.red,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(data.name!, style: TextStyles.titleListTile),
          subtitle:
              Text("Vence em ${data.dueDate!}", style: TextStyles.captionBody),
          trailing: Text.rich(TextSpan(
              text: "R\$ ",
              style: TextStyles.trailingRegular,
              children: [
                TextSpan(
                    text: data.value == null
                        ? 0.toStringAsFixed(2).replaceFirst(".", ",")
                        : data.value!.toStringAsFixed(2).replaceFirst(".", ","),
                    style: TextStyles.trailingBold)
              ])),
        ),
      ),
    );
  }
}
