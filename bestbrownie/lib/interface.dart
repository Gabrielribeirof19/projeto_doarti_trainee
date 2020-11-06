import 'models/pedidoBrownie.dart';

abstract class Interface {
  Stream<List<Registro>> getList();
  Future<void> create(Registro registro);
}
