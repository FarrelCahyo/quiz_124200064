import 'package:flutter/material.dart';
import 'masuk.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bismillah Sukses Quiz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.white70
      ),
      home: masuk(),
    );
  }
}
