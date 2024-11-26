import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('jwt_token', token);
}

String ngrokLink = 'https://1f3e-177-222-46-173.ngrok-free.app';
