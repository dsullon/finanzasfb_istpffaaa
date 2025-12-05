import 'dart:convert';

import 'package:finanzasfb/models/transaccion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransaccionServices extends ChangeNotifier {
  final String _baseURL = "istpffaafinanzas-default-rtdb.firebaseio.com";

  final List<Transaccion> transacciones = [];

  TransaccionServices() {
    cargarTransacciones();
  }

  Future cargarTransacciones() async {
    final url = Uri.https(_baseURL, "transacciones.json");
    final respuesta = await http.get(url);
    final Map<String, dynamic> transaccionesMap = jsonDecode(respuesta.body);
    transaccionesMap.forEach((key, value) {
      final transaccion = Transaccion.fromJson(value);
      transaccion.id = key;
      transacciones.add(transaccion);
    });

    print(transacciones);
    notifyListeners();
  }
}
