import 'package:flutter/material.dart';
class BottomSheetTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: 200,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Chia sẻ tới Facebook'),
            onTap: () {
              Navigator.pop(context); // Tắt BottomSheet
              shareToFacebook();
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('Chia sẻ tới Zalo'),
            onTap: () {
              Navigator.pop(context); // Tắt BottomSheet
              shareToZalo();
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Chia sẻ tới Email'),
            onTap: () {
              Navigator.pop(context); // Tắt BottomSheet
              shareToEmail();
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Chia sẻ tới Google'),
            onTap: () {
              Navigator.pop(context); // Tắt BottomSheet
              shareToGoogle();
            },
          ),
        ],
      ),
    );
  }

  void shareToFacebook() {
  }

  void shareToZalo() {
  }

  void shareToEmail() {
  }

  void shareToGoogle() {
  }
}