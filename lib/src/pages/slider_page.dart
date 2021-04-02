import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 100.0;
  bool _valueCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      min: 10.0,
      max: 400.0,
      divisions: 400,
      label: 'Tamaño de la imagen',
      value: _valueSlider,
      onChanged: (_valueCheckBox) ? null : (newValue) {
        setState(() {
          _valueSlider = newValue;
        });
      },
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //   value: _valueCheckBox, 
    //   onChanged: (newValue) {
    //     setState(() {
    //       _valueCheckBox = newValue;
    //     });
    //   });
    
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _valueCheckBox, 
      onChanged: (newValue) {
        setState(() {
          _valueCheckBox = newValue;
        });
      },
    );
    
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _valueCheckBox, 
      onChanged: (newValue) {
        setState(() {
          _valueCheckBox = newValue;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://e7.pngegg.com/pngimages/113/170/png-clipart-bender-korra-roger-zoidberg-character-bender.png'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }
}