import 'package:flutter/foundation.dart';
import '../model/contact.dart';
import 'base_viewmodel.dart'; // Import the base ViewModel

class HomeScreenViewModel extends BaseViewModel {
  // Add properties specific to this ViewModel.

  String _data = "Initial Data";
  String get data => _data;

  final List<Contact> contacts = [
    Contact('An', '013456789', "Favourite"),
    Contact('Anh', '013456789', null),
    Contact('Ba', '013456789', null),
    Contact('Banh', '013456789', null),
    Contact('Co', '013456789', null),
    Contact('Can', '013456789', null),
    Contact('Yen', '013456789', null),
    Contact('Kim', '013456789', null),
    Contact('Phuong', '013456789', null),
    Contact('Mom', '013456789', null),
    Contact('Hung', '013456789', "Favourite"),
    Contact('Hue', '013456789', null),
  ];
  List<Contact> filteredContacts = [];

  // Example method to update data in the ViewModel.
  void updateListContact(String input) {
    filteredContacts = contacts
        .where((contact) =>
        contact.name.toLowerCase().contains(input.toLowerCase())).cast<Contact>()
        .toList();
    notifyListeners(); // Notify listeners of changes to update the UI.
  }
}