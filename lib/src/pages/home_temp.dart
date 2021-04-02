import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opcions = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
        centerTitle: true,
      ),
      body: ListView(
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> lista = [];
    for (String opt in opcions) {
      final item = ListTile(
        title: Text(opt),
        subtitle: Text("Sub"),
      );
      lista..add(item)..add(Divider());
    }
    return lista;
  }

  List<Widget> _createItemsShort() {
    return opcions
        .map((item) => Column(
              children: [
                ListTile(
                  title: Text(item),
                  subtitle: Text('sub'),
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                  onLongPress: () {print('Mantuviste presionado');},
                ),
                Divider(),
              ],
            ))
        .toList();
  }
}
