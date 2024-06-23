import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:auto/ui/shared/custom_widgets/stretch_button.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:auto/ui/views/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  ChangePasswordController controller = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple3D0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const CustomText(
          textType: TextStyleType.custom,
          text: "Change Password",
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(8)),
          child: Column(
            children: [
              Obx(() {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                  child: CustomTextField(
                    hintText: "Current password",
                    controller: controller.currentPasswordController,
                    obscure: controller.hiddenCurrentPass.value,
                    contentPaddingLeft: screenWidth(10),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.replaceCurrentPass();
                      },
                      icon: Icon(
                        controller.hiddenCurrentPass.isTrue
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
                  hintText: "New password",
                  controller: controller.newPasswordController,
                  obscure: controller.hiddenNewPass.value,
                  contentPaddingLeft: screenWidth(10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.replaceNewPass();
                    },
                    icon: Icon(
                      controller.hiddenNewPass.isTrue
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    return value!.isEmpty ? "This Field is required" : null;
                  },
                );
              }),
              Obx(() {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                  child: CustomTextField(
                    hintText: "Confirm password",
                    controller: controller.confirmPasswordController,
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
                      return value!.isEmpty || value != controller.newPasswordController.text.trim()
                          ? "Please check your password"
                          : null;
                    },
                  ),
                );
              }),
              StretchedButton(
                onPressed: () {
                  controller.changePassword();
                },
                margin: EdgeInsets.zero,
                child: CustomText(
                  textType: TextStyleType.custom,
                  text: "Save",
                  fontSize: screenWidth(18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
