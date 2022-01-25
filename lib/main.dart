import "package:flutter/material.dart";

import 'package:flutterproject/home_page.dart';
void main()
    {
      runApp(MyApp());
    }

    class MyApp extends StatelessWidget {
      //const Myapp({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Homepage(),

        );
      }
    }
