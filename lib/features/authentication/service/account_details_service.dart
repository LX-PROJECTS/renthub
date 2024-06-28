import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';

final class AccountDetailsService {
  // firestore  instance
  static final db =
      FirebaseFirestore.instance.collection('users').withConverter(
            fromFirestore: AccountDetailsModel.fromFirestore,
            toFirestore: AccountDetailsModel.toFirestore,
          );

// storage instance
  static final Reference storage =
      FirebaseStorage.instance.ref().child("profileImages");

// upload image to storage
  static Future<String> uploadImage({
    required File image,
    required String userId,
  }) async {
    try {
      await storage.child(userId).putFile(image);

      return await storage.child(userId).getDownloadURL();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  // add user data
  static Future<void> addData({
    required String userId,
    required AccountDetailsModel accountDetails,
  }) async {
    try {
      await db.doc(userId).set(accountDetails);
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  //get user data
  static Future<DocumentSnapshot<AccountDetailsModel>> getData(
    String userId,
  ) async {
    try {
      return await db.doc(userId).get();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }
}
