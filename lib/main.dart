import 'package:dicoding_submission/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        fontFamily: 'Nunito',
        primarySwatch: Colors.orange,
      ),
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 900) {
          return Scaffold(
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth / 8),
              child: HomePage(),
            ),
          );
        } else {
          return HomePage();
        }
      }),
    );
  }
}
