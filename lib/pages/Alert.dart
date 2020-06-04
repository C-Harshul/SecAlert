import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
class Alert extends StatefulWidget {

  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> with SingleTickerProviderStateMixin{
  int distance;
  bool safeDist = true;

  void read(){
    var alert = FirebaseDatabase.instance.reference();
    alert.child('Alert').onValue.listen((Event event) {
      setState(() {
        distance = event.snapshot.value;
        distance>=6 ? safeDist =true:safeDist =false;
      });
      print(distance);
    });
  }
  @override void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    read();
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: <Widget>[
            Room(safeDist: safeDist),
          ],
        ),
      ),
    );
  }
}

class Room extends StatelessWidget {
Room({this.safeDist}){
  margin=50;
}
  double margin;
  bool safeDist;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin:EdgeInsets.all(margin),
      duration: Duration(milliseconds: 500),
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          image: DecorationImage(
              fit:BoxFit.cover,
              image:NetworkImage('https://www.thespruce.com/thmb/nRAGgoVuhyExmQqQuKJJKXbPmeo=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/king-size-bed-in-bedroom-with-hickory-wood-floorboards-995447350-2ca4f38dbb704dc496554a5c6ac141b0.jpg')
          ),
          boxShadow:safeDist?[BoxShadow(/*blurRadius: 10,offset: Offset(4,4)*/)]: [BoxShadow(color:Colors.red,blurRadius: 100,offset: Offset(4,4))]
      ),
    );
  }
}
