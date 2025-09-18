import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost/backend/public/index.php?path=";

  static Future<List<dynamic>> getCategorias() async {
    final response = await http.get(Uri.parse("${baseUrl}categorias"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error al cargar categorías");
    }
  }

  static Future<void> addCategoria(String nombre) async {
    final response = await http.post(
      Uri.parse("${baseUrl}categorias"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"nombre": nombre}),
    );
    if (response.statusCode != 200) {
      throw Exception("Error al agregar categoría");
    }
  }
}
