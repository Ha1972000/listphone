import 'package:flutter/material.dart';
class TextFieldSample extends StatefulWidget {
  @override
  _TextFieldSampleState createState() => _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {
  bool _showTextField = false;
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _showTextField
              ? Container(
            color: Colors.red,
            height: 50,
            child: TextField(
              controller: TextEditingController(text: _text),
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
          )
              : Container(height: 0),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              _showTextField = !_showTextField;
            });
          },
          child: Text(
            _showTextField ? 'Hide TextField' : 'Show TextField',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}