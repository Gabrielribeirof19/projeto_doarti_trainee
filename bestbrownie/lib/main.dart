import 'registro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        '/registro': (context) => RegistroPage(),
      },
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BestBrownie"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: widgetImage(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/registro');
          }),
    );
  }
}

widgetImage() {
  return SizedBox.expand(
    child: Image.asset(
      "images/brownie.jpeg",
      height: 100,
      width: 100,
      fit: BoxFit.fill,
    ),
  );
}
