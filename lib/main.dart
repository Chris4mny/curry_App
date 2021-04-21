import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curry College',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Curry College'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  PDFDocument doc;

  void _loadFromAssets() async {
    setState(() {
      _isLoading = true;
    });
    doc = await PDFDocument.fromAsset('assets/sample1.pdf');
    setState(() {
      _isLoading = false;
    });
  }

  void _loadFromAssets2() async {
    setState(() {
      _isLoading = true;
    });
    doc = await PDFDocument.fromAsset('assets/campus-map.pdf');
    setState(() {
      _isLoading = false;
    });
  }

  void _loadFromAssets3() async {
    setState(() {
      _isLoading = true;
    });
    doc = await PDFDocument.fromAsset('assets/Curry-Weekender.pdf');
    setState(() {
      _isLoading = false;
    });
  }

  void _loadFromAssets4() async {
    setState(() {
      _isLoading = true;
    });
    doc = await PDFDocument.fromAsset('assets/departmentInfo.pdf');
    setState(() {
      _isLoading = false;
    });
  }

  void _loadFromAssets5() async {
    setState(() {
      _isLoading = true;
    });
    doc = await PDFDocument.fromAsset('assets/lateNightDining.pdf');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.purple.shade900,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: [
            if (_isLoading == true)
              Visibility(
                visible: true,
                child: Text(
                  'Welcome to the Student Information App!! Press the buttons below to gather information that will assist you at Curry College.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            Flexible(
              flex: 8,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : PDFViewer(
                      document: doc,
                    ),
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
              shrinkWrap: true,
              children: [
                RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Academic Calendar',
                    style: TextStyle(
                        color: Colors.deepPurple.shade900, fontSize: 16),
                  ),
                  onPressed: _loadFromAssets,
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Campus Map',
                    style: TextStyle(
                        color: Colors.deepPurple.shade900, fontSize: 16),
                  ),
                  onPressed: _loadFromAssets2,
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Curry Weekender',
                    style: TextStyle(
                        color: Colors.deepPurple.shade900, fontSize: 16),
                  ),
                  onPressed: _loadFromAssets3,
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Department Information',
                    style: TextStyle(
                        color: Colors.deepPurple.shade900, fontSize: 16),
                  ),
                  onPressed: _loadFromAssets4,
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Late Night Dining',
                    style: TextStyle(
                        color: Colors.deepPurple.shade900, fontSize: 16),
                  ),
                  onPressed: _loadFromAssets5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
