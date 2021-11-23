import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
      Firestore.instance.collection('contacts');

  Future<void> createUserData(String name, String email, String uid) async {
    return await profileList
        .document(uid)
        .setData({'name': name, 'email': email});
  }

  Future updateUserList(String name, String email, String uid) async {
    return await profileList
        .document(uid)
        .updateData({'name': name, 'email': email});
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
