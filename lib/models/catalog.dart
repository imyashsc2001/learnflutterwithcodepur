class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  final products = [
    Item(
      id: 'id1',
      name: 'iPhone12 Pro',
      desc: 'Apple iPhone 12th generation',
      price: 75000,
      color: '#33505A',
      image:
          'data:image/jpeg;base64,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',
    ),
  ];
}