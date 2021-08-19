import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  final bool paid;

  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  BoletoListController({required this.paid}) {
    getBoletos(paid);
  }

  Future<void> getBoletos(bool paid) async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];

      var boletosAux = response.map((e) => BoletoModel.fromJson(e)).toList();

      if (paid) {
        boletos = boletosAux.where((i) => i.paid == true).toList();
      } else {
        boletos =
            boletosAux.where((i) => i.paid == null || i.paid == false).toList();
      }
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }

  Future<void> deleteBoleto(BoletoModel data) async {
    try {
      final instance = await SharedPreferences.getInstance();
      var auxBboletos = instance.getStringList("boletos") ?? <String>[];

      auxBboletos.remove(data.toJson());

      await instance.setStringList("boletos", auxBboletos);

      // await getBoletos(this.paid);

      return;
    } catch (e) {
      print(e);
    }
  }

  Future<void> setBoletoPaid(BoletoModel data, bool value) async {
    try {
      final instance = await SharedPreferences.getInstance();
      var auxBoletos = instance.getStringList("boletos") ?? <String>[];
      var index = auxBoletos.indexOf(data.toJson());

      final boleto = BoletoModel.fromJson(auxBoletos[index]);

      auxBoletos[index] = BoletoModel(
              name: boleto.name,
              dueDate: boleto.dueDate,
              value: boleto.value,
              barcode: boleto.barcode,
              paid: value)
          .toJson();

      await instance.setStringList("boletos", auxBoletos.toList());

      // await getBoletos(this.paid);

      return;
    } catch (e) {
      print(e);
    }
  }
}
