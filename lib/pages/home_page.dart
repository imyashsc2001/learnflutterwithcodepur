import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codepur/models/catalog.dart';
import 'package:flutter_codepur/widgets/item_widget.dart';
import 'package:flutter_codepur/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadDate();
  }

  loadDate() async {
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    setState(() {
      CatalogModel.products = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var sKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: sKey,
      appBar: AppBar(
        title: const Text(
          'Codepur Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
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
      drawer: const MainDrawer(),
      endDrawer: Drawer(
        child: Column(
          children: const [
            Text('bill'),
          ],
        ),
      ),
      body: CatalogModel.products.isNotEmpty
          ? getListView()
          : const Center(child: CircularProgressIndicator()),
    );
  }

  getListView() {
    // return ListView.builder(
    //     itemCount: CatalogModel.products.length,
    //     itemBuilder: (context, index) {
    //       return ItemWidget(
    //         item: CatalogModel.products[index],
    //       );
    //     });

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: CatalogModel.products.length,
      itemBuilder: (context, index) {
        var item = CatalogModel.products[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.network(item.image),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.name),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('\$ ${item.price}'),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Buy'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
