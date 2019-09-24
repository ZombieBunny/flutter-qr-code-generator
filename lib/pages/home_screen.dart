import 'package:flutter/material.dart';
import 'package:network_qr/pages/generate.dart';
import 'package:network_qr/pages/network_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Network Organiser'),
      ),
      body: Container(
        child: new NetworkListScreen(),
      ),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GenerateScreen('','','WPA')),
            );
          }),
    );
  }
}
