import 'package:flutter/material.dart';

class Teste2 extends StatefulWidget {
  const Teste2({super.key});

  @override
  State<Teste2> createState() => _Teste2State();
}

class _Teste2State extends State<Teste2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Center(
          child: Text('Teste 2'),
        ),
      ),
      body: const Center(
        child: SizedBox(
          width: 300,
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
