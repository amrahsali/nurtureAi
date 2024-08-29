import 'package:nurtureAi/app/app.locator.dart';
import 'package:nurtureAi/app/app.router.dart';
import 'package:nurtureAi/ui/common/app_colors.dart';
import 'package:nurtureAi/ui/common/ui_helpers.dart';
import 'package:nurtureAi/ui/components/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        color: kcPrimaryColor, // Set the background color to white
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: PageView(
                  controller: viewModel.pageController,
                  onPageChanged: viewModel.onPageChanged,
                  children: viewModel.pages,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(OnboardingViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();

  Widget indicator(bool selected) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: selected ? 5 : 8,
      width: selected ? 20 : 8,
      decoration: BoxDecoration(
        color: selected ? kcPrimaryColor : kcLightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceLarge,
            ],
          ),
        ),
        Positioned(
          bottom: 300.0, // Adjust this value as needed
          left: 0,
          right: 25,
          child: Image.asset("assets/images/Healthcare.png"),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: buildBottomSheet(context),
        ),
      ],
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: 360, // Adjust the height as needed
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Health.png"),
              verticalSpaceLarge,
              Text(
                'Our innovative health tech platform  offers a comprehensive suite of  features  to improve patient care and  streamline healthcare processet',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(),
              SubmitButton(
                isLoading: false,
                label: "Get Started",
                submit: () {
                  locator<NavigationService>()
                      .clearStackAndShow(Routes.onboardingView2);
                },
                color: kcPrimaryColor,
                boldText: true,
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
