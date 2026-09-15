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
      print('----------> ${e.code}');
      throw e.message ?? 'some thing went rong';
    } catch (e) {
      print('------>${e}');
      rethrow;
    }
  }

  static Future<void> registeration(UserModel user, String password) async {
    try {
      print('1- Creating Firebase Auth user...');

      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );

      user.uid = credential.user!.uid;

      await _adduserinfo(user);
 
    } on FirebaseException catch (e) {
      throw e.message ?? 'something went wrong';
    } catch (e) {
      
      rethrow;
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
