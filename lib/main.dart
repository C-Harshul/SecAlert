
import 'package:flutter/material.dart';
import 'package:securityalert/pages/Alert.dart';
void main()  => runApp(SecApp());

class SecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Alert(),
      routes:{
        '/alert' :(context) => Alert(),
      }
    );
  }
}
