import 'registraBloc.dart';
import 'package:bestbrownie/servico/firebase.dart';
import 'package:flutter/material.dart';
import 'package:bestbrownie/models/pedidoBrownie.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  MyBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = MyBloc(Servico());
    return Scaffold(
      appBar: AppBar(
        title: Text("Seu pedido"),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<List<Registro>>(
        initialData: [],
        stream: _bloc.output,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Erro ${snapshot.error}");
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext _, int index) {
              final item = snapshot.data[index];
              return Center(
                child: ListTile(
                  trailing: IconButton(
                      icon: Icon(Icons.dangerous),
                      onPressed: () {
                        _bloc.delete(item);
                      },
                      color: Colors.red[700]),
                  title: Text(
                    item.sabor,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () {
          _showDialog(context);
        },
      ),
    );
  }

  _showDialog(BuildContext context) {
    final _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Adicione o sabor de brownie desejado"),
          content: TextField(
            controller: _controller,
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar")),
            FlatButton(
                onPressed: () {
                  _bloc.create(_controller.text);
                  Navigator.pop(context);
                },
                child: Text("Salvar")),
          ],
        );
      },
    );
  }
}
