import 'package:avaliacao_framework_shop/app_styles/app_assets.dart';

class Product {
  final String id;
  final String name;
  final double price;
  int quantity;
  final String imageAsset;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageAsset,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    String? imageAsset,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageAsset: imageAsset ?? this.imageAsset,
    );
  }
}

List<Product> products = [
  Product(
    id: '1',
    name: 'Maçã',
    price: 6.49,
    quantity: 1,
    imageAsset: AppAssets.apple,
  ),
  Product(
    id: '2',
    name: 'Banana',
    price: 4.25,
    quantity: 1,
    imageAsset: AppAssets.banana,
  ),
  Product(
    id: '3',
    name: 'Manga',
    price: 9.39,
    quantity: 1,
    imageAsset: AppAssets.mango,
  ),
  Product(
    id: '4',
    name: 'Pera',
    price: 12.72,
    quantity: 1,
    imageAsset: AppAssets.pear,
  ),
  Product(
    id: '5',
    name: 'Abacaxi',
    price: 4.62,
    quantity: 1,
    imageAsset: AppAssets.pineapple,
  )
];
