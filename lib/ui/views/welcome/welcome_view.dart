import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text.dart';
import 'package:auto/ui/shared/custom_widgets/stretch_button.dart';
import 'package:auto/ui/shared/my_images.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:auto/ui/views/login/login_view.dart';
import 'package:auto/ui/views/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 30, bottom: 20),
                child: Image.asset(
                  MyImages.logo,
                  width: screenWidth(3.5),
                ),
              ),
            ),
            CustomText(
              textType: TextStyleType.custom,
              text: "Welcome to the app",
              textColor: AppColors.purple3D0,
              fontSize: screenWidth(15),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight(3.5), bottom: screenHeight(40)),
              child: StretchedButton(
                onPressed: () {
                  Get.to(()=> const LoginView());
                },
                child: CustomText(
                  textType: TextStyleType.custom,
                  text: "Login",
                  fontSize: screenWidth(18),
                ),
              ),
            ),
            StretchedButton(
              onPressed: () {
                Get.to(()=> const RegisterView());
              },
              backgroundColor: Colors.white,
              borderSide: const BorderSide(),
              child: CustomText(
                textType: TextStyleType.custom,
                text: "Register",
                textColor: AppColors.purple3D0,
                fontSize: screenWidth(18),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  textType: TextStyleType.custom,
                  text: "Designed & Developed by ",
                  fontSize: screenWidth(32),
                  textColor: AppColors.mainGreyColor,
                ),
                 CustomText(
                  textType: TextStyleType.custom,
                  text: "Ali Fouad",
                  fontSize: screenWidth(32),
                  textDecoration: TextDecoration.underline,
                  textColor: AppColors.purple3D0,
                )
              ],
            ),
            SizedBox(height: screenWidth(20))
          ],
        ),
      ),
    );
  }
}
