import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServses {
 static Future<UserModel?> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel? user = await _getuserinfo(credential.user!.uid);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

static  Future<void> registeration(UserModel user, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );
      user.uid = credential.user!.uid;
      await _adduserinfo(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

 static CollectionReference<UserModel> _getuserCollection() {
    CollectionReference<UserModel> users = FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJason(snapshot.data()!),
          toFirestore: (value, options) => value.tojson(),
        );
    return users;
  }

 static Future<void> _adduserinfo(UserModel user) async {
    CollectionReference<UserModel> userCollection = _getuserCollection();
    DocumentReference<UserModel> doc = userCollection.doc(user.uid);
    await doc.set(user);
  }

 static Future _getuserinfo(String uid) async {
    CollectionReference<UserModel> users = _getuserCollection();
    DocumentSnapshot<UserModel> doc = await users.doc(uid).get();
    return doc.data();
  }

  logout() {}
  deleteuser() {}
  upDateUser(UserModel user) {}
}
