import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:auto/ui/shared/custom_widgets/stretch_button.dart';
import 'package:auto/ui/shared/my_images.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:auto/ui/views/login/login_controller.dart';
import 'package:auto/ui/views/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(8)),
            children: [
              Center(
                child: Padding(
                  padding:const EdgeInsetsDirectional.only(top: 30, bottom: 20),
                  child: Image.asset(
                    MyImages.logo,
                    width: screenWidth(3.5),
                  ),
                ),
              ),
              CustomText(
                textType: TextStyleType.custom,
                text: "Login",
                textColor: AppColors.purple3D0,
                fontSize: screenWidth(15),
              ),
              SizedBox(height: screenWidth(2)),
              CustomTextField(
                hintText: "Email Address",
                controller: controller.emailController,
                typeInput: TextInputType.emailAddress,
                validator: (value) {
                  return value!.isEmpty || !GetUtils.isEmail(value)
                      ? "Check your email"
                      : null;
                },
              ),
              Obx(() {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                  child: CustomTextField(
                    hintText: "Password",
                    controller: controller.passwordController,
                    obscure: controller.hiddenPass.value,
                    contentPaddingLeft: screenWidth(10),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.replacePass();
                      },
                      icon: Icon(
                        controller.hiddenPass.isTrue
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                    validator: (value) {
                      return value!.isEmpty ? "This Field is required" : null;
                    },
                  ),
                );
              }),
               Padding(
                padding: EdgeInsets.only(top: screenWidth(10), bottom: screenHeight(10)),
                child: StretchedButton(
                  onPressed: () {
                    controller.login();
                  },
                  margin: EdgeInsets.zero,
                  child: CustomText(
                    textType: TextStyleType.custom,
                    text: "Login",
                    fontSize: screenWidth(18),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    textType: TextStyleType.custom,
                    text: "Don't have an account? ",
                    fontSize: screenWidth(28),
                    textColor: AppColors.mainGreyColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(()=> const RegisterView());
                    },
                    child: CustomText(
                      textType: TextStyleType.custom,
                      text: "Register",
                      fontSize: screenWidth(28),
                      textColor: AppColors.purple3D0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
