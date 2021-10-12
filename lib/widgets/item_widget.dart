import 'package:flutter/material.dart';
import 'package:flutter_codepur/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  // final VoidCallback onTap;
  final Function(Item item) onItemClicked;
  final bool isGrid;

  const ItemWidget({
    Key? key,
    required this.onItemClicked,
    required this.isGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> items = CatalogModel.products;
    return isGrid
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Hero(
                        tag: Key(item.id.toString()),
                        child: Image.network(item.image),
                      ),
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
                              Text(
                                '\$ ${item.price}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  onItemClicked(item);
                                },
                                child: const Text('Details >'),
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
          )
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Card(
                margin: const EdgeInsets.all(4),
                child: ListTile(
                  onTap: () {
                    onItemClicked(item);
                  },
                  tileColor: Colors.white,
                  leading: Hero(
                    tag: Key(item.id.toString()),
                    child: Image.network(item.image),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.desc),
                  trailing: Text(
                    '\$ ${item.price}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
