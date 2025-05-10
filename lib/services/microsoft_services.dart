import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MicrosoftCalendarService {
  static final String clientId = '8ece250d-efbb-4b1e-bc5f-00ac565bb5ed';
  static final String tenantId = '4160f0e9-d172-40c6-83c8-099d42f2d9a5';
  static final String authority = 'https://login.microsoftonline.com/$tenantId';
  static final String redirectUri = 'msauth://com.example.app/YOUR_SIGNATURE_HASH'; // Replace with valid hash
  static final List<String> scopes = ['https://graph.microsoft.com/Calendars.Read'];

  static final FlutterAppAuth appAuth = FlutterAppAuth();

  static Future<void> signInAndFetchCalendar() async {
    try {
      final AuthorizationTokenResponse result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUri,
          issuer: 'https://login.microsoftonline.com/$tenantId/v2.0',
          scopes: scopes,
          promptValues: ['login'], // Forces re-authentication
        ),
      );

      if (result.accessToken != null) {
        print('✅ Sign In Successful! Token: ${result.accessToken}');
        await fetchCalendarEvents(result.accessToken!);
      } else {
        print('❌ Sign In Failed!');
      }
    } catch (e) {
      print('❌ Error during sign-in: $e');
    }
  }

  static Future<void> fetchCalendarEvents(String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse('https://graph.microsoft.com/v1.0/me/events'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('✅ Calendar Events: $data');
      } else {
        print('❌ Failed to fetch events: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('❌ Error fetching calendar events: $e');
    }
  }
}