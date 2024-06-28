import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/authentication/create_account.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/authentication/controller/account_details_provider/account_details_provider.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/authentication/controller/image_picker_provider.dart';

class CreateAccountPage extends HookConsumerWidget {
  static const routePath = '/createAccount';
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // name text editing controller
    final TextEditingController nameEditingController =
        useTextEditingController();

    final createAcConst = ref.watch(createAccountConstantProvider);

    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spaces.space_200,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Text(
                createAcConst.txtHeading,
                style: context.typography.h1SemiBold,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: context.spaces.space_300 * 2,
                  bottom: context.spaces.space_400,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    context.spaces.space_300 * 6,
                  ),
                  onTap: () {
                    // pick image from gallery
                    ref.read(imagePickerProvider.notifier).pickImage();
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: context.spaces.space_300 * 4,
                        backgroundImage: ref.watch(imagePickerProvider) != null
                            ? FileImage(
                                File(
                                  ref.watch(imagePickerProvider)!.path,
                                ),
                              )
                            : null,
                      ),
                      Positioned(
                        left: context.spaces.space_900 * 2,
                        top: context.spaces.space_100 * 2,
                        child: CircleAvatar(
                          backgroundColor: context.colors.primary,
                          child: const Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // user name field
              Form(
                key: _formKey,
                child: TextFeildWidget(
                  labeltxt: createAcConst.txtLabelName,
                  hinttxt: createAcConst.txtHintName,
                  textController: nameEditingController,
                  validator: (value) {
                    if (nameEditingController.text.isEmpty) {
                      return 'Enter Your Name';
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  createAcConst.txtSubtitle,
                  style: context.typography.bodySmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.spaces.space_300),
                child: MainBtnWidget(
                  onTap: () {
                    // name TextEditingController validation
                    if (_formKey.currentState!.validate()) {
                      // add user data
                      ref.read(accountDetailsProvider.notifier).addData(
                            userId:
                                ref.read(authenticationProvider).phoneNumber!,
                            userName: nameEditingController.text,
                            image: ref.read(imagePickerProvider),
                          );
                    }
                  },
                  btnTxt: createAcConst.txtbtn,
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
