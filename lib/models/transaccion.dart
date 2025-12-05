import 'dart:convert';

class Transaccion {
  String? id;
  String descripcion;
  DateTime fecha;
  double importe;
  String tipo;

  Transaccion({
    required this.descripcion,
    required this.fecha,
    required this.importe,
    required this.tipo,
  });

  factory Transaccion.fromRawJson(String str) =>
      Transaccion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transaccion.fromJson(Map<String, dynamic> json) => Transaccion(
    descripcion: json["descripcion"],
    fecha: DateTime.parse(json["fecha"]),
    importe: json["importe"]?.toDouble(),
    tipo: json["tipo"],
  );

  Map<String, dynamic> toJson() => {
    "descripcion": descripcion,
    "fecha":
        "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
    "importe": importe,
    "tipo": tipo,
  };
}
