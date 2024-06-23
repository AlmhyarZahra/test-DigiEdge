import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/custom_widgets/custom_text.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class HomeBubble extends StatelessWidget {
  final IconData iconData;
  final String title;
  const HomeBubble({super.key, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(25),vertical: screenWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: AppColors.purple3D0,
          ),
          SizedBox(width: screenWidth(30)),
          Flexible(
            child: CustomText(
              textType: TextStyleType.custom,
              text: title,
              overflow: TextOverflow.ellipsis,
              fontSize: screenWidth(23),
              textColor: AppColors.mainGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
