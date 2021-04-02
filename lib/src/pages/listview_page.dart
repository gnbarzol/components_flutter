import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  bool _isLoading = false;
  List<int> _listNumber = [];
  int _lastNumber = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _add10();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        // _add10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose(); //Para eliminar el listener al morir el componente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: Stack(
        children: [
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      color: Colors.black26,
      backgroundColor: Colors.pink,
      onRefresh: _refreshData,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/id/${_listNumber[index]}/500/300'),
          );
        },
        itemCount: _listNumber.length,
      ),
    );
  }

  Widget _createLoading() {
    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      );
    } else {
      return Container();
    }
  }

  void _add10() {
    for(var i=0; i<10; i++) {
      _listNumber.add(_lastNumber++);
    }
    setState(() {});
  }

  Future<Null> fetchData() async{
    _isLoading = true;
    setState(() {
    });
    final duration = new Duration(seconds: 2);
    new Timer(
      duration, 
      _requestHTTP
    );

    return Future.delayed(duration);
  }

  Future<Null> _refreshData() {
    final duration = new Duration(seconds: 2);
    new Timer(
      duration, 
      () {
        _lastNumber++;
        _listNumber.clear();
        _add10();
      }
    );

    return Future.delayed(duration);
  }

  void _requestHTTP() {
    _isLoading = false;
    _add10();
    _scrollController.animateTo( //Para mover el scroll despues de tener la data
      _scrollController.position.pixels + 100, 
      duration: Duration(milliseconds: 200), 
      curve: Curves.fastOutSlowIn
    );
  }
}