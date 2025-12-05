import 'package:finanzasfb/services/transaccion_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final transaccionesSVC = Provider.of<TransaccionServices>(context);
    final transacciones = transaccionesSVC.transacciones;
    return Scaffold(
      appBar: AppBar(title: Text("Finanzas Personales")),
      body: Column(
        children: [
          Text("Movimientos"),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: transacciones.length,
              itemBuilder: (context, index) {
                final transaccion = transacciones[index];
                return ListTile(
                  title: Text(transaccion.descripcion),
                  subtitle: Text(transaccion.fecha.toIso8601String()),
                  trailing: Text(
                    transaccion.importe.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: transaccion.tipo == "E"
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
