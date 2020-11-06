import 'package:bestbrownie/interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:bestbrownie/models/pedidoBrownie.dart';

class Servico extends Interface {
  static final _db = FirebaseFirestore.instance;
  Stream<List<Registro>> getList() {
    return _db.collection('produtos').snapshots().map(
      (snap) {
        return snap.docs.map((it) => Registro.fromMap(it)).toList();
      },
    );
  }

  Future<void> create(Registro registro) async {
    await _db.collection('produtos').add(registro.toMap()); //pausando a funcao
  }
}
