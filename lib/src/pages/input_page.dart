import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _password = '';
  String _email = '';
  TextEditingController _inputDateController = new TextEditingController();
  DateTime _fechaSelect = DateTime.now();
  List<String> _poderes = ['Volar', 'Rayos X', 'Nadar', 'Correr'];
  String _powerSelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inputs Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        children: [
          _inputText('Nombre', 'Ingrese nombre', null),
          SizedBox(height: 20.0,),
          _inputEmail(),
          SizedBox(height: 20.0,),
          _inputPassword(),
          SizedBox(height: 20.0,),
          _datePicker(context),
          SizedBox(height: 20.0,),
          _createDropdown(),

          Divider(),
          _createPerson(),
        ],
      )
    );
  }

  Widget _inputText(String label, String hint, String helper) {
    return TextField(
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        focusColor: Colors.pink,
        fillColor: Colors.purple,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('Letras ${_name.length}'),
        hintText: 'Ingrese su nombre',
        suffixIcon: Icon(Icons.info),
        labelText: label,
        helperText: helper,
        icon: Icon(Icons.person),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _inputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Ingrese su correo',
        suffixIcon: Icon(Icons.email_outlined),
        labelText: 'Correo',
        icon: Icon(Icons.mail),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _inputPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Ingrese su contraseña',
        suffixIcon: Icon(Icons.lock_open),
        labelText: 'Contraseña',
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {
        _password = value;
      },
    );
  }

  Widget _datePicker(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.datetime,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Escoga una fecha',
        suffixIcon: Icon(Icons.date_range),
        labelText: 'Fecha de nacimiento',
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      controller: _inputDateController,
    );
  }

  void _selectDate(BuildContext context) async {
    if(_fechaSelect != null) {

    }

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: _fechaSelect, 
      firstDate: DateTime(2019), 
      lastDate: DateTime(2022),
      locale: Locale('es', 'ES'),
    );

    if(picked != null) {
      _inputDateController.text = picked.toString();
      _fechaSelect = picked;
      print('Si escogio fecha');
    } else {
      print('No escogio fecha');
    }
  }

  Widget _createDropdown() {
    if(_powerSelect == null) {
      
    }
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 20.0),
        Expanded(
            child: DropdownButton(
              isExpanded: true,
              hint: Text('Seleccione un poder'),
              value: _powerSelect,
              items: getOptionsDropdown(),
              onChanged: (opt) {
                setState(() {
                  _powerSelect = opt; 
                });
              },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {

    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
     });
    return lista;
  }

  Widget _createPerson() {
    String _text = '';
    if(_powerSelect == null) {
      _text = 'No tiene poder';
    } else {
      _text = _powerSelect;
    }
    return ListTile(
      title: Center(
        child: ListTile(
          title: Text('Nombre es: $_name'),
          subtitle: Text('Email: $_email'),
          trailing: Text(_text),
        )
      ),
    );
  }
}