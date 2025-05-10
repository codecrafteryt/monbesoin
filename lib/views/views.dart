  import 'package:flutter/material.dart';
import 'package:monbesoin_app/services/microsoft_services.dart';

  class Views extends StatelessWidget {
    const Views({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                MicrosoftCalendarService.signInAndFetchCalendar();
              },
              child: Text('Fetch Calendar Events'),
            )

          ],
        ),
      );
    }
  }
