import 'package:rent_hub/features/ads/service/object_box_service.dart';

class RecentSearchRemoveAllUseCase {
  final db = ObjectBoxService.instance;

  void call() {
    db.searchBox.removeAll();
  }
}
