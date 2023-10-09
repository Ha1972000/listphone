import 'package:flutter/foundation.dart';
import '../model/contact.dart';
import 'base_viewmodel.dart'; // Import the base ViewModel

class HomeScreenViewModel extends BaseViewModel {
  // Add properties specific to this ViewModel.

  String _data = "Initial Data";
  String get data => _data;

  final List<Contact> contacts = [
    Contact('An', '013456789', "Favourite"),
    Contact('At', '013456789', "Favourite"),
    Contact('Ak', '013456789', "Favourite"),
    Contact('Bd', '013456789', "Favourite"),
    Contact('B3', '013456789', "Favourite"),
    Contact('B1', '013456789', "Favourite"),
    Contact('Bd', '013456789', "Favourite"),
    Contact('Bm', '013456789', "Favourite"),
    Contact('Ym', '013456789', "Favourite"),
    Contact('Km', '013456789', "Favourite"),
    Contact('K1', '013456789', "Favourite"),
    Contact('Km', '013456789', "Favourite"),
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