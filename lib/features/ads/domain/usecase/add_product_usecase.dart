import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

class ProductUsecase {
  // add data
  static Future<void> addTofireStore(AdsModel adsmodel) async {
    try {
      await AdsService.adsDb
          .withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          )
          .add(adsmodel);
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }

  // update data
  static Future<void> updateData(
      {required String id, required AdsModel adsmodel}) async {
    try {
      await AdsService.adsDb
          .withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          )
          .doc(id)
          .set(adsmodel);
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }

  // get category
  static Future<QuerySnapshot<Map<String, dynamic>>> getCategory() async {
    try {
      return await AdsService.categoryDb.orderBy('name').get();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
