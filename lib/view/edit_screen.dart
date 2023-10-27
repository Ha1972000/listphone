import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listphone/model/Contact.dart';

import '../viewmodel/home_screen_viewmodel.dart';

class EditScreen extends StatefulWidget {
  final Contact data;

  EditScreen({Key? key, required this.data});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nameCompanyController = TextEditingController();
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  File? _image;

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name;
    nameCompanyController.text = widget.data.name;
  }

  @override
  void dispose() {
    nameController.dispose();
    nameCompanyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String inputData = homeScreenViewModel.data;

    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hủy",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Xong',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      TextButton.icon(
                        onPressed: _pickImage,
                        icon: _image != null
                            ? Image.file(
                                _image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.account_circle_sharp,
                                size: 100,
                                color: Colors.black,
                              ),
                        label: const Text(''),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Text(
                            "Thêm ảnh",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Container(
                                height: 40,
                                width: 380,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Container(
                                height: 40,
                                width: 380,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Tên',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Container(
                                height: 40,
                                width: 380,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Tên công ty',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 270, top: 5),
                                    child: Text("điện thoại",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          right: 250, top: 2),
                                      child: Text(
                                        '${homeScreenViewModel.data}',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.blue,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
