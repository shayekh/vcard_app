import 'package:flutter/foundation.dart';
import 'package:vcard_app/db/dbhelper.dart';

import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  final db = DbHelper();

  Future<int> insertContactP(ContactModel contactModel) async {
    final rowId = await db.insertContact(contactModel);
    contactModel.id = rowId;
    contactList.add(contactModel);
    notifyListeners();
    return rowId;
  }

  Future<void> getAllContactsP() async {
    contactList = await db.getAllContacts();
    notifyListeners();
  }

  Future<ContactModel> getContactByIdP(int id) => db.getContactById(id);

  Future<int> deleteContactP(int id) async {
    return db.deleteContact(id);
  }

  Future<void> updateContactFieldP(ContactModel contactModel, String field) async {
    await db.updateContactField(contactModel.id,
        {field: contactModel.favorite ? 0 : 1});
    final index = contactList.indexOf(contactModel);
    contactList[index].favorite = !contactList[index].favorite;
    notifyListeners();

  }
}
