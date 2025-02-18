import 'package:nurtureAi/app/app.locator.dart';
import 'package:nurtureAi/app/app.router.dart';
import 'package:nurtureAi/ui/common/app_colors.dart';
import 'package:nurtureAi/ui/common/ui_helpers.dart';
import 'package:nurtureAi/ui/components/submit_button.dart';
import 'package:nurtureAi/ui/components/text_field_widget.dart';
import 'package:nurtureAi/ui/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


/// @author amrah Sali
/// email: amrahsali@gmail.com
/// Feb, 2024
///


class Login extends StatefulWidget {
  final Function(bool) updateIsLogin;
  const Login({Key? key, required this.updateIsLogin}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool terms = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: ViewModelBuilder<AuthViewModel>.reactive(
          onViewModelReady: (model) {
            model.init();
          },
          viewModelBuilder: () => AuthViewModel(),
          builder: (context, model, child) => ListView(
            children: [
              Center(
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              verticalSpaceTiny,

              verticalSpaceMedium,
              TextFieldWidget(
                hint: "Email",
                controller: model.email,
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                hint: "Password",
                controller: model.password,
                obscureText: model.obscure,
                suffix: InkWell(
                  onTap: () {
                    model.toggleObscure();
                  },
                  child: Icon(
                      model.obscure ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              verticalSpaceTiny,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InkWell(
              //       onTap: model.toggleRemember,
              //       child: Row(
              //         children: [
              //           Container(
              //               height: 20,
              //               width: 20,
              //               decoration: BoxDecoration(
              //                   color: model.remember
              //                       ? kcSecondaryColor
              //                       : Colors.transparent,
              //                   borderRadius: BorderRadius.circular(5),
              //                   border: Border.all(
              //                       color: model.remember
              //                           ? Colors.transparent
              //                           : kcSecondaryColor)),
              //               child: model.remember
              //                   ? const Center(
              //                 child: Icon(
              //                   Icons.check,
              //                   color: kcWhiteColor,
              //                   size: 14,
              //                 ),
              //               )
              //                   : const SizedBox()),
              //           horizontalSpaceSmall,
              //           const Text(
              //             "Remember Me",
              //             style: TextStyle(
              //                 fontSize: 14, decoration: TextDecoration.underline),
              //           )
              //         ],
              //       ),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         locator<NavigationService>()
              //             .navigateToChangePasswordView(isResetPassword: true);
              //       },
              //       child: const Text(
              //         "Forgot password?",
              //         style: TextStyle(
              //           fontSize: 16,
              //           color: kcSecondaryColor,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              verticalSpaceMedium,
              SubmitButton(
                isLoading: model.isBusy,
                boldText: true,
                label: "Continue",
                submit: () {
                  model.login();
                },
                color: kcPrimaryColor,
              ),
              verticalSpaceMedium,

              Row(
                  children:  [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        gotoRegister();

                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 12,
                          color: kcPrimaryColor,
                        ),
                      ),
                    )

                  ]
              ),
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


              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }

  void gotoRegister() {
    widget.updateIsLogin(false);
  }
}
