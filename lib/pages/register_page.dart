import 'package:finanzasfb/widgets/auth_header_background.dart';
import 'package:finanzasfb/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
                    _FormularioRegistro(),
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
    return Form(
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
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email de contacto",
              labelText: "Email",
              prefixIcon: Icon(Icons.alternate_email),
            ),
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
            validator: (value) {
              // TODO: Validar que la contraseña sea como mínimo 6 caracteres
            },
          ),
        ],
      ),
    );
  }
}
