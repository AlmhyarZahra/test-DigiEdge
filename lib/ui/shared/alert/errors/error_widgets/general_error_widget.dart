import 'package:flutter/material.dart';

class GeneralErrorWidget extends StatelessWidget {
  const GeneralErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const FaIcon(FontAwesomeIcons.solidCircleExclamation),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Something Went Wrong",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           const Text(
              "An unexpected error occurred. Please try again later or contact support.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
