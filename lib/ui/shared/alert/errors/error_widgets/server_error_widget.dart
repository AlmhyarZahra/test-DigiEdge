import 'package:flutter/material.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const FaIcon(FontAwesomeIcons.solidBug),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Data Unavailable",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "We're currently having trouble retrieving data from the server. Please try again later.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
