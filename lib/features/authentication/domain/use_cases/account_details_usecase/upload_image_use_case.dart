import 'dart:io';

import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

//upload image for cloud storage

final class UploadImageUseCase {
  Future<String?> call({
    required File image,
    required String userId,
  }) async {
    try {
      if (image.path.isNotEmpty) {
        return await AccountDetailsService.uploadImage(
          image: image,
          userId: userId,
        );
      }
    } on BaseException catch (e) {
      SnackbarUtils.showError(e.message);
    }
    return null;
  }
}
