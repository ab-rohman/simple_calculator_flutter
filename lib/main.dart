import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Calculator',
    home: SIForm(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
    ),
  ));
}

class SIForm extends StatefulWidget {
  const SIForm({Key? key}) : super(key: key);

  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
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

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple test Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(_minimumPaddding * 2),
          child: ListView(
            children: [
              getImageAssets(),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  controller: principalController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please fill the form';
                    }
                  },
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
                child: TextFormField(
                  controller: roiController,
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
                      child: TextFormField(
                        controller: termController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Term in Years',
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
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text("Calculate"),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              this.displayResult = _calculateReturn();
                            }
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text("Reset"),
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0 * 2),
                child: Center(child: Text(this.displayResult)),
              ),
            ],
          ),
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

  String _calculateReturn() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double total = principal + (principal * roi * term) / 100;
    String result = 'This is your total $total';
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItem = ListItem[0];
  }
}
