import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/user.dart';

class UserNetwork {
  UserNetwork();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUserToDb(User user) {
    return users
        .add({
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'coverImage': user.coverImage,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<User> getUserFromDb(String id) async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .get(); //get the data
    return User.parse(data);
  }
}
