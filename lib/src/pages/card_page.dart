import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards Page'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          children: [
            _cardType1(),
            SizedBox(height: 30.0,),
            _cardType2(),
            SizedBox(height: 30.0,),
            _cardType1(),
            SizedBox(height: 30.0,),
            _cardType2(),
            SizedBox(height: 30.0,),
            _cardType1(),
            SizedBox(height: 30.0,),
            _cardType2()
          ],
        ));
  }

  Widget _cardType1() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      elevation: 5.0,
      shadowColor: Colors.blue,
      child: Column(children: [
        ListTile(
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
          title: Text('Este es un título'),
          subtitle: Text(
              'Este es un subtitulo de ejemplo que solo sirve para mostrar que el contenido puede ser visualizado como un subtitulo'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: Text('Cancelar')),
            TextButton(onPressed: () {}, child: Text('Ok')),
          ],
        )
      ]),
    );
  }

  Widget _cardType2() {
    return Card(
      clipBehavior: Clip.antiAlias, // Para que el contenido interno no salga de los borders
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      shadowColor: Colors.blue,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://img.locationscout.net/images/2017-08/peyriac-de-mer-small-port-france_l.jpeg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 280.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Este es un texto de ejemplo')),
        ],
      ),
    );
  }
}
