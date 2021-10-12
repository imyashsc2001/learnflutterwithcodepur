import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: sKey,
      appBar: AppBar(
        title: const Text('Codepur'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              sKey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.payments),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            Text('Hi'),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: const [
            Text('bill'),
          ],
        ),
      ),
      body: const Center(
        child: Text('Hi'),
      ),
    );
  }
}
