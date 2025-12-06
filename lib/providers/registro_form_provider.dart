import 'package:flutter/material.dart';

class RegistroFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nombre = '';
  String telefono = '';
  String email = '';
  String password = '';

  bool _isProcessing = false;

  // GETTER: Recupera u obtiene el valor de la variable
  bool get isProcessing => _isProcessing;

  // SETTER: Asigna un valor a la variable
  set isProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  bool isFormValid() {
    return formKey.currentState?.validate() ?? false;
  }
}
