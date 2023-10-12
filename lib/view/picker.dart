import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class MyImageAccessScreen extends StatefulWidget {
  @override
  _MyImageAccessScreenState createState() => _MyImageAccessScreenState();
}

class _MyImageAccessScreenState extends State<MyImageAccessScreen> {
  PermissionStatus _status = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
  }

  Future<void> _checkPermissionStatus() async {
    final status = await Permission.photos.status;
    setState(() {
      _status = status;
    });
  }

  Future<void> _requestPermission() async {
    final status = await Permission.photos.request();
    setState(() {
      _status = status;
    });
  }

  Future<void> _pickImage() async {
    if (_status.isGranted) {
      final picker = ImagePicker();
      final image = await picker.getImage(source: ImageSource.gallery);

      if (image != null) {
        // Do something with the selected image
        print('Image path: ${image.path}');
      }
    } else {
      // Handle the case when permission is not granted
      print('Permission not granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quyền truy cập ảnh'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Trạng thái quyền: $_status',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                if (_status.isDenied) {
                  _requestPermission();
                } else {
                  _pickImage();
                }
              },
              child: Text('Chọn ảnh'),
            ),
          ],
        ),
      ),
    );
  }
}
