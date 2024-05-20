import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_product.g.dart';

class AddProduct {
  final txtHeading = "ADD PRODUCT";
  final txtPhotos = "Photos";
  final txtSubHeading =
      "Include 3 to 8 photos for a full product representation";
  final txtProductName = "Product name";
  final txtGiveItemName = "Give item name";
  final txtPrice = "price (per day)";
  final txtItemPrice = "price of the item";
  final txtcategory = "category";
  final txtSelectCategory = "Select category";
  final txtLocation = "Location";
  final txtOffers = "Offers";
  final txtPicOffer = "Pick your offer";
  final txtDescription = "Description";
  final txtDescriptionProduct = "Give a brief description for your product ";
  final txtBtn = "POST NOW";
}

@riverpod
AddProduct addProduct(AddProductRef ref) {
  return AddProduct();
}
