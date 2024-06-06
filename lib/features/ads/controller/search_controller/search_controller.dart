import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/search_filter_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
Future<QuerySnapshot<AdsModel>> searchProduct(SearchProductRef ref,
    {required String queryText}) {
  return SearchFilterUsecase().search(queryText: queryText);
}
