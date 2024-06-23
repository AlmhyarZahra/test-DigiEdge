import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const HomeCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(45), vertical: screenWidth(55)),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 2,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: double.infinity,
            height: screenHeight(16),
            padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.purple3D0,
                      fontSize: screenWidth(20),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.purple3D0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
