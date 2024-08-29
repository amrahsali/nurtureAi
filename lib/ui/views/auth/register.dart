import 'package:nurtureAi/core/data/models/country.dart';
import 'package:nurtureAi/ui/common/app_colors.dart';
import 'package:nurtureAi/ui/components/submit_button.dart';
import 'package:nurtureAi/ui/components/text_field_widget.dart';
import 'package:nurtureAi/ui/views/auth/auth_viewmodel.dart';
import 'package:nurtureAi/ui/views/auth/password.dart';
import 'package:nurtureAi/utils/country_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/country_picker_utils.dart';
import '../../common/ui_helpers.dart';

/// @author Amrah sali
/// email: saliamrah300@gmail.com
/// jul, 2024
///

class Register extends StatefulWidget {
  // final TabController controller;
  final Function(bool) updateIsLogin;
  const Register({Key? key, required this.updateIsLogin}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            verticalSpaceTiny,
            Row(children: [
              const Text(
                "Already have an account? ",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              GestureDetector(
                onTap: () {
                  gotoLogin();
                },
                child: const Text(
                  "login Account",
                  style: TextStyle(
                    fontSize: 12,
                    color: kcPrimaryColor,
                  ),
                ),
              )
            ]),
            verticalSpaceMedium,
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                    hint: "Fullname",
                    controller: model.firstname,
                    inputType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'required';
                      }
                      return null; // Return null to indicate no validation error
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            verticalSpaceMedium,
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                    hint: "Email address",
                    controller: model.firstname,
                    inputType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'required';
                      }
                      return null; // Return null to indicate no validation error
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            verticalSpaceMedium,

            // TextFieldWidget(
            //   inputType: TextInputType.visiblePassword,
            //   hint: "Password",
            //   controller: model.password,
            //   obscureText: model.obscure,
            //   suffix: InkWell(
            //     onTap: () {
            //       model.toggleObscure();
            //     },
            //     child:
            //         Icon(model.obscure ? Icons.visibility_off : Icons.visibility),
            //   ),
            //   validator: (value) {
            //     if (value.isEmpty) {
            //       return 'Password is required';
            //     }
            //     if (value.length < 8) {
            //       return 'Password must be at least 8 characters long';
            //     }
            //     if (!RegExp(r'[A-Z]').hasMatch(value)) {
            //       return 'Password must contain at least one uppercase letter';
            //     }
            //     if (!RegExp(r'[a-z]').hasMatch(value)) {
            //       return 'Password must contain at least one lowercase letter';
            //     }
            //     if (!RegExp(r'[0-9]').hasMatch(value)) {
            //       return 'Password must contain at least one digit';
            //     }
            //     if (!RegExp(r'[!@#$%^&*]').hasMatch(value)) {
            //       return 'Password must contain at least one special character';
            //     }
            //     return null; // Return null to indicate no validation error
            //   },
            // ),
            // verticalSpaceSmall,
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8.0),
            //   child: Text( style: TextStyle(
            //     fontSize: 11,
            //   ),
            //       "Must be at least 8 characters with a combination of letters and numbers"),
            // ),
            // verticalSpaceMedium,
            // TextFieldWidget(
            //   hint: "Confirm password",
            //   controller: model.cPassword,
            //   obscureText: model.obscure,
            //   validator: (value) {
            //     if (value.isEmpty) {
            //       return 'Password confirmation is required';
            //     }
            //     if (value != model.password.text) {
            //       return 'Passwords do not match';
            //     }
            //     return null; // Return null to indicate no validation error
            //   },
            //   suffix: InkWell(
            //     onTap: () {
            //       model.toggleObscure();
            //     },
            //     child:
            //         Icon(model.obscure ? Icons.visibility_off : Icons.visibility),
            //   ),
            // ),
            // verticalSpace(60),
            // InkWell(
            //   onTap: model.toggleTerms,
            //   child: Row(
            //     children: [
            //       Container(
            //           height: 20,
            //           width: 20,
            //           decoration: BoxDecoration(
            //               color:
            //                   model.terms ? kcSecondaryColor : Colors.transparent,
            //               borderRadius: BorderRadius.circular(5),
            //               border: Border.all(
            //                   color: model.terms
            //                       ? Colors.transparent
            //                       : kcSecondaryColor)),
            //           child: model.terms
            //               ? const Center(
            //                   child: Icon(
            //                     Icons.check,
            //                     color: kcWhiteColor,
            //                     size: 14,
            //                   ),
            //                 )
            //               : const SizedBox()),
            //       horizontalSpaceSmall,
            //       const Text(
            //         "I ACCEPT TERMS & CONDITIONS",
            //         style: TextStyle(
            //             fontSize: 12, decoration: TextDecoration.underline),
            //       )
            //     ],
            //   ),
            // ),
            // verticalSpaceSmall,
            // InkWell(
            //   onTap: () async {
            //     final Uri toLaunch =
            //     Uri(scheme: 'https', host: 'www.afriprize.com', path: '/legal/privacy-policy');
            //
            //     if (!await launchUrl(toLaunch, mode: LaunchMode.inAppBrowserView)) {
            //       throw Exception('Could not launch www.afriprize.com/legal/privacy-policy');
            //     }
            //   },
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Text(
            //         "View our Privacy Policy",
            //         style: TextStyle(
            //           fontSize: 15,
            //           decoration: TextDecoration.underline,
            //           color: kcSecondaryColor, // Feel free to change the color
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // verticalSpaceSmall,
            // const Text('Apple/Google is not a sponsor nor is involved in any way with our raffles/contest or sweepstakes.'),
            // verticalSpaceMedium,
            SubmitButton(
              isLoading: false,
              label: "Continue",
              submit: () {
                // if (_formKey.currentState!.validate()) {
                //   model.register();
                // }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Password(updateIsLogin: (bool ) {  },)),
                );
              },
              color: kcPrimaryColor,
              boldText: true,
            ),
            verticalSpaceMedium,
            Row(children: [
              const Text(
                "Already have an account? ",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              GestureDetector(
                onTap: () {
                  gotoLogin();
                },
                child: const Text(
                  "login Account",
                  style: TextStyle(
                    fontSize: 12,
                    color: kcPrimaryColor,
                  ),
                ),
              )
            ]),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),

            // verticalSpaceMedium,
            //
            // SubmitButton(
            //   isLoading: model.isBusy,
            //   boldText: true,
            //   iconIsPrefix: true,
            //   icon: FontAwesomeIcons.google,
            //   label: "Sign in with Google",
            //   textColor: Colors.black,
            //   submit: () {
            //     Fluttertoast.showToast(msg: 'Coming soon',
            //         toastLength: Toast.LENGTH_LONG
            //     );
            //   },
            //   color: Colors.grey,
            // ),

            verticalSpaceLarge,
            const SizedBox(
              height: 50,
            ),
            verticalSpaceMassive
          ],
        ),
      ),
    );
  }

  void gotoLogin() {
    widget.updateIsLogin(true);
  }
}
