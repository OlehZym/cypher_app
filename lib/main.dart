import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Cypher App';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
       //   backgroundColor: Color.fromARGB(255, 223, 248, 248),
         ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final controller = TextEditingController();
  final int shift = 5;
  //int symbol = - ;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            onChanged: (value) => {controller.text = cypherValue(value)},
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Введите текст',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: controller, 
            readOnly: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Закодированный текст', 
            ),
          ),
        ),
      ],
    );
  }

  String cypherValue(String value) {
    String result = '';
    for (var i = 0; i < value.length; i++) {
      String letter = value[i];
      int code = letter.codeUnitAt(0);
      int newCode = code + shift;
      result += String.fromCharCode(newCode);
    }

    return result;
  }
}
