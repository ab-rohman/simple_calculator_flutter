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
  String? _currentItem = "Rupiah";
  var ListItem = [
    "Rupiah",
    "Dollar",
    "Euro",
  ];
  final _minimumPaddding = 5.0;

  void dropDownItem(changeValue) {
    setState(() {
      _currentItem = changeValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple test Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPaddding * 2),
        child: ListView(
          children: [
            getImageAssets(),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Principal',
                  hintText: 'Enter Principal eg 12000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  hintText: 'Enter Rate of Interest in percent',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        hintText: 'Enter Rate of Interest in percent',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: ListItem.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentItem,
                      onChanged: (changeValue) {
                        dropDownItem(changeValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      child: Text("Calculate"),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Reset"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0 * 2),
              child: Text('Todo Text'),
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
