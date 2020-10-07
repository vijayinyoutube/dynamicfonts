import 'package:dynamicfonts/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List fonts = [
  GoogleFonts.aBeeZee,
  GoogleFonts.pacifico,
  GoogleFonts.lobster,
  GoogleFonts.combo,
];

var fontName = <String>[
  'aBeeZee',
  'pacifico',
  'lobster',
  'combo',
];
int myindex = 0;

String _selectedFont = "aBeeZee";

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getMyFont();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Vijay",
            style: fonts[myindex](
              fontSize: 50,
              fontWeight: FontWeight.w500,
            ),
          ),
          new DropdownButton<String>(
            value: _selectedFont,
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            style: TextStyle(color: Colors.deepPurple),
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            items: fontName.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                myindex = fontName.indexOf(newValue);
                _selectedFont = newValue;
                print(_selectedFont);
                print(myindex);
                saveMyFont(myindex);
              });
            },
          ),
          RaisedButton(onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          })
        ],
      ),
    ));
  }

  Future<void> saveMyFont(int fontIndex) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('index', fontIndex);
  }

  Future<void> getMyFont() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      myindex = prefs.getInt('index') ?? "0";
      print(myindex);
    });
  }
}
