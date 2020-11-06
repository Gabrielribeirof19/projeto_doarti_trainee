import 'dart:async';
import 'package:bestbrownie/models/pedidoBrownie.dart';
import 'package:bestbrownie/servico/firebase.dart';

class MyBloc {
  final _controller = StreamController<List<Registro>>();

  Sink<List<Registro>> get input => _controller.sink;
  Stream<List<Registro>> get output => _controller.stream;

  MyBloc(Servico service) {
    service.getList().listen(
      (event) {
        input.add(event);
      },
    );
  }
  dispose() {
    _controller.close();
  }

  create(String sabor) async {
    await Servico().create(Registro(sabor));
  }

  delete(Registro item) {
    item.reference.delete();
  }
}
