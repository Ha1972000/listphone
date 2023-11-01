import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:listphone/view/voicemail_screen.dart';
import 'package:listphone/view/favourite_screen.dart';
import 'package:listphone/view/recent_screen.dart';
import 'package:listphone/view/keyboard_screen.dart';
import 'package:listphone/view/listview_screen.dart';
import 'package:listphone/viewmodel/bottomSheet.dart';
import 'package:listphone/viewmodel/home_screen_viewmodel.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:image_picker/image_picker.dart';
  // You can use context here

Widget getItemIcon(BuildContext context , index) {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
  int _currentIndex = 0;

  //TODO:Change UI of this
  return (index == 0 ||
      homeScreenViewModel.filteredContacts[index].name[0] !=
          homeScreenViewModel.filteredContacts[index - 1].name[0])
      ? Container(
    height: 50.0,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    alignment: Alignment.centerLeft,
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Second(
                        data:
                        homeScreenViewModel.filteredContacts[index])));
      },
      child: Text(
        homeScreenViewModel.filteredContacts[index].name[0],
        style: const TextStyle(color: Colors.black26),
      ),
    ),
  )
      : Container(
    height: 0.0,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    alignment: Alignment.centerLeft,
    child: InkWell(onTap: () {
      Text(
        'Header #$index',
        style: const TextStyle(color: Colors.black26),
      );
    }),
  );
}