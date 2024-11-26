import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:objetos_perdidos/services/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> updateLostItem({
  required String lostItemId,
  required String name,
  required String description,
  required String image,
  required bool found,
  required String status,
}) async {
  final url = Uri.parse('$ngrokLink/api/lost-items/$lostItemId');

  // Obtener el token de SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Agregar encabezado de autorización
      'ngrok-skip-browser-warning': 'true',
    },
    body: jsonEncode({
      "name": name,
      "description": description,
      "image": image,
      "found": found,
      "status": status,
    }),
  );

  if (response.statusCode == 200) {
    print('Respuesta del servidor: ${response.body}');
    print('Objeto perdido actualizado con éxito');
  } else {
    throw Exception('Error al actualizar el objeto perdido: ${response.body}');
  }
}
