import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class _MenuProvider {

  List<dynamic> opcions = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('assets/menu_opts.json');
    Map parsedData = json.decode(resp);
    opcions = parsedData['rutas'];
    return opcions;
  }
}

final menuProvider = new _MenuProvider();

