import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final DatabaseReference ref =
    FirebaseDatabase.instance.ref('users/${auth.currentUser!.uid}');

String capitalize(String text) {
  return text
      .split(' ')
      .map((word) =>
          word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
      .join(' ');
}

Future<void> createUser(
    String uid, String name, String surname, String email) async {
  await db.collection("users").doc(uid).set(
    {
      'Name': capitalize(name),
      'Surname': capitalize(surname),
      'E-Mail': email,
    },
  );
}

Future<void> registerUserWithMailandPassword(
    String name, String surname, String password, String email) async {
  try {
    var result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    createUser(result.user!.uid, name, surname, email);
  } catch (e) {
    print(e);
  }
}

Future<void> userSignIn(String email, String password) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    print(e);
    throw e;
  }
}

Future<void> userSignOut() async {
  try {
    await auth.signOut();
  } catch (e) {
    print(e);
  }
}

Future<Map<String, dynamic>> getUserInfo() async {
  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      return Future.value(data);
    } else {
      print('Kullanıcı verisi bulunamadı.');
      return Future.value({});
    }

    // print(auth.currentUser!.uid);
    // print(data.value);
  } catch (error) {
    print('Kullanıcı verileri alınamadı: $error');
    return Future.value({});
  }
}

Future<void> updateUserInfo(Map<String, dynamic> data) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update(data);
  } on Exception catch (e) {
    print(e);
  }
}
