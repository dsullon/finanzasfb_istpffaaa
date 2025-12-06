import 'dart:convert';
import 'package:finanzasfb/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices extends ChangeNotifier {
  final String _baseURL = "istpffaafinanzas-default-rtdb.firebaseio.com";
  final String _authBaseURL = "identitytoolkit.googleapis.com";
  final String _firebaseAPIKey = "AIzaSyAc7c08IJqMtUJcRDVBLP1ASrVnMO5fI-E";

  Future<String?> crearUsuario(User user) async {
    final Map<String, dynamic> authData = {
      'email': user.email,
      'password': user.password,
    };

    final url = Uri.https(_authBaseURL, 'v1/accounts:signUp', {
      'key': _firebaseAPIKey,
    });

    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    if (data.containsKey('idToken')) {
      user.id = data["localId"];
      _crearUsuarioRTDB(user);
    }
  }

  Future<void> _crearUsuarioRTDB(User user) async {
    final Map<String, dynamic> data = {
      "email": user.email,
      "name": user.name,
      "phone": user.phone,
    };

    final url = Uri.https(_baseURL, "users/${user.id}.json");
    final response = await http.put(url, body: json.encode(data));
    final Map<String, dynamic> dataResponse = jsonDecode(response.body);
    print(dataResponse);
  }
}
