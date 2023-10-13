import 'package:flutter/material.dart';
import 'homescreen.dart';
class _showBottomSheet extends StatelessWidget {
  Color bottomSheetColor = Colors.white; // Màu nền mặc định

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Đặt isScrollControlled thành true
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.90, // Đặt chiều cao tùy chỉnh
          child: Column(
            children: <Widget>[
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              // Thêm nội dung khác vào đây
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}