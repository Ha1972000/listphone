import 'package:flutter/material.dart';
import 'package:listphone/model/Contact.dart';
import '../viewmodel/home_screen_viewmodel.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
  int _currentIndex = 0;
  var tabColors = Colors.blue;
  final List<Contact> contacts = <Contact>[];

  @override
  void initState() {
    setInitializationVariables();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void setInitializationVariables() {
    homeScreenViewModel.filteredContacts = homeScreenViewModel.contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuộc gọi gần đây'),
      ),
      body: ListView.builder(
        itemCount: homeScreenViewModel.filteredContacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.call),
            title: Text(homeScreenViewModel.filteredContacts[index].name),
            subtitle: Text(homeScreenViewModel.filteredContacts[index].phoneNum),
          );
        },
      ),
    );
  }
}
