import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final String? productName;
  final String? price;
  final String? oldPrice;
  final String? sale;
  final String? description;
  final String? category;
  final String? imageUrl;

  const Products({
    this.id,
    this.createdAt,
    this.productName,
    this.price,
    this.oldPrice,
    this.sale,
    this.description,
    this.category,
    this.imageUrl,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json['id'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    productName: json['product_name'] as String?,
    price: json['price'] as String?,
    oldPrice: json['old_price'] as String?,
    sale: json['sale'] as String?,
    description: json['description'] as String?,
    category: json['category'] as String?,
    imageUrl: json['image_url'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'product_name': productName,
    'price': price,
    'old_price': oldPrice,
    'sale': sale,
    'description': description,
    'category': category,
    'image_url': imageUrl,
  };

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      productName,
      price,
      oldPrice,
      sale,
      description,
      category,
      imageUrl,
    ];
  }
}
