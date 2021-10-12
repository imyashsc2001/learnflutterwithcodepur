import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codepur/models/catalog.dart';
import 'package:flutter_codepur/widgets/item_widget.dart';
import 'package:flutter_codepur/widgets/main_drawer.dart';

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
            icon: const Icon(CupertinoIcons.money_dollar_circle),
          )
        ],
      ),
      drawer: MainDrawer(),
      endDrawer: Drawer(
        child: Column(
          children: const [
            Text('bill'),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: CatalogModel.products.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.products[index],
            );
          }),
    );
  }
}
