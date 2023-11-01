import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/Contact.dart';
import 'base_viewmodel.dart'; // Import the base ViewModel

class HomeScreenViewModel extends BaseViewModel {

  String _data = "Initial Data";
  String get data => _data;

  final List<Contact> contacts = [
    Contact(name: "Anh", phoneNum: "0984512402",birthDay: "12",date: "3", image: '',),
    Contact(name:'Bố', phoneNum:'0984562784',birthDay: "12",date: "3", image: '',),
    Contact(name:'Ba', phoneNum:'0864587789',birthDay: "12",date: "3", image: '',),
    Contact(name:'Bà', phoneNum:'0972264888', birthDay: "12",date: "3", image: '',),
    Contact(name:'Bạn', phoneNum:'0985462566',birthDay: "12",date: "3" , image: '',),
    Contact(name:'Bè',phoneNum: '0326215997',birthDay: "12",date: "3" , image: '',),
    Contact(name:'Yến', phoneNum:'0956486577',birthDay: "12",date: "3" , image: '',),
    Contact(name:'Kiên',phoneNum: '03286595673', birthDay: "12",date: "3", image: '',),
    Contact(name:'Kem', phoneNum:'09121159974',birthDay: "12",date: "3" , image: '',),
    Contact(name:'K', phoneNum:'0977886985', birthDay: "12",date: "3", image: '',),
  ];
  List<Contact> filteredContacts = [];
  void updateListContact(String input) {
    filteredContacts = contacts
        .where((contact) =>
        contact.name.toLowerCase().contains(input.toLowerCase()))
        .cast<Contact>()
        .toList();
    notifyListeners(); // Notify listeners of changes to update the UI.
  }
}
