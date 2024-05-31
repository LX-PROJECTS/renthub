import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rent_hub/core/constants/image_constants.dart';
import 'package:rent_hub/core/constants/login_page_constants/login_page_alertbox.dart';
import 'package:rent_hub/core/constants/login_page_constants/login_page_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/utils/alert_box/alert_box.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = '/loginpage';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(loginPageConstantsProvider);

    // phone number controller
    final phoneNumberController = useTextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(context.spaces.space_200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ref.watch(imageConstantsProvider).imgOtpGirl),
              SizedBox(
                height: context.spaces.space_100,
              ),
              Text(
                constants.txtHeading,
                style: context.typography.h2SemiBold,
              ),
              SizedBox(
                height: context.spaces.space_100,
              ),
              Text(
                constants.txtSubHeding,
                style: context.typography.h3,
              ),
              SizedBox(
                height: context.spaces.space_100,
              ),
              IntlPhoneField(
                controller: phoneNumberController,
                initialCountryCode: 'IN',
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: constants.txtPhoneNo,
                  contentPadding: EdgeInsets.only(
                    bottom: context.spaces.space_200,
                  ),
                ),
                onCountryChanged: (country) {
                  // add country code
                  ref.read(coutryCodeProvider.notifier).state =
                      '+${country.dialCode}';
                },
              ),
              MainBtnWidget(
                onTap: () async {
                  // alert box for edit number or continue
                  if (phoneNumberController.text.isNotEmpty &&
                      phoneNumberController.text.length == 10) {
                    showAlertDialog(
                      context: context,
                      titile: ref
                          .watch(loginPageAlertBoxConstantsProvider)
                          .txtHeading,
                      subtitile: ref
                          .watch(loginPageAlertBoxConstantsProvider)
                          .txtSubHeading,
                      phoneNumber:
                          "${ref.read(coutryCodeProvider)} ${phoneNumberController.text}",
                      editButtonText: ref
                          .watch(loginPageAlertBoxConstantsProvider)
                          .txteditBtn,
                      continueButtonText: ref
                          .watch(loginPageAlertBoxConstantsProvider)
                          .txtcontinueBtn,
                      editButtononPressed: () {
                        Navigator.pop(context);
                      },
                      continueButtononPressed: () async {
                        // verify phone number
                        await ref
                            .read(authenticationProvider.notifier)
                            .verifyPhoneNuber(
                              context,
                              phoneNumber:
                                  "${ref.read(coutryCodeProvider)}${phoneNumberController.text}",
                            );
                      },
                    );
                  }
                },
                btnTxt: constants.txtOtpBtn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
