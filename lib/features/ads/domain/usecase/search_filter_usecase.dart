import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

class SearchFilterUsecase {
  // Reference to the Firestore collection with a converter to map Firestore documents to AdsModel objects and vice versa
  final adsDbref = AdsService.adsDb.withConverter(
    fromFirestore: AdsModel.fromFirestore,
    toFirestore: AdsModel.toFireStore,
  );

  // Method to get filtered ads from Firestore
  Future<QuerySnapshot<AdsModel>> search({
    required String queryText, // Text to search within the ad names
    String order = 'name', // Field to order the results by, default is 'name'
    bool descending = false, // Whether to sort in descending order, default is false (ascending)
    Iterable<Object?>? searchCategories, // Categories to filter the search results
    double isLessThanOrEqualTo = 9999999, // Upper limit for the price filter, default is a high value
    double isGreaterThanOrEqualTo = 0, // Lower limit for the price filter, default is 0
  }) async {
    try {
      // Constructing a Firestore query with the provided filters
      return await adsDbref
          .orderBy(order, descending: descending) // Ordering the results
          .where("name", isGreaterThanOrEqualTo: queryText) // Filtering by name starting with queryText
          .where("name", isLessThanOrEqualTo: "$queryText\uf7ff") // Filtering by name ending with queryText
          .where('name', whereIn: searchCategories) // Filtering by categories
          .where('price', isLessThanOrEqualTo: isLessThanOrEqualTo) // Filtering by max price
          .where('price', isGreaterThanOrEqualTo: isGreaterThanOrEqualTo) // Filtering by min price
          .get(); // Executing the query
    } on FirebaseException catch (e) {
      // Handling any Firestore exceptions by throwing a custom StorageException
      throw StorageException(error: e.message);
    }
  }
}
