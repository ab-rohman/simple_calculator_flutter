import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Simple Calculator',
    home: SIForm(),
  ));
}

class SIForm extends StatefulWidget {
  const SIForm({Key? key}) : super(key: key);

  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _uang = ['dolar', 'rupiah', 'euro'];
  final _minimumPaddding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple test Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPaddding * 2),
        child: Column(
          children: [
            getImageAssets(),
            TextField(
              decoration: InputDecoration(
                labelText: 'Principal',
                hintText: 'Enter Principal eg 12000',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageAssets() {
    AssetImage assetImage = AssetImage('logo.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPaddding * 10),
    );
  }
}
