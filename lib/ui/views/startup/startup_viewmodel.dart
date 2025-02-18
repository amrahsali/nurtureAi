import 'dart:convert';

import 'package:nurtureAi/core/utils/local_store_dir.dart';
import 'package:nurtureAi/core/utils/local_stotage.dart';
import 'package:stacked/stacked.dart';
import 'package:nurtureAi/app/app.locator.dart';
import 'package:nurtureAi/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/data/models/profile.dart';
import '../../../state.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    String? token = await locator<LocalStorage>().fetch(LocalStorageDir.authToken);
    String? user = await locator<LocalStorage>().fetch(LocalStorageDir.authUser);
    bool? onboarded = await locator<LocalStorage>().fetch(LocalStorageDir.onboarded);
    //bool? onboarded = false;
    if (onboarded == null || onboarded == false) {
      _navigationService.replaceWithOnboardingView();
    } else {
      if (token != null && user != null) {
        userLoggedIn.value = true;
        profile.value = Profile.fromJson(Map<String, dynamic>.from(jsonDecode(user)));
      }
      _navigationService.replaceWithHomeView();
      // _navigationService.replaceWithAuthView();
    }
  }


}
