import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar'),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('GB'),
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            TextButton(
              onPressed: () => _showProfile(context),
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg'),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Center(
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/7/7b/Stan_Lee_by_Gage_Skidmore_3.jpg'),
          ),
        ));
  }

  void _showProfile(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text('Stan lee')),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(
                      'https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg')
              ),
            ]),
            actions: [
              TextButton(
                onPressed: () {}, 
                child: Text('Editar')
              )
            ],
          );
        });
  }
}
