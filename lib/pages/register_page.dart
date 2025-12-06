import 'package:finanzasfb/models/models.dart';
import 'package:finanzasfb/providers/registro_form_provider.dart';
import 'package:finanzasfb/services/services.dart';
import 'package:finanzasfb/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthHeaderBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250.0),
              CardContainer(
                child: Column(
                  children: [
                    Text(
                      "Registro de usuario",
                      style: TextTheme.of(context).titleMedium,
                    ),
                    SizedBox(height: 20.0),
                    ChangeNotifierProvider(
                      create: (_) => RegistroFormProvider(),
                      child: _FormularioRegistro(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormularioRegistro extends StatelessWidget {
  const _FormularioRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    final registroForm = Provider.of<RegistroFormProvider>(context);
    return Form(
      key: registroForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Nombres",
              labelText: "Nombres",
              prefixIcon: Icon(Icons.person_2),
            ),
            onChanged: (value) => registroForm.nombre = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : "Debe ingresar un nombre";
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Teléfono de contacto",
              labelText: "Teléfono",
              prefixIcon: Icon(Icons.phone_android),
            ),
            onChanged: (value) => registroForm.telefono = value,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email de contacto",
              labelText: "Email",
              prefixIcon: Icon(Icons.alternate_email),
            ),
            onChanged: (value) => registroForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : "Ingrese un email válido";
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "***",
              labelText: "Contraseña",
              prefixIcon: Icon(Icons.lock_outline),
            ),
            onChanged: (value) => registroForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : "Debe ingresar como mínimo 6 caracteres";
            },
          ),
          SizedBox(height: 30.0),

          MaterialButton(
            color: Colors.red,
            disabledColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: registroForm.isProcessing
                ? null
                : () async {
                    if (!registroForm.isFormValid()) return;
                    registroForm.isProcessing = true;
                    final authServices = Provider.of<AuthServices>(
                      context,
                      listen: false,
                    );
                    final usuario = User(
                      email: registroForm.email,
                      name: registroForm.nombre,
                      password: registroForm.password,
                      phone: registroForm.telefono,
                    );
                    await authServices.crearUsuario(usuario);
                    registroForm.isProcessing = false;
                  },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                registroForm.isProcessing ? "Procesando" : "Registrar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
