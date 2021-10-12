import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codepur/models/catalog.dart';
import 'package:flutter_codepur/pages/item_details_page.dart';
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
            icon: const Icon(CupertinoIcons.cart),
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
          ? ItemWidget(
              onItemClicked: (item) {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsPage(item: item,),),),)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsPage(item: item),
                  ),
                );
              },
              //isGrid: false,
              isGrid: true,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
