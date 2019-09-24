import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network_qr/pages/generate.dart';
import 'package:path_provider/path_provider.dart';

import '../models/network_instance.dart';

class NetworkListScreen extends StatefulWidget {
  @override
  NetworkListState createState() {
    return new NetworkListState();
  }
}

class NetworkListState extends State<NetworkListScreen> {
  String data;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // For your reference print the AppDoc directory
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<File> writeContent() async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('Hello Folks');
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If there is an error reading, return a default String
      return 'Error';
    }
  }

  @override
  void initState() {
    super.initState();
    writeContent();
    readContent().then((String value) {
      setState(() {
        data = value;
        dummyData.add(new NetworkModel(
          ssid: "Test",
          password: "K0pkool!",
          encryption: "WPA",
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(dummyData[i].ssid,
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new Text(dummyData[i].encryption,
                        style:
                            new TextStyle(color: Colors.grey, fontSize: 15.0)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GenerateScreen(
                              dummyData[i].ssid,
                              dummyData[i].password,
                              dummyData[i].encryption)),
                    );
                  }),
            ],
          ),
    );
  }
}
