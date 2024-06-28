import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/add_account_details_use_cases.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/get_account_details_use_case.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/upload_image_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_details_provider.g.dart';

// account details controller
@riverpod
class AccountDetails extends _$AccountDetails {
  @override
  bool build() {
    return false;
  }

  //add user data
  Future<void> addData({
    required String userId,
    required String userName,
    required XFile? image,
  }) async {
    state = true;

    final imageRef = await UploadImageUseCase()(
      image: File(image?.path ?? ""),
      userId: userId,
    );

    await AddAccountDeatailsUseCase()(
      userId: userId,
      accountDetails: AccountDetailsModel(
        userName: userName,
        profileImage: imageRef ?? "",
      ),
    );

    state = false;
  }
}

// get accountDetails provider
@riverpod
Future<DocumentSnapshot<AccountDetailsModel>> getAccountDetails(
    GetAccountDetailsRef ref,
    {required String userId}) {
  return GetAccountDeatailsUseCase()(userId);
}
