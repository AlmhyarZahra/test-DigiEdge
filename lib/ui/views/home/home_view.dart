import 'package:auto/core/utils/general_util.dart';
import 'package:auto/ui/shared/alert/feedback/app_feedback.dart';
import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:auto/ui/views/change_password/change_password_view.dart';
import 'package:auto/ui/views/home/home_controller.dart';
import 'package:auto/ui/views/home/widgets/home_bubble.dart';
import 'package:auto/ui/views/home/widgets/home_card.dart';
import 'package:auto/ui/views/update_information/update_information_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple3D0,
        centerTitle: true,
        title: const CustomText(textType: TextStyleType.custom, text: "Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth(25)),
          HomeBubble(
            iconData: Icons.person_outline_rounded,
            title: storage.getUser().name!,
          ),
          HomeBubble(
            iconData: Icons.phone_android_rounded,
            title: "${storage.getUser().countryCode} ${storage.getUser().phone}",
          ),
          HomeBubble(
            iconData: Icons.email_outlined,
            title: storage.getUser().email!,
          ),
          HomeCard(
            onTap: () {
              Get.to(() => const UpdateInformationView());
            },
            title: "Update Information",
          ),
          HomeCard(
            onTap: () {
              Get.to(() => const ChangePasswordView());
            },
            title: "Change Password",
          ),
          HomeCard(
            onTap: () {
              context.showDialog(
                titleText: "Delete Account?",
                bodyText: "Are you sure you want to delete your account?",
                onPressed: () {
                  controller.deleteAccount();
                },
              );
            },
            title: "Delete Account",
          ),
          HomeCard(
            onTap: () {
              context.showDialog(
                titleText: "Logout?",
                bodyText: "Are you sure you want to log out?",
                onPressed: () {
                  controller.logout();
                },
              );
            },
            title: "Logout",
          ),
        ],
      ),
    );
  }
}
