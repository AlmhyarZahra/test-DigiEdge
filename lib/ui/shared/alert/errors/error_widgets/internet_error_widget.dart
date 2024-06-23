import 'package:flutter/material.dart';

class InternetErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const InternetErrorWidget({
    Key? key,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const FaIcon(FontAwesomeIcons.solidCloudExclamation),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Connection Error",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           const Text(
              "Unable to reach the server. Please check your internet connection and try again.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: onRetry,
              child: const Text(
                "Retry",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
