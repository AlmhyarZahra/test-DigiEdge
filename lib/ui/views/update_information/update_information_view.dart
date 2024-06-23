import 'package:auto/core/utils/general_util.dart';
import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:auto/ui/shared/custom_widgets/stretch_button.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:auto/ui/views/update_information/update_information_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateInformationView extends StatefulWidget {
  const UpdateInformationView({super.key});

  @override
  State<UpdateInformationView> createState() => _UpdateInformationViewState();
}

class _UpdateInformationViewState extends State<UpdateInformationView> {
  UpdateInformationController controller = Get.put(UpdateInformationController());
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
          text: "Update Information",
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(8)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                child: CustomTextField(
                  hintText: "Full Name",
                  controller: controller.nameController,
                  validator: (value) {
                    return value!.isEmpty ? "This Field is required" : null;
                  },
                ),
              ),
              CustomTextField(
                  controller: controller.phoneController,
                  textAlign: TextAlign.start,
                  typeInput: TextInputType.number,
                  prefixIcon: CountryCodePicker(
                    initialSelection: storage.getUser().countryCode,
                    onChanged: (value) {
                      controller.countryCode.value = value.dialCode!;
                    },
                  ),
                  hintText: "55994435",
                  validator: (value) {
                    return value!.isEmpty ? "This Field is required" : null;
                  }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                child: CustomTextField(
                  hintText: "Email Address",
                  controller: controller.emailController,
                  typeInput: TextInputType.emailAddress,
                  validator: (value) {
                    return value!.isEmpty || !GetUtils.isEmail(value)
                        ? "Check your email"
                        : null;
                  },
                ),
              ),
              StretchedButton(
                onPressed: () {
                  controller.updateInformation();
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
