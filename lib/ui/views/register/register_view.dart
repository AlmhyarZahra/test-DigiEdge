
import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:auto/ui/shared/custom_widgets/stretch_button.dart';
import 'package:auto/ui/shared/my_images.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:auto/ui/views/login/login_view.dart';
import 'package:auto/ui/views/register/register_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController controller = Get.put(RegisterController());
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
                  padding: const EdgeInsetsDirectional.only(top: 30, bottom: 20),
                  child: Image.asset(
                    MyImages.logo,
                    width: screenWidth(3.5),
                  ),
                ),
              ),
              CustomText(
                textType: TextStyleType.custom,
                text: "Register",
                textColor: AppColors.purple3D0,
                fontSize: screenWidth(15),
              ),
              SizedBox(height: screenWidth(10)),
              CustomTextField(
                hintText: "Full Name",
                controller: controller.nameController,
                validator: (value) {
                  return value!.isEmpty ? "This Field is required" : null;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                child: CustomTextField(
                    controller: controller.phoneController,
                    textAlign: TextAlign.start,
                    typeInput: TextInputType.number,
                    prefixIcon: CountryCodePicker(
                      initialSelection: 'AE',
                      onChanged: (value) {
                        controller.countryCode.value = value.dialCode!;
                      },
                    ),
                    hintText: "55994435",
                    validator: (value) {
                      return value!.isEmpty ? "This Field is required" : null;
                    }),
              ),
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
              Obx(() {
                return CustomTextField(
                  hintText: "Confirm Password",
                  controller: controller.confirmPassController,
                  obscure: controller.hiddenConfirmPass.value,
                  contentPaddingLeft: screenWidth(10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.replaceConfirmPass();
                    },
                    icon: Icon(
                      controller.hiddenConfirmPass.isTrue
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    return value!.isEmpty ||  value != controller.passwordController.text.trim()
                        ? "Please check your password"
                        : null;
                  },
                );
              }),
              Padding(
                padding: EdgeInsets.only(top: screenWidth(10), bottom: screenHeight(20)),
                child: StretchedButton(
                  onPressed: () {
                    controller.register();
                  },
                  margin: EdgeInsets.zero,
                  child: CustomText(
                    textType: TextStyleType.custom,
                    text: "Register",
                    fontSize: screenWidth(18),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    textType: TextStyleType.custom,
                    text: "Already have an account? ",
                    fontSize: screenWidth(28),
                    textColor: AppColors.mainGreyColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(()=> const LoginView());
                    },
                    child: CustomText(
                      textType: TextStyleType.custom,
                      text: "Login",
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
