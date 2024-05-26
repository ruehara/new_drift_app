import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Teste'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                OutlinedButton(
                  child: const Text('Push'),
                  onPressed: () => context.push('/teste2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
