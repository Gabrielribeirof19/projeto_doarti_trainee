import 'package:cloud_firestore/cloud_firestore.dart';

class Registro {
  String sabor;
  DocumentReference reference;

  Registro(this.sabor);

  Registro.fromMap(DocumentSnapshot document) {
    this.reference = document.reference;
    this.sabor = document.data()['sabor'];
  }
  Map<String, dynamic> toMap() => {
        "sabor": sabor,
      };
}
