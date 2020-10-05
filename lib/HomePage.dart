import 'package:flutter/material.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Hai",
          style: fonts[myindex](
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
